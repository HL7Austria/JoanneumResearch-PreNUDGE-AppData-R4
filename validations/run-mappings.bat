 malac-hd -m ..\input\maps\at-prenudge-sleep-quality-base.map -m ..\input\maps\at-prenudge-sleep-quality-mapping-from-whoqol-bref.map -ti ..\fsh-generated\resources\QuestionnaireResponse-whoqol-bref-response-example.json  -to 01_sleep_quality_whoqol_bref_obs.json

 malac-hd -m ..\input\maps\at-prenudge-sleep-quality-base.map -m ..\input\maps\at-prenudge-sleep-quality-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-sleep-quality-response-dissatisfied-example.json  -to 02_leep_quality_dissatisfied_obs.json

 malac-hd -m ..\input\maps\at-prenudge-sleep-quality-base.map -m ..\input\maps\at-prenudge-sleep-quality-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-sleep-quality-response-satisfied-example.json  -to 03_sleep_quality_satisfied_obs.json

malac-hd -m ..\input\maps\at-prenudge-sleep-duration-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-sleep-duration-response-normal-example.json  -to 04_sleep_duration_normal_obs.json

