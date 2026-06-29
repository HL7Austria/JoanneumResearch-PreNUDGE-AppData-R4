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

malac-hd -s -m ..\input\maps\at-prenudge-q-to-o-base.map -m ..\input\maps\at-prenudge-physicalactivitymin-q-mapping-to-o-min-per-week.map -ti ..\fsh-generated\resources\QuestionnaireResponse-physical-activity-ehispaq-response-example.json -to 14_physical_activity_min.json

malac-hd -s -m ..\input\maps\at-prenudge-q-to-o-base.map -m ..\input\maps\at-prenudge-muscle-strengthening-ehis-paq-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-muscle-strengthening-ehis-paq-response-example.json -to 15_muscle_strengthening_ehis_paq_obs.json

malac-hd -s -m ..\input\maps\at-prenudge-q-to-o-base.map -m ..\input\maps\at-prenudge-muscle-strengthening-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-muscle-strengthening-quantity-response-example.json -to 15_muscle_strengthening_quantity_obs.json

malac-hd -s -m ..\input\maps\at-prenudge-q-to-o-base.map -m ..\input\maps\at-prenudge-stepcount-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-stepcount-quantity-response-normal-example.json -to 17_stepcount_normal.json

malac-hd -s -m ..\input\maps\at-prenudge-q-to-o-base.map -m ..\input\maps\at-prenudge-stepcount-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-stepcount-quantity-response-high-example.json -to 18_stepcount_high.json

malac-hd -s -m ..\input\maps\at-prenudge-q-to-o-base.map -m ..\input\maps\at-prenudge-sitting-hours-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-sitting-hours-ehis-paq-response-example.json -to 19_sitting_hours_obs.json

malac-hd -s -m ..\input\maps\at-prenudge-nutrition-sugarsalty-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-nutrition-sugarsalty-response-daily-example.json  -to 12_nutrition-sugarsalty.json

malac-hd -s -m ..\input\maps\at-prenudge-nutrition-fruitportions-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-nutrition-fruitvegetable-response-daily-example.json  -to 13_nutrition-fruitportions.json

malac-hd -s -m ..\input\maps\at-prenudge-nutrition-vegetableportions-mapping.map -ti ..\fsh-generated\resources\QuestionnaireResponse-nutrition-fruitvegetable-response-daily-example.json  -to 14_nutrition-vegetableportions.json


@rem -co convert output liefert ein Phyton Skript, womit man das debugging machen kann
@rem malac-hd -s -m ..\input\maps\at-prenudge-sleep-duration-mapping.map -co sleep-duration.py