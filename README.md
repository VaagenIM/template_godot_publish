# template_godot_publish
Automatisk publiser et Godot prosjekt på GitHub pages

Demo: https://vaagenim.github.io/template_godot_publish/

Alt du trenger å gjøre er å definere en HTML5 Export preset og oppdatere verdiene `GODOT_VERSION`, `PROJECT_FOLDER` og `image` i `.github/workflows/publish.yml`

![img_1.png](img_1.png)

For å eksportere til flere plattformer så kan du kopiere arbeidsflyten fra https://github.com/abarichello/godot-ci/blob/master/.github/workflows/godot-ci.yml

Flere instrukser og en finere demo kommer senere.
