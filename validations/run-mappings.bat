malac-hd -s -m ..\input\maps\at-prenudge-sleep-quality-base.map -m ..\input\maps\at-prenudge-sleep-quality-mapping-from-whoqol-bref.map -ti ..\fsh-generated\resources\QuestionnaireResponse-whoqol-bref-response-example.json  -to 01_sleep_quality_whoqol_bref_obs.json

malac-hd -s -m ..\input\maps\at-prenudge-sleep-quality-base.map -m ..\input\maps\at-prenudge-sleep-quality-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-sleep-quality-response-dissatisfied-example.json  -to 02_sleep_quality_dissatisfied_obs.json

malac-hd -s -m ..\input\maps\at-prenudge-sleep-quality-base.map -m ..\input\maps\at-prenudge-sleep-quality-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-sleep-quality-response-satisfied-example.json  -to 03_sleep_quality_satisfied_obs.json

malac-hd -s -m ..\input\maps\at-prenudge-sleep-duration-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-sleep-duration-response-normal-example.json  -to 04_sleep_duration_normal_obs.json

malac-hd -s -m ..\input\maps\at-prenudge-smoking-q-to-o.map -ti ..\fsh-generated\resources\QuestionnaireResponse-SmokingStatusResponseCurrentEveryDay.json  -to 05_smoking_everyday.json

malac-hd -s -m ..\input\maps\at-prenudge-smoking-q-to-o.map -ti ..\fsh-generated\resources\QuestionnaireResponse-SmokingStatusResponseFormer.json  -to 06_smoking_former.json

malac-hd -s -m ..\input\maps\at-prenudge-smoking-q-to-o.map -ti ..\fsh-generated\resources\QuestionnaireResponse-SmokingStatusResponseNever.json  -to 07_smoking_never.json

malac-hd -s -m ..\input\maps\at-prenudge-education-q-to-o.map -ti ..\fsh-generated\resources\QuestionnaireResponse-education-response-bachelor-example.json  -to 08_education_bachelor.json

malac-hd -s -m ..\input\maps\at-prenudge-education-q-to-o.map -ti ..\fsh-generated\resources\QuestionnaireResponse-education-response-upper-secondary-example.json  -to 09_education_upper-secondary.json

malac-hd -s -m ..\input\maps\at-prenudge-work-soc-q-to-o.map -ti ..\fsh-generated\resources\QuestionnaireResponse-work-soc-response-example.json  -to 10_work-soc.json

malac-hd -s -m ..\input\maps\at-prenudge-bmi-q-to-o.map -ti ..\fsh-generated\resources\QuestionnaireResponse-bmi-questionnaire-response-example.json  -to 11_bmi.json

malac-hd -s -m ..\input\maps\at-prenudge-whooley-q-to-o.map -ti ..\fsh-generated\resources\QuestionnaireResponse-whooley-response-positive-example.json  -to 12_self_reported_emotional_burden.json

@rem -co convert output liefert ein Phyton Skript, womit man das debugging machen kann
@rem malac-hd -s -m ..\input\maps\at-prenudge-sleep-duration-mapping.map -co sleep-duration.py