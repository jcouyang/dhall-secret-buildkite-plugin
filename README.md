# Dhall Secret Buildkite Plugin

[![Build status](https://badge.buildkite.com/9035899dca8d447d6a482776b4d539a8f66f70732fce0b7c10.svg)](https://buildkite.com/jcouyang/dhall-secret-buildkite-plugin)

Example:
```
- command: |
      dhall-secret encrypt <<< 'let dhall-secret = https://github.com/jcouyang/dhall-secret/raw/v0.4.32/Type.dhall
      in dhall-secret.AgeDecrypted
            { Recipients =
              [ "age1rl8j26etwulmav6yn8p4huu6944n7hsr2pyu2dr0evjzsj2tq92q48arjp" ]
            , PlainText = "hello age!"
            }'
  label: test
  plugins:
    - "jcouyang/dhall-secret#main":
        os: linux
```
