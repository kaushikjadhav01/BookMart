[![DOI](https://zenodo.org/badge/742607049.svg)](https://zenodo.org/doi/doi/10.5281/zenodo.10498988)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/kaushikjadhav01/BookMart/blob/main/LICENSE)
[![Code Coverage](https://codecov.io/gh/NCSU-Fall-2022-SE-Project-Team-11/XpensAuditor---Group-11/branch/main/graphs/badge.svg)](https://codecov.io)
![GitHub contributors](https://img.shields.io/badge/Contributors-1-brightgreen)
[![Documentation Status](https://readthedocs.org/projects/ansicolortags/badge/?version=latest)](https://github.com/kaushikjadhav01/BookMart/edit/master/README.md)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/kaushikjadhav01/BookMart)
![GitHub issues](https://img.shields.io/github/issues/kaushikjadhav01/BookMart)
![GitHub closed issues](https://img.shields.io/github/issues-closed/kaushikjadhav01/BookMart)
[![GitHub Repo Size](https://img.shields.io/github/repo-size/kaushikjadhav01/BookMart.svg)](https://img.shields.io/github/repo-size/kaushikjadhav01/BookMart.svg)
[![GitHub last commit](https://img.shields.io/github/last-commit/kaushikjadhav01/BookMart)](https://github.com/kaushikjadhav01/BookMart/commits/main)
![GitHub language count](https://img.shields.io/github/languages/count/kaushikjadhav01/BookMart)
[![Commit Acitivity](https://img.shields.io/github/commit-activity/m/kaushikjadhav01/BookMart)](https://github.com/kaushikjadhav01/BookMart)
[![Code Size](https://img.shields.io/github/languages/code-size/kaushikjadhav01/BookMart)](mpp-backend)
![GitHub forks](https://img.shields.io/github/forks/kaushikjadhav01/BookMart?style=social)
![GitHub stars](https://img.shields.io/github/stars/kaushikjadhav01/BookMart?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/kaushikjadhav01/BookMart?style=social)

# BookMart: Online Book Shopping System
Online Book Shopping System class project using Ruby on Rails, live at: http://bookmart.kajadhav.me
<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#system-description-and-functions">System Description and Functions</a></li>
    <li><a href="#built-with">Built With</a></li>
    <li><a href="#installation">Installation</a></li>
    <li><a href="#authors">Authors</a></li>
    <li><a href="#links">Links</a></li>
  </ol>
</details>

## System Description and Functions
**Live Demo:** http://bookmart.kajadhav.me<br/>
**Demo Video:** <br/>
[<img src="https://i.ytimg.com/vi/wCl_MHH4gtA/maxresdefault.jpg" width="50%">](https://www.youtube.com/watch?v=wCl_MHH4gtA "CSC 517 RoR BookMart")<br/>

**Admin Creds:** <br/>
Username: admin <br/>
Email Address: admn.bookmart@gmail.com <br/>
Password: Samplepass@123 <br/>

There are two roles in the system: **Admin** and **User**.<br/><br/>
Admin can:<br/>
<ol>
    <li>Create, Retrieve, Update Delete Books</li>
    <li>Create, Retrieve, Update Delete Users</li>
    <li>Create, Retrieve, Update Delete Reviews</li>
    <li>Buy Books</li>
    <li>Search Books</li>
    <li>Filter Books</li>
    <li>Check Transaction History of all users</li>
    <li>Add books to cart, update items in cart, remove items from cart</li>
</ol>
Users can:<br/>
<ol>
    <li>Buy Books</li>
    <li>Search Books</li>
    <li>Filter Books</li>
    <li>Create, Retrieve, Update Delete Reviews for the books they purchased</li>
    <li>Edit their own profile</li>
    <li>Check their own Transaction History</li>
    <li>Add books to cart, update items in cart, remove items from cart</li>
</ol>

## Built With
![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-A10E3B?style=for-the-badge&amp;logo=rubyonrails&amp;logoColor=white)
![Javascript](https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=F7DF1E)
![mysql](https://img.shields.io/badge/MySQL-cc6600?style=for-the-badge&amp;logo=mysql&amp;logoColor=white)
![docker](https://img.shields.io/badge/Docker-006699?style=for-the-badge&logo=docker&logoColor=white)
![html](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![css](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![bootstrap](https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white)

## Installation
## Local Setup
1. Install Ruby ***3.2.0***.
2. Clone repo, cd into it and run ```bundle install```
3. Run ```rails assets:precompile```
4. Run ```rails db:migrate```
5. Run ```rails db:seed``` to create admin user via seeding.
6. Run ```rails s``` to start server.
7. Go to ```localhost:3000``` to access shop and cart functions.

## Dockerized Setup
1. Clone repo, cd into it
2. Run ```sudo docker build -t app .```
3. Run ```sudo docker volume create app-storage```
4. Run ```sudo docker run --rm -it -v app-storage:/rails/storage -p 3000:3000 --name app -d app```

## Testing
After running local setup steps, run ```rspec --format doc``` to run tests for the model and controller. The test files run for RSpec are ```spec/controllers/reviews_controller_spec.rb``` and ```spec/models/book_spec.rb```

## Authors
### Kaushik Jadhav
<ul>
<li>Github: https://github.com/kaushikjadhav01</li>
<li>Medium: https://medium.com/@kaushikjadhav01</li>
<li>LinkedIn: https://www.linkedin.com/in/kaushikjadhav01/</li>
<li>Portfolio: http://kajadhav.me/</li>
<li>Linked In: https://www.linkedin.com/in/kajadhav/
<li>Dev.to: https://dev.to/kaushikjadhav01
<li>Codesignal: https://app.codesignal.com/profile/kaushik_j_vtc
<li>Google Scholar: https://scholar.google.com/citations?user=iRYcFi0AAAAJ
<li>Daily.dev: https://app.daily.dev/kaushikjadhav01
<li>Google devs: https://developers.google.com/profile/u/kaushikjadhav01
<li>Stack Overflow: https://stackoverflow.com/users/21890981/kaushik-jadhav
</ul>

## Links
* [Web site](http://bookmart.kajadhav.me/)
* [Issue tracker](https://github.com/kaushikjadhav01/BookMart/issues)
* [Source code](https://github.com/kaushikjadhav01/BookMart)
