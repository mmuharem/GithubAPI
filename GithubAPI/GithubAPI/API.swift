//  This file was automatically generated and should not be edited.

import Apollo

public final class GetRepositoryCommitHistoryQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetRepositoryCommitHistory {\n  repository(owner: \"mmuharem\", name: \"GithubAPI\") {\n    __typename\n    id\n    ref(qualifiedName: \"master\") {\n      __typename\n      target {\n        __typename\n        ... on Commit {\n          id\n          history(first: 25) {\n            __typename\n            pageInfo {\n              __typename\n              hasNextPage\n            }\n            edges {\n              __typename\n              node {\n                __typename\n                messageHeadline\n                oid\n                message\n                author {\n                  __typename\n                  name\n                  email\n                  date\n                }\n              }\n            }\n          }\n        }\n      }\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("repository", arguments: ["owner": "mmuharem", "name": "GithubAPI"], type: .object(Repository.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(repository: Repository? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "repository": repository.flatMap { (value: Repository) -> ResultMap in value.resultMap }])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (resultMap["repository"] as? ResultMap).flatMap { Repository(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes = ["Repository"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("ref", arguments: ["qualifiedName": "master"], type: .object(Ref.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, ref: Ref? = nil) {
        self.init(unsafeResultMap: ["__typename": "Repository", "id": id, "ref": ref.flatMap { (value: Ref) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// Fetch a given ref from the repository
      public var ref: Ref? {
        get {
          return (resultMap["ref"] as? ResultMap).flatMap { Ref(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "ref")
        }
      }

      public struct Ref: GraphQLSelectionSet {
        public static let possibleTypes = ["Ref"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("target", type: .nonNull(.object(Target.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(target: Target) {
          self.init(unsafeResultMap: ["__typename": "Ref", "target": target.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The object the ref points to.
        public var target: Target {
          get {
            return Target(unsafeResultMap: resultMap["target"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "target")
          }
        }

        public struct Target: GraphQLSelectionSet {
          public static let possibleTypes = ["Commit", "Tree", "Blob", "Tag"]

          public static let selections: [GraphQLSelection] = [
            GraphQLTypeCase(
              variants: ["Commit": AsCommit.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeTree() -> Target {
            return Target(unsafeResultMap: ["__typename": "Tree"])
          }

          public static func makeBlob() -> Target {
            return Target(unsafeResultMap: ["__typename": "Blob"])
          }

          public static func makeTag() -> Target {
            return Target(unsafeResultMap: ["__typename": "Tag"])
          }

          public static func makeCommit(id: GraphQLID, history: AsCommit.History) -> Target {
            return Target(unsafeResultMap: ["__typename": "Commit", "id": id, "history": history.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var asCommit: AsCommit? {
            get {
              if !AsCommit.possibleTypes.contains(__typename) { return nil }
              return AsCommit(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap = newValue.resultMap
            }
          }

          public struct AsCommit: GraphQLSelectionSet {
            public static let possibleTypes = ["Commit"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("history", arguments: ["first": 25], type: .nonNull(.object(History.selections))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, history: History) {
              self.init(unsafeResultMap: ["__typename": "Commit", "id": id, "history": history.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// The linear commit history starting from (and including) this commit, in the same order as `git log`.
            public var history: History {
              get {
                return History(unsafeResultMap: resultMap["history"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "history")
              }
            }

            public struct History: GraphQLSelectionSet {
              public static let possibleTypes = ["CommitHistoryConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
                GraphQLField("edges", type: .list(.object(Edge.selections))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(pageInfo: PageInfo, edges: [Edge?]? = nil) {
                self.init(unsafeResultMap: ["__typename": "CommitHistoryConnection", "pageInfo": pageInfo.resultMap, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Information to aid in pagination.
              public var pageInfo: PageInfo {
                get {
                  return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
                }
              }

              /// A list of edges.
              public var edges: [Edge?]? {
                get {
                  return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
                }
                set {
                  resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
                }
              }

              public struct PageInfo: GraphQLSelectionSet {
                public static let possibleTypes = ["PageInfo"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(hasNextPage: Bool) {
                  self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// When paginating forwards, are there more items?
                public var hasNextPage: Bool {
                  get {
                    return resultMap["hasNextPage"]! as! Bool
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "hasNextPage")
                  }
                }
              }

              public struct Edge: GraphQLSelectionSet {
                public static let possibleTypes = ["CommitEdge"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .object(Node.selections)),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(node: Node? = nil) {
                  self.init(unsafeResultMap: ["__typename": "CommitEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The item at the end of the edge.
                public var node: Node? {
                  get {
                    return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "node")
                  }
                }

                public struct Node: GraphQLSelectionSet {
                  public static let possibleTypes = ["Commit"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("messageHeadline", type: .nonNull(.scalar(String.self))),
                    GraphQLField("oid", type: .nonNull(.scalar(String.self))),
                    GraphQLField("message", type: .nonNull(.scalar(String.self))),
                    GraphQLField("author", type: .object(Author.selections)),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(messageHeadline: String, oid: String, message: String, author: Author? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Commit", "messageHeadline": messageHeadline, "oid": oid, "message": message, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The Git commit message headline
                  public var messageHeadline: String {
                    get {
                      return resultMap["messageHeadline"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "messageHeadline")
                    }
                  }

                  /// The Git object ID
                  public var oid: String {
                    get {
                      return resultMap["oid"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "oid")
                    }
                  }

                  /// The Git commit message
                  public var message: String {
                    get {
                      return resultMap["message"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "message")
                    }
                  }

                  /// Authorship details of the commit.
                  public var author: Author? {
                    get {
                      return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
                    }
                    set {
                      resultMap.updateValue(newValue?.resultMap, forKey: "author")
                    }
                  }

                  public struct Author: GraphQLSelectionSet {
                    public static let possibleTypes = ["GitActor"]

                    public static let selections: [GraphQLSelection] = [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("name", type: .scalar(String.self)),
                      GraphQLField("email", type: .scalar(String.self)),
                      GraphQLField("date", type: .scalar(String.self)),
                    ]

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(name: String? = nil, email: String? = nil, date: String? = nil) {
                      self.init(unsafeResultMap: ["__typename": "GitActor", "name": name, "email": email, "date": date])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// The name in the Git commit.
                    public var name: String? {
                      get {
                        return resultMap["name"] as? String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "name")
                      }
                    }

                    /// The email in the Git commit.
                    public var email: String? {
                      get {
                        return resultMap["email"] as? String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "email")
                      }
                    }

                    /// The timestamp of the Git action (authoring or committing).
                    public var date: String? {
                      get {
                        return resultMap["date"] as? String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "date")
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class GetViewerQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetViewer {\n  viewer {\n    __typename\n    login\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer) {
      self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
    }

    /// The currently authenticated user.
    public var viewer: Viewer {
      get {
        return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("login", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(login: String) {
        self.init(unsafeResultMap: ["__typename": "User", "login": login])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The username used to login.
      public var login: String {
        get {
          return resultMap["login"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "login")
        }
      }
    }
  }
}