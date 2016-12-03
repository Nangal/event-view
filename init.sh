# ng new event-view -p ev -sn
#####################
cd event-view
echo *** turn off spec generation ***
ng set defaults.spec.class false
ng set defaults.spec.component false
ng set defaults.spec.directive false
ng set defaults.spec.module false
ng set defaults.spec.pipe false
ng set defaults.spec.service false
echo *** work on the shared folder ***
ng g m core
rm src/app/core/core.component.*
ng g s core/auth-guard
ng g cl core/can-deactivate-guard
ng g cl core/config
rm src/app/core/config.spec.ts
ng g s core/entity
ng g s core/exception
ng g s core/message
ng g s core/module-import-guard
ng g cl core/preload-strategy
ng g cl core/rxjs-extensions
ng g s core/user-profile
ng g m core/modal
ng g s core/modal
ng g m core/nav
ng g m core/spinner
ng g s core/spinner
ng g m core/toast
ng g s core/toast
ng g cl core/rxjs-operators
#####################
# echo *** create dashboard ***
# ng g r dashboard
# ng g c +dashboard/shared/dashboard-button
# #####################
# echo *** create sessions ***
# ng g r sessions
# ng g r +sessions/session-list
# ng g r +sessions/session
# ng g c +sessions/shared/session-button
# ng g s +sessions/shared/session
# ng g cl +sessions/shared/session model
# #####################
# echo *** create speakers ***
# ng g r speakers
# ng g r +speakers/speaker-list
# ng g r +speakers/speaker
# ng g c +speakers/shared/speaker-button
# ng g p +speakers/shared/sort-speakers
# #####################
# mkdir -p src/api
# ng g s ./src/api/in-memory-store
