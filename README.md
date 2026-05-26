# PreNUDGE FHIR Implementation Guide (IG)

Projekt - https://prenudge.at/
                                                   
## Sushi

### Dokumentation

https://fshschool.org/docs/sushi/

## Initialisierung

https://github.com/FHIR/sushi

```
npm install -g fsh-sushi   
```   

Folgende Parameter wurden verwendet

```
sushi init
   
```

## Publisher

### Jekyll auf Windows installieren

https://jekyllrb.com/docs/installation/windows/

https://rubyinstaller.org/downloads/

```
 .\_genonce.bat   
```   

## MaLaC-HD

https://gitlab.com/cdehealth/malac-hd

```
 pip install malac-hd   
```

**Achtung:** Es musste c:\Users\xxx\AppData\Local\Python\pythoncore-3.14-64\Scripts\ zum Path hinzugefügt werden.

```
 malac-hd -m .\input\maps\at-prenudge-sleep-quality-base.map -m .\input\maps\at-prenudge-sleep-quality-mapping.map -ti .\fsh-generated\resources\QuestionnaireResponse-sleep-quality-response-satisfied-example.json  -to .\temp\malac-hd\sleep_quality_01.json
```
