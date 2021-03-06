import Foundation
import BTKit

class DiscoverTableConfigurator {
    func configure(view: DiscoverTableViewController) {
        let r = AppAssembly.shared.assembler.resolver
        
        let router = DiscoverRouter()
        router.transitionHandler = view
        
        let presenter = DiscoverPresenter()
        presenter.view = view
        presenter.router = router
        presenter.realmContext = r.resolve(RealmContext.self)
        presenter.errorPresenter = r.resolve(ErrorPresenter.self)
        presenter.ruuviTagService = r.resolve(RuuviTagService.self)
        presenter.scanner = r.resolve(BTScanner.self)
        
        view.output = presenter
    }
}
