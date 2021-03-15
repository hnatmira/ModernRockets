//
//  RocketListVM.swift
//  ModernRockets
//
//  Created by Miroslav Hnát on 15.03.2021.
//

import RxSwift
import RxCocoa


class RocketListVM {
    
    var rockets = [Rocket]()
    var disposeBag = DisposeBag()
    
    func fetchData(callback:(() -> Void)?) {
        
        URLSession.shared.rx
            .data(request: URLRequest(url: URL(string: "https://api.spacexdata.com/v3/rockets")!))
            .map { try JSONDecoder().decode([Rocket].self, from: $0) }
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] (data) in
                print(data)
                
                self?.rockets = data
                callback?()
                
            }).disposed(by: disposeBag)
    }
    
}
