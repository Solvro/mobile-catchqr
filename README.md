# CatchQR
![Project image](https://github.com/Solvro/mobile-catchqr/blob/main/catch-qr-solvro.png?raw=true)

## PL

Projekt powstał w celu rozwiązania najpowszechniejszych problemów związanych z tematem gier terenowych zarówno po stronie twórców jak i graczy. Organizacje działające przy Politechnice Wrocławskiej aktualnie nie posiadają jednego, spójnego narzędzia do tworzenia i  zarządzania takimi projektami w przystępny, czasu-oszczędny sposób. Społeczność akademicka aktualnie nie posiada jednego, spójnego źródła informacji o dostępnych grach terenowych ani jednakowego i dobrze działającego narzędzia do prowadzenia rozgrywki.  Prowadzi to do chaosu, w rezultacie czego powstałe projekty znajdują mniejszą publikę. 

## ENG

The project was created to address the most common issues related to geocaching games from both the creators' and players' perspectives. Organizations affiliated with the Wrocław University of Science and Technology currently lack a single, cohesive tool for creating and managing such projects in an accessible and time-efficient manner. The academic community currently does not have a single, unified source of information about available geocaching games or a standardized and well-functioning tool for conducting gameplay. This leads to chaos, resulting in the projects reaching a smaller audience.

## Current team

- [@mikolaj-jalocha](https://github.com/mikolaj-jalocha) - Flutter Junior Techlead
- [@simon-the-shark](https://github.com/simon-the-shark) - Flutter Techlead, Board Coordinator
- [@gry-mar](https://github.com/gry-mar) - UI/UX Designer
- [@aniakii](https://github.com/Aniakii) - Flutter Developer
- [@ttomaszpwr](https://github.com/TTomaszPWR) - Flutter Developer
- [@dimagolt](https://github.com/DimaGolt) - Flutter Developer

## Technologies used

- Flutter
- Riverpod

# Development

## 1. Code generation

    Some of the app's dependencies utilize the code generation feature, and generated files **are not currently included** to control versioning in this GitHub repository. Therefore, before building, running, or developing the application, it's crucial to run code generation (to generate all needed files) in the terminal with:
  
### For one-time generation:
  
```zsh
    dart run build_runner build
```
  **OR**
  
### For watch mode and continous necessary rebuilds after every change to connected files (usufull for development):
```zsh
dart run build_runner watch
```
    
### If something doesn't build correctly, this might help:
```zsh
dart run build_runner build -d
```

## 2. It's now possible to run or build the app in the usual way
_Rebuilds are necessary after any updates or changes to affected files (`watch` command does it for you)_


## Working with git

### Github Solvro Handbook 🔥

https://docs.google.com/document/d/1Sb5lYqYLnYuecS1Essn3YwietsbuLPCTsTuW0EMpG5o/edit?usp=sharing

  
