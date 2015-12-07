require_relative 'db_config.rb'
require_relative '../models/article.rb'
require_relative '../models/category.rb'
require_relative '../models/user.rb'

categories = [
  {name: "Know Your Beer", img_url: "http://www.camdentownbrewery.com/wp-content/uploads/2012/12/varietiesofbeer.jpg"},
  {name: "Bartending Tips", img_url: "http://media.cleveland.com/taste_impact/photo/pouring-beerjpg-ba1c502a5f1db7b5.jpg"},
  {name: "Food Pairings", img_url: "http://www.iwantbeerrightnow.com/blog/wp-content/uploads/2015/04/beer_and_food.jpg"},
  {name: "Home Brewing", img_url: "http://therobotmusteat.files.wordpress.com/2013/07/jugsadulterated.jpg"}
]
Category.create(categories)


articles = [
  {title: "History of the Home Brew", content: "Beer has been brewed domestically throughout its 7,000-year history, beginning in the Neolithic period in Mesopotamia (modern Iraq), Egypt and China. It seems to have first developed as thick beers; during this time meads, fruit wines and rice wines were also developed.

The Greeks and Romans cultivated both grape wine and beer, to a lesser extent. Roman women often directed production in larger households while the labor was performed by slaves.

By the Tang dynasty, homebrewing seems to have been a familiar domestic chore in China, albeit the lower classes had to make do with poorly-filtered mash.[1] Laws against making alcohol were enacted and repealed between the Zhou and Ming dynasties.[citation needed]

The 18th century Industrial Revolution brought about such innovations as the thermometer and hydrometer. These tools increased efficiency to the point that mass production of beer was possible for the first time in history. In 1857, French microbiologist Louis Pasteur explained the role of yeast in beer fermentation, allowing brewers to develop strains of yeast with desirable properties (conversion efficiency, ability to handle higher alcohol content).

Throughout the first half of the 20th century, homebrewing in the UK was circumscribed by taxation: the Inland Revenue Act of 1880 introduced a 5-shilling homebrewing licence.[2] Chancellor of the Exchequer Reginald Maudling removed the requirement for a brewing licence in 1963.[3] Australia followed suit in 1972 when Gough Whitlam repealed the law prohibiting the brewing of all but the weakest beers in one of his first acts as Prime Minister.[4]

In 1920, due to Prohibition, breweries across the United States were closed down or began making malt for other purposes. The Homebrewing of beer with an alcohol content higher than 0.5% remained illegal until 1978 when Congress passed a bill repealing Federal restrictions and excise taxes,[5] and President Jimmy Carter signed the bill, H.R. 1337, into law.[6] Within months of homebrewing's full legalization, Charlie Papazian founded the Brewers Association and American Homebrewers Association). In 1984, Papazian published The Complete Joy of Home Brewing which remains in print alongside later publications such as Graham Wheeler's Home Brewing: The CAMRA Guide.", img_url: "https://static1.squarespace.com/static/530a32cee4b0efed67078770/530a6d65e4b0c1a4a93b7e9e/55ac2ceee4b0c0d18bc5b843/1437401653034/?format=1000w", author_id: 1 , category_id: 1},
  {title: "Beer of the Week", content: "Sculpin GrapeFruit IPA from Ballast Point Brewery in San Diego, CA is the latest take on a signature IPA. Some may say there are few ways to improve Sculpin’s unique flavor, but the tart freshness of grapefruit perfectly complements our IPA’s citrusy hop character. Grapefruit’s a winter fruit, but this easy-drinking ale tastes like summer. AVAILABILITY: Year-round. ALC. BY VOL. 7%. FOOD PAIRINGS: Coconut Basmati Rice, Jamaican Jerk Chicken, Tropical Bread Pudding.", img_url: "https://c2.staticflickr.com/6/5551/15171782556_1a876ee335_b.jpg", author_id: 2 , category_id: 2},
  {title: "How to Pour the Perfect Guiness", content: "Step 1: Choose the Right Glass and Proper Angle.
Choose a clean, dry, 20-ounce, tulip-shaped pint glass. The bump in the wider neck allows nitrogen bubbles to move down the side of the glass and back up into the neck of the beer. Tilt the glass away from you at a 45-degree angle; if you don’t, the Guinness will froth, will take forever to settle and may taste bruised.

Step 2: Pull the Tap Toward You.
That way, you release the Guinness until it fills the glass to the bottom edge of the tulip’s bump. On many Irish tulip pint glasses, there’s a gold harp icon (aka the Guinness harp); for the truly perfect pour, fill it halfway up this harp. Then, don’t touch it until you see a vivid distinction between the dark ruby-red body and creamy white head. This may take a few minutes, so sit back and relax.

Step 3: Hold It Level.
Once it’s settled, put your Guinness up to the tap and hold it level. (You want a dome effect when you top it off, so skip the 45-degree angle this time.) Push the tap away from you, pouring the Guinness slower. Aim directly into the middle of the foam head until it settles half a millimeter above the lip of your pint glass. Wait. A smaller, second settling period is crucial.", img_url: "http://www.thestar.com/content/dam/thestar/life/food_wine/2014/03/06/try_these_guinness_alternatives_for_st_patricks_day/guinness.jpg", author_id: 3, category_id: 3}
]
Article.create(articles)


users = [
  {username: "kimhart90@gmail.com", first_name: "Kim", last_name: "Hart", location: "Brooklyn, NY", password: "password"},
  {username: "alexhubbard89@gmail.com", first_name: "Alex", last_name: "Hubbard", location: "Brooklyn, NY", password: "password"},
  {username: "jujube921@yahoo.com", first_name: "Juliette", last_name: "Garner", location: "Boston, MA", password: "password"}
]
User.create(users)


