# zero_waste_kitchen

## Welcome!
At Zero Waste Kitchen we're here to combat the growing problem of food waste in the United States. American households generate an estimated 42 billion pounds of food waste each year. This is enough food to feed **21 million people each year**. 

The consequences of this waste not only has a direct impact on people but far reaching effects for the planet. **96% of this waste ends up in the landfill** - resulting in roughly 12 Million Tons of CO2 emissions. That amount of emissions is equivalent to powering 1.5 million homes for a year, or driving a car 2.6 million miles.

Our app is aimed at helping people eliminate food waste in their homes by providing recipes based on ingredients that will soon spoil and contribute to food waste. We hope to inspire users to waste less, save more and have an increased awareness around their personal impact and ability to contribute by having a Zero Waste Kitchen.

## Project Repos and Links
#### Repos
1. [Frontend Repository](https://github.com/calforcal/fe_zero_waste_kitchen)
2. [Backend Repository](https://github.com/calforcal/be_zero_waste_kitchen)

#### Production Deployment
1. [Frontend Production](https://fe-zero-waste-kitchen.onrender.com/)
2. [Backend Production](https://be-zero-waste-kitchen.onrender.com/)

## Contributors
- K.D Hubbard | [LinkedIn](https://www.linkedin.com/in/k-d-hubbard/) | | [Github](https://github.com/kdhubb) |
- Boston Lowrey | [LinkedIn](https://www.linkedin.com/in/boston-lowrey/) | | [Github](https://github.com/blowrey24) |
- Michael Callahan | [LinkedIn](https://www.linkedin.com/in/michaelcallahanjr/) | | [Github](https://github.com/calforcal) |
- Matthew William Johnson | [LinkedIn](https://www.linkedin.com/in/matthewwjohnsonttu/) | | [Github](https://github.com/mwmjohnson) |

## Repo Installation
In your terminal run the following commands to clone the repositories:

**Frontend**
          
     git clone git@github.com:calforcal/fe_zero_waste_kitchen.git

**Backend**

     git clone git@github.com:calforcal/be_zero_waste_kitchen.git

**Installing the Gems Locally**

     bundle install

**Front API Keys Needed**

Both of these keys will need to be requested from an Admin (see above)
- `GOOGLE_OAUTH_CLIENT_ID`
- `GOOGLE_OAUTH_CLIENT_SECRET`
- `ZWK_API_KEY`

**Google OAuth Documentation can be found [HERE](https://cloud.google.com/docs)**

**Backend API Keys Needed**

- NUTRITION_API_KEY: [API Ninjas](https://api-ninjas.com/api/nutrition)
- EMISSIONS_API_KEY: [ClimatIQ](https://www.climatiq.io/docs/api-reference/estimate)
- SPOON-KEY: [Spoonacular](https://spoonacular.com/food-api/docs#Search-Recipes-by-Ingredients)
- NX_APP_ID: [Nutronix](https://docs.google.com/document/d/1_q-K-ObMTZvO0qUEAxROrN3bwMujwAN25sLHwJzliK0/edit#heading=h.h3vlpu5rgxy0)
- NX_APP_KEY: [Nutronix](https://docs.google.com/document/d/1_q-K-ObMTZvO0qUEAxROrN3bwMujwAN25sLHwJzliK0/edit#heading=h.h3vlpu5rgxy0)
- BACKEND_API_KEY: *Request From Admin*

**Installing Figaro**

[Figaro Gem Docs](https://github.com/laserlemon/figaro)

In your terminal run:

     bundle exec figaro install

In the new file `config/application.yml`

Post your keys as they are listed above in this file, for both frontend and backend.

**Testing the Repositories**

Start up BOTH Servers (Frontend / Backend) by running the following command in each terminal:

     rails s

To run the full test suite:

     bundle exec rspec

## Wireframes / Screenshots

### Home Page

![](www.github.com/zero_waste_kitchen/fe_zero_waste_kitchen/blob/main/app/images/homepage.png)

### Register / Google Pre-Login

![](www.github.com/calforcal/fe_zero_waste_kitchen/blob/main/app/images/pre-login.png)

### Google Login

![](www.github.com/calforcal/fe_zero_waste_kitchen/blob/main/app/images/google_oauth_login.png)

### User Dashboard

![](www.github.com/calforcal/fe_zero_waste_kitchen/blob/main/app/images/user_dashboard.png)

### Recipe Search

![](www.github.com/calforcal/fe_zero_waste_kitchen/blob/main/app/images/pre_recipe_search.png)

### Recipe Search Results

![](www.github.com/calforcal/fe_zero_waste_kitchen/blob/main/app/images/post_search.png)

### Recipe Show Page

![](www.github.com/calforcal/fe_zero_waste_kitchen/blob/main/app/images/recipe_show.png)

### Recipe Cook Page

![](www.github.com/calforcal/fe_zero_waste_kitchen/blob/main/app/images/cook_recipe_page.png)

### Recipe Post Cook

![](www.github.com/calforcal/fe_zero_waste_kitchen/blob/main/app/images/post_cooked_recipe_page.png)

### Recipe Saved

![](www.github.com/calforcal/fe_zero_waste_kitchen/blob/main/app/images/recipe_show_saved.png)

### Recipe Saved Dropdown

![](www.github.com/calforcal/fe_zero_waste_kitchen/blob/main/app/images/recipe_show_saved.png)

### Recipe Cooked Dropdown

![](www.github.com/calforcal/fe_zero_waste_kitchen/blob/main/app/images/recipe_show.png)

## ZWK JSON Contract

**[Backend Endpoints](https://github.com/calforcal/be_zero_waste_kitchen#readme)**