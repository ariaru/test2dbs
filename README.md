# README

This is a sample app to reproduce an issue that occurred when we tried to use the handcuffs gem with an application
that connects to two DBs with different sets of migrations.

When trying to run handcuffs' rake tasks, e.g. `bundle exec rake 'handcuffs:migrate[pre_restart]' --trace`, I get
```
** Invoke handcuffs:migrate (first_time)
** Invoke environment (first_time)
** Execute environment
** Execute handcuffs:migrate
** Invoke db:migrate (first_time)
** Invoke db:load_config (first_time)
** Invoke environment (first_time)
** Execute environment
** Execute db:load_config
** Execute db:migrate
rake aborted!
LoadError: cannot load such file -- db/migrate_other/20211026195842_create_handcuffs_other_tests.rb
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:23:in `require'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:23:in `block in require_with_bootsnap_lfi'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/loaded_features_index.rb:89:in `register'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:22:in `require_with_bootsnap_lfi'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bootsnap-1.9.1/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:44:in `require'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/zeitwerk-2.5.1/lib/zeitwerk/kernel.rb:35:in `require'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/handcuffs-1.4.1/lib/handcuffs/phase_filter.rb:25:in `block in proxies_with_migrations'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/handcuffs-1.4.1/lib/handcuffs/phase_filter.rb:24:in `map'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/handcuffs-1.4.1/lib/handcuffs/phase_filter.rb:24:in `proxies_with_migrations'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/handcuffs-1.4.1/lib/handcuffs/phase_filter.rb:11:in `filter'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/handcuffs-1.4.1/lib/tasks/handcuffs.rake:42:in `runnable'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/migration.rb:1302:in `migrate_without_lock'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/migration.rb:1251:in `block in migrate'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/migration.rb:1401:in `block in with_advisory_lock'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/migration.rb:1416:in `block in with_advisory_lock_connection'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/connection_adapters/abstract/connection_pool.rb:462:in `with_connection'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/migration.rb:1416:in `with_advisory_lock_connection'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/migration.rb:1397:in `with_advisory_lock'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/migration.rb:1251:in `migrate'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/migration.rb:1086:in `up'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/migration.rb:1061:in `migrate'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/tasks/database_tasks.rb:237:in `migrate'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/railties/databases.rake:92:in `block (3 levels) in <main>'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/railties/databases.rake:90:in `each'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/activerecord-6.1.4.1/lib/active_record/railties/databases.rake:90:in `block (2 levels) in <main>'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `block in execute'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `each'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `execute'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:219:in `block in invoke_with_call_chain'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:199:in `synchronize'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:199:in `invoke_with_call_chain'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:188:in `invoke'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/handcuffs-1.4.1/lib/tasks/handcuffs.rake:35:in `run_task'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/handcuffs-1.4.1/lib/tasks/handcuffs.rake:5:in `block (2 levels) in <main>'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:279:in `block in execute'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:279:in `each'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:279:in `execute'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:219:in `block in invoke_with_call_chain'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:199:in `synchronize'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:199:in `invoke_with_call_chain'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/task.rb:188:in `invoke'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/application.rb:160:in `invoke_task'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `block (2 levels) in top_level'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `each'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `block in top_level'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/application.rb:125:in `run_with_threads'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/application.rb:110:in `top_level'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/application.rb:83:in `block in run'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/application.rb:186:in `standard_exception_handling'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/lib/rake/application.rb:80:in `run'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/rake-13.0.6/exe/rake:27:in `<top (required)>'
/home/<...>/.asdf/installs/ruby/2.7.2/bin/rake:23:in `load'
/home/<...>/.asdf/installs/ruby/2.7.2/bin/rake:23:in `<top (required)>'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bundler-2.2.17/lib/bundler/cli/exec.rb:63:in `load'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bundler-2.2.17/lib/bundler/cli/exec.rb:63:in `kernel_load'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bundler-2.2.17/lib/bundler/cli/exec.rb:28:in `run'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bundler-2.2.17/lib/bundler/cli.rb:494:in `exec'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bundler-2.2.17/lib/bundler/vendor/thor/lib/thor/command.rb:27:in `run'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bundler-2.2.17/lib/bundler/vendor/thor/lib/thor/invocation.rb:127:in `invoke_command'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bundler-2.2.17/lib/bundler/vendor/thor/lib/thor.rb:392:in `dispatch'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bundler-2.2.17/lib/bundler/cli.rb:30:in `dispatch'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bundler-2.2.17/lib/bundler/vendor/thor/lib/thor/base.rb:485:in `start'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bundler-2.2.17/lib/bundler/cli.rb:24:in `start'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bundler-2.2.17/exe/bundle:49:in `block in <top (required)>'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bundler-2.2.17/lib/bundler/friendly_errors.rb:130:in `with_friendly_errors'
/home/<...>/.asdf/installs/ruby/2.7.2/lib/ruby/gems/2.7.0/gems/bundler-2.2.17/exe/bundle:37:in `<top (required)>'
/home/<...>/.asdf/installs/ruby/2.7.2/bin/bundle:23:in `load'
/home/<...>/.asdf/installs/ruby/2.7.2/bin/bundle:23:in `<main>'
Tasks: TOP => db:migrate
```

We did experiment with auto loading and eager loading, but ran into issues with Zeitwerk: it complains about
migration constants starting with numbers (the timestamps).

Ruby version: 2.7.2

Rails version: 6.1.4.1

I'm using a non-default port for Postgres here (5433 instead of 5432).
