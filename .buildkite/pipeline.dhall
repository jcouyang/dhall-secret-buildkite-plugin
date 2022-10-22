let bk =
      https://raw.githubusercontent.com/jcouyang/buildkite.dhall/0.3.0/package.dhall
        sha256:58893f017494437f31e55ef37f71cdd53eac3d7f11f9be85dcf63fa22a101a62

let test =
      bk.Command::{
      , label = Some "test"
      , commands =
        [ ''
          dhall-secret encrypt <<< 'let dhall-secret = https://github.com/jcouyang/dhall-secret/raw/v0.4.32/Type.dhall
          in dhall-secret.AgeDecrypted
                { Recipients =
                  [ "age1rl8j26etwulmav6yn8p4huu6944n7hsr2pyu2dr0evjzsj2tq92q48arjp" ]
                , PlainText = "hello age!"
                }'
          ''
        ]
      , plugins = Some
        [ toMap
            { jcouyang/dhall-secret = toMap
                { os = bk.PluginConfigValue.L0 "linux" }
            }
        ]
      }

in  [ test ]
