//
//  News.swift
//  Stage2_Lection1a_AntonChebaniuk
//
//  Created by Anton Chebaniuk on 24.01.2021.
//

import Foundation

struct NewsHeader {
    var avatar: String
    var userName: String
    var publicationDate: String
}

struct NewsContext {
    var article: String
    var mainImage: String
}

let newsHeader = [
    NewsHeader(avatar: "mal1", userName: "Robert Patrik", publicationDate: "15.08.2020"),
    NewsHeader(avatar: "mal2", userName: "Daniel Borg", publicationDate: "19.08.2020"),
    NewsHeader(avatar: "fem1", userName: "Suzi Simpson", publicationDate: "20.08.2020"),
    NewsHeader(avatar: "fem2", userName: "Deria Glower", publicationDate: "21.08.2020")
]

let newsContext = [
    NewsContext(article: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.", mainImage: "news1"),
    NewsContext(article: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.", mainImage: "news2"),
    NewsContext(article: "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur", mainImage: "news3"),
    NewsContext(article: "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur", mainImage: "news4")
]

