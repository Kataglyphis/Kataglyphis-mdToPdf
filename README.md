<h1 align="center">
  <br>
  <a href="https://jotrockenmitlocken.de"><img src="images/logo.png" alt="logo" width="200"></a>
  <br>
  mdToPdf
  <br>
</h1>

<!-- <h1 align="center">
  <br>
  <a href="https://jotrockenmitlocken.de"><img src="images/vulkan-logo.png" alt="VulkanEngine" width="200"></a>
  <a href="https://jotrockenmitlocken.de"><img src="images/Engine_logo.png" alt="VulkanEngine" width="200"></a>
  <a href="https://jotrockenmitlocken.de"><img src="images/glm_logo.png" alt="VulkanEngine" width="200"></a>
</h1> -->

<h4 align="center">Convert markdown to modern slide show or a4paper book. Combining the very light weight markdown language with all the power of LaTeX.<a href="https://jotrockenmitlocken.de" target="_blank"></a></h4>

<!-- [![Linux build](https://github.com/Kataglyphis/GraphicsEngineVulkan/actions/workflows/Linux.yml/badge.svg)](https://github.com/Kataglyphis/GraphicsEngineVulkan/actions/workflows/Linux.yml)
[![Windows build](https://github.com/Kataglyphis/GraphicsEngineVulkan/actions/workflows/Windows.yml/badge.svg)](https://github.com/Kataglyphis/GraphicsEngineVulkan/actions/workflows/Windows.yml) -->
[![TopLang](https://img.shields.io/github/languages/top/Kataglyphis/mdToPdf)]() 
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate/?hosted_button_id=BX9AVVES2P9LN)
[![Twitter](https://img.shields.io/twitter/follow/Cataglyphis_?style=social)](https://twitter.com/Cataglyphis_)

<p align="center">
  <a href="#about-the-project">About The Project</a> •
  <a href="#getting-started">Getting Started</a> •
  <a href="#license">License</a> •
  <a href="#literature">Literature</a>
</p>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#key-features">Key Features</a></li>
      </ul>
      <ul>
        <li><a href="#dependencies">Dependencies</a></li>
      </ul>
      <ul>
        <li><a href="#useful-tools">Useful tools</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#tests">Tests</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
    <li><a href="#literature">Literature</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project
Formulating everything you need in markdown is very light weight and efficient. This can be an enormous productivity bust for oneself. Nevertheless one would miss the power of LaTeX with its unique ecosystem which is perfect for writing scientific content (paper, books, presentation). This project is using the amazing pandoc library which is the exact right tool to combine both worlds. </br>
You can immediately get started an use my customized templates for generating nice 
looking books, papers or presentations. I provide detailed steps how to use it and 
how to reproduce everything. The main environment is containerized thanks to Docker.
Therefore everything can much simpler be reproduced.
<!-- <h1 align="center">
  <br>
  <a href="https://jotrockenmitlocken.de"><img src="images/Screenshot1.png" alt="VulkanEngine" width="400"></a>
  <a href="https://jotrockenmitlocken.de"><img src="images/Screenshot2.png" alt="VulkanEngine" width="400"></a>
  <a href="https://jotrockenmitlocken.de"><img src="images/Screenshot3.png" alt="VulkanEngine" width="700"></a>
</h1> -->

<!-- [![Kataglyphis Engine][product-screenshot1]](https://jotrockenmitlocken.de)
[![Kataglyphis Engine][product-screenshot2]](https://jotrockenmitlocken.de)
[![Kataglyphis Engine][product-screenshot3]](https://jotrockenmitlocken.de) -->

What is nicer than writing in pure, simple markdown? <br>
No worries about latex but with all the power of it!

### Key Features

<!-- ❌  -->
|          Feature                           |   Implement Status |
| ------------------------------------------ | :----------------: |
| Docker image, make everything reproducible |         ✔️         |
| LaTeX templates                            |         ✔️         |
| Comprehensive python scripts               |         ✔️         |

### Dependencies
This enumeration also includes submodules.

For my beamer latex project I use the following latex templates: 
* [beamerthemeawesome](https://github.com/LukasPietzschmann/awesome-beamer) theme from LukasPietzschmann as a starting point and customized it for my needs.
* [smile](https://github.com/LukasPietzschmann/smile) theme from LukasPietzschmann as a starting point and customized it for my needs.

* [Roboto font](https://fonts.google.com/specimen/Roboto) just a very nice font

### Useful tools

* [pandoc](https://github.com/jgm/pandoc)

<!-- GETTING STARTED -->
## Getting Started

### Building docker image
For building my docker image I use sth. like this:
```bash
docker build . -t pandoc_all
```

### WINDOWS
Command works in powershell but not on cmd.
```powershell
  cd mdToPdf
  docker run -it --rm -v ${PWD}/md2pdfLib:/md2pdfLib -v ${PWD}/data:/data --name mypandoc -h mypandoc pandoc_all
```
### LINUX 
Tested on ubuntu. Fedora etc. might have little differences. Idk
```bash
  cd mdToPdf
  docker run -it --rm -v ${pwd}/md2pdfLib:/md2pdfLib -v ${pwd}/data:/data --name mypandoc -h mypandoc pandoc_all
```

### Build presentation

Place all .md files in the data/presentation/chapters/ folder

```bash
  python3 md2pdfLib/presentation/scripts/md2beamerpdf.py 2>&1 | tee data/out/beamer.log
```

### Build book
```bash
  python3 md2pdfLib/book/scripts/md2pdf.py 2>&1 | tee data/out/book.log
```

### Build CV
```bash
  cd data/cv
  lualatex cv.tex
```

### Prerequisites

### Installation

1. Clone the repo
   ```sh
   git clone --recurse-submodules git@github.com:Kataglyphis/mdToPdf.git
   ```

### How i created my customized pandoc latex template
This project aims to provide an unique style for the pdf layouts.
Therefore I had to produce my own pandoc template.latex file.
The following steps are guiding you through the customization steps
so you can reproduce everything:

I assume you already cloned the repo and the terminal points to the directory.

* export standart .latex file used by pandoc:
```bash
  pandoc -D latex > md2pdfLib/presentation/pandoc/custom.tex
```

* Delete *ignorenonframetext* out of the \documentclass options.
* Add custom colors right before \usetheme (in my case my favorite \definecolor{myGreenAccent}{RGB}{105, 240, 174}) 


## Tests

<!-- ROADMAP -->
## Roadmap
Upcoming :)
<!-- See the [open issues](https://github.com/othneildrew/Best-README-Template/issues) for a list of proposed features (and known issues). -->



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


<!-- LICENSE -->
## License

<!-- CONTACT -->
## Contact

Jonas Heinle - [@Cataglyphis_](https://twitter.com/Cataglyphis_) - jonasheinle@googlemail.com

Project Link: [https://github.com/Kataglyphis/...](https://github.com/Kataglyphis/...)


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
Huge shoutout to Lukas Pietzschmann for his latex template.


## Literature 

Some very helpful literature, tutorials, etc. 

LaTeX
* [Custom modern LaTeX .sty template](https://github.com/LukasPietzschmann/awesome-beamer)
* [LaTeX template overview](https://github.com/martinbjeldbak/ultimate-beamer-theme-list)

Pandoc
* [The Art of Book Creation with Pandoc](https://medium.com/@sydasif78/book-creation-with-pandoc-and-markdown-893c7d72cb35)
* [my-pandoc-book GitHub Repo](https://github.com/sydasif/my-pandoc-book)
* [Kofler Pandoc bible](https://kofler.info/free-ebooks/pandoc2.pdf)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=for-the-badge
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/jonas-heinle-0b2a301a0/
