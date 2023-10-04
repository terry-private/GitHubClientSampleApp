import SwiftUI
import Store

public struct SearchView: View {
    @StateObject var viewState: SearchViewState = .init(tokenStore: .forProduction, searchRepositoriesStore: .forProduction)
    public init() {}
    
    public var body: some View {
        if viewState.isShowInputTokenView {
            SecureField("GitHub tokenを入力", text: $viewState.inputToken)
            Button {
                viewState.tokenSetButtonTapped()
            } label: {
                Text("set!!")
                    .padding(4)
            }
        } else {
            VStack {
                if viewState.isFetching {
                    ProgressView()
                        .padding(20)
                    Button {
                        viewState.cancel()
                    } label: {
                        Text("キャンセル")
                    }
                    Spacer()
                } else {
                    List {
                        ForEach(viewState.repositories) { repository in
                            Cell(repository: repository)
                                .background {
                                    NavigationLink(
                                        destination: {
                                            Text(repository.name)
                                        },
                                        label: { EmptyView() })
                                }
                        }
                    }
                    .listStyle(GroupedListStyle())
                }
            }
            .searchable(
                text: $viewState.searchWord,
                placement: .navigationBarDrawer, prompt: Text("リポジトリを検索")
            )
            .onSubmit(of: .search) {
                viewState.searchButtonTapped()
            }
            .navigationTitle("リポジトリ")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
