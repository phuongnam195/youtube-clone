//
//  ServiceLocator.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 2/7/24.
//

class ServiceLocator {
    private lazy var services: Dictionary<String, Any> = [:]
    private lazy var lazyServices: Dictionary<String, () -> Any> = [:]
    
    func register(_ service: Any) {
        services[typeName(service)] = service
    }
    
    func register<T>(_ type: T.Type, with service: Any) {
        let name = typeName(T.self)
        services[name] = service
        print("Service '\(name)' is registered in ServiceLocator")
    }
    
    func registerLazy<T>(_ factory: @escaping () -> T) {
        let name = typeName(T.self)
        lazyServices[name] = factory
        print("Service '\(name)' is lazily registered in ServiceLocator")
    }
    
    func resetLazy<T>(_ type: T.Type) {
        let name = typeName(T.self)
        
        if (lazyServices[name] != nil) {
            services.removeValue(forKey: typeName(type))
            print("Service '\(name)' is lazily registered in ServiceLocator")
        } else {
            print("Not found service '\(name)' in ServiceLocator")
        }
        
    }
    
    func get<T>(_: T.Type) -> T {
        let key = typeName(T.self)
        
        if let service = services[key] as? T {
            return service
        }
        
        if (lazyServices[key] == nil) {
            print("Service '\(key)' is not registed in ServiceLocator")
        }
        
        let factory = lazyServices[key]!
        
        let service = factory() as? T
        
        if (service == nil) {
            print("Service '\(key)' is not registed in ServiceLocator")
        }
        
        services[key] = service!
        return service!
    }
    
    private func typeName(_ some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }
}
