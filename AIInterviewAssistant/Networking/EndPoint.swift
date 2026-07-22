import Foundation

enum Endpoint {
    
    case chat(ChatRequest)
    case gemini(GeminiRequest)
    
    var path: String {
        switch self {
        case .chat:
            return "/chat/completions"
        case .gemini:
            return "/models/\(APIConstant.model):generateContent?key=\(APIConstant.apiKey)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .chat, .gemini:
            return .post
        }
    }
    
    var url: URL {
        URL(string: APIConstant.baseURL + path)!
    }
    
    var headers: [String: String] {
        [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(APIConstant.apiKey)"
        ]
    }
    
    var body: Data? {
        
        switch self {
            
        case .chat(let request):
            return try? JSONEncoder().encode(request)
        case .gemini(let request):
            return try? JSONEncoder().encode(request)
        }
   
    }
}
extension Endpoint {
    
    func makeRequest() -> URLRequest {
        
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        
        headers.forEach {
            request.setValue(
                $0.value,
                forHTTPHeaderField: $0.key
            )
        }
        
        request.httpBody = body
        
        return request
    }
}
