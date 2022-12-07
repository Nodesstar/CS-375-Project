CREATE DATABASE munchlaxatmidnight;
\c munchlaxatmidnight;
CREATE TABLE users (
    username VARCHAR(250) NOT NULL UNIQUE,
    hashed_password CHAR(160)
);
CREATE TABLE pantry (
	id SERIAL PRIMARY KEY,
    username VARCHAR(250) REFERENCES users(username),
	item_name JSON,
	have_status BOOLEAN
);
CREATE TABLE recipebook(
    id SERIAL PRIMARY KEY,
    username VARCHAR(250) REFERENCES users(username),
    recipe_info JSON,
    folder_name VARCHAR(125),
    rating INT
);
CREATE TABLE ingredients(
    id SERIAL PRIMARY KEY,
    item_name TEXT
);

DELETE FROM pantry;
DELETE FROM recipebook;
DELETE FROM users;

DELETE FROM ingredients;
INSERT INTO ingredients (item_name) VALUES ('pork');
INSERT INTO ingredients (item_name) VALUES ('lemon juice');
INSERT INTO ingredients (item_name) VALUES ('maple syrup');
INSERT INTO ingredients (item_name) VALUES ('cayenne pepper');
INSERT INTO ingredients (item_name) VALUES ('pepper');
INSERT INTO ingredients (item_name) VALUES ('jalapeno pepper');
INSERT INTO ingredients (item_name) VALUES ('sugar');
INSERT INTO ingredients (item_name) VALUES ('fresh orange juice');
INSERT INTO ingredients (item_name) VALUES ('beans');
INSERT INTO ingredients (item_name) VALUES ('barbeque sauce');
INSERT INTO ingredients (item_name) VALUES ('bird chiles');
INSERT INTO ingredients (item_name) VALUES ('white peppercorns');
INSERT INTO ingredients (item_name) VALUES ('dark brown sugar');
INSERT INTO ingredients (item_name) VALUES ('gin');
INSERT INTO ingredients (item_name) VALUES ('simple syrup');
INSERT INTO ingredients (item_name) VALUES ('acorn squash');
INSERT INTO ingredients (item_name) VALUES ('butter');
INSERT INTO ingredients (item_name) VALUES ('onion');
INSERT INTO ingredients (item_name) VALUES ('coconut milk');
INSERT INTO ingredients (item_name) VALUES ('vanilla bean');
INSERT INTO ingredients (item_name) VALUES ('heavy cream');
INSERT INTO ingredients (item_name) VALUES ('coarse salt');
INSERT INTO ingredients (item_name) VALUES ('tequila');
INSERT INTO ingredients (item_name) VALUES ('liqueur');
INSERT INTO ingredients (item_name) VALUES ('lillet');
INSERT INTO ingredients (item_name) VALUES ('bitters');
INSERT INTO ingredients (item_name) VALUES ('lemon twist');
INSERT INTO ingredients (item_name) VALUES ('egg white');
INSERT INTO ingredients (item_name) VALUES ('powdered sugar');
INSERT INTO ingredients (item_name) VALUES ('vanilla');
INSERT INTO ingredients (item_name) VALUES ('white chocolate');
INSERT INTO ingredients (item_name) VALUES ('strawberries');
INSERT INTO ingredients (item_name) VALUES ('blueberries');
INSERT INTO ingredients (item_name) VALUES ('ginger cookies');
INSERT INTO ingredients (item_name) VALUES ('lemon');
INSERT INTO ingredients (item_name) VALUES ('olive oil');
INSERT INTO ingredients (item_name) VALUES ('shallot');
INSERT INTO ingredients (item_name) VALUES ('lemon zest');
INSERT INTO ingredients (item_name) VALUES ('limes');
INSERT INTO ingredients (item_name) VALUES ('water');
INSERT INTO ingredients (item_name) VALUES ('mint');
INSERT INTO ingredients (item_name) VALUES ('sea salt');
INSERT INTO ingredients (item_name) VALUES ('sparkling water');
INSERT INTO ingredients (item_name) VALUES ('lime');
INSERT INTO ingredients (item_name) VALUES ('whole milk');
INSERT INTO ingredients (item_name) VALUES ('egg yolks');
INSERT INTO ingredients (item_name) VALUES ('granulated sugar');
INSERT INTO ingredients (item_name) VALUES ('roasting chicken');
INSERT INTO ingredients (item_name) VALUES ('salt');
INSERT INTO ingredients (item_name) VALUES ('unsalted butter');
INSERT INTO ingredients (item_name) VALUES ('extra virgin olive oil');
INSERT INTO ingredients (item_name) VALUES ('ruby port');
INSERT INTO ingredients (item_name) VALUES ('orange juice');
INSERT INTO ingredients (item_name) VALUES ('orange');
INSERT INTO ingredients (item_name) VALUES ('black pepper');
INSERT INTO ingredients (item_name) VALUES ('fat-free greek yogurt');
INSERT INTO ingredients (item_name) VALUES ('fat-free milk');
INSERT INTO ingredients (item_name) VALUES ('light mayonnaise');
INSERT INTO ingredients (item_name) VALUES ('garlic');
INSERT INTO ingredients (item_name) VALUES ('bacon');
INSERT INTO ingredients (item_name) VALUES ('romaine lettuce');
INSERT INTO ingredients (item_name) VALUES ('tomatoes');
INSERT INTO ingredients (item_name) VALUES ('cucumber');
INSERT INTO ingredients (item_name) VALUES ('balsamic vinegar');
INSERT INTO ingredients (item_name) VALUES ('italian bread');
INSERT INTO ingredients (item_name) VALUES ('bourbon');
INSERT INTO ingredients (item_name) VALUES ('milk');
INSERT INTO ingredients (item_name) VALUES ('cornmeal');
INSERT INTO ingredients (item_name) VALUES ('molasses');
INSERT INTO ingredients (item_name) VALUES ('cinnamon');
INSERT INTO ingredients (item_name) VALUES ('ginger');
INSERT INTO ingredients (item_name) VALUES ('nutmeg');
INSERT INTO ingredients (item_name) VALUES ('eggs');
INSERT INTO ingredients (item_name) VALUES ('bread flour');
INSERT INTO ingredients (item_name) VALUES ('pastry');
INSERT INTO ingredients (item_name) VALUES ('cream');
INSERT INTO ingredients (item_name) VALUES ('cornstarch');
INSERT INTO ingredients (item_name) VALUES ('whiskey');
INSERT INTO ingredients (item_name) VALUES ('whipping cream');
INSERT INTO ingredients (item_name) VALUES ('fresh grapefruit juice');
INSERT INTO ingredients (item_name) VALUES ('angostura bitters');
INSERT INTO ingredients (item_name) VALUES ('grapefruit rind');
INSERT INTO ingredients (item_name) VALUES ('kale');
INSERT INTO ingredients (item_name) VALUES ('peaches');
INSERT INTO ingredients (item_name) VALUES ('pecans');
INSERT INTO ingredients (item_name) VALUES ('apple cider vinegar');
INSERT INTO ingredients (item_name) VALUES ('miso');
INSERT INTO ingredients (item_name) VALUES ('grand marnier');
INSERT INTO ingredients (item_name) VALUES ('mint leaves');
INSERT INTO ingredients (item_name) VALUES ('chocolate');
INSERT INTO ingredients (item_name) VALUES ('heavy whipping cream');
INSERT INTO ingredients (item_name) VALUES ('goji berries');
INSERT INTO ingredients (item_name) VALUES ('vanilla extract');
INSERT INTO ingredients (item_name) VALUES ('american cheese');
INSERT INTO ingredients (item_name) VALUES ('cauliflower');
INSERT INTO ingredients (item_name) VALUES ('chicken or vegetable stock');
INSERT INTO ingredients (item_name) VALUES ('white bread');
INSERT INTO ingredients (item_name) VALUES ('caviar');
INSERT INTO ingredients (item_name) VALUES ('fresh tarragon');
INSERT INTO ingredients (item_name) VALUES ('salted butter');
INSERT INTO ingredients (item_name) VALUES ('table salt');
INSERT INTO ingredients (item_name) VALUES ('yeast');
INSERT INTO ingredients (item_name) VALUES ('sour cream');
INSERT INTO ingredients (item_name) VALUES ('egg');
INSERT INTO ingredients (item_name) VALUES ('all purpose flour');
INSERT INTO ingredients (item_name) VALUES ('whole wheat flour');
INSERT INTO ingredients (item_name) VALUES ('fresh dill');
INSERT INTO ingredients (item_name) VALUES ('vegetable oil');
INSERT INTO ingredients (item_name) VALUES ('applejack');
INSERT INTO ingredients (item_name) VALUES ('cherry');
INSERT INTO ingredients (item_name) VALUES ('ground beef');
INSERT INTO ingredients (item_name) VALUES ('ketchup');
INSERT INTO ingredients (item_name) VALUES ('seasoning');
INSERT INTO ingredients (item_name) VALUES ('worcestershire sauce');
INSERT INTO ingredients (item_name) VALUES ('hamburger buns');
INSERT INTO ingredients (item_name) VALUES ('cooked bacon');
INSERT INTO ingredients (item_name) VALUES ('black tea');
INSERT INTO ingredients (item_name) VALUES ('mango');
INSERT INTO ingredients (item_name) VALUES ('ground meat');
INSERT INTO ingredients (item_name) VALUES ('tomato');
INSERT INTO ingredients (item_name) VALUES ('iceberg lettuce');
INSERT INTO ingredients (item_name) VALUES ('mushroom');
INSERT INTO ingredients (item_name) VALUES ('cooking spray');
INSERT INTO ingredients (item_name) VALUES ('ground pepper');
INSERT INTO ingredients (item_name) VALUES ('mayonnaise');
INSERT INTO ingredients (item_name) VALUES ('sweet pickle relish');
INSERT INTO ingredients (item_name) VALUES ('steak sauce');
INSERT INTO ingredients (item_name) VALUES ('whole-wheat buns');
INSERT INTO ingredients (item_name) VALUES ('red onion');
INSERT INTO ingredients (item_name) VALUES ('pickles');
INSERT INTO ingredients (item_name) VALUES ('flour');
INSERT INTO ingredients (item_name) VALUES ('caster sugar');
INSERT INTO ingredients (item_name) VALUES ('pecan');
INSERT INTO ingredients (item_name) VALUES ('golden syrup');
INSERT INTO ingredients (item_name) VALUES ('vanilla essence');
INSERT INTO ingredients (item_name) VALUES ('muscovado sugar');
INSERT INTO ingredients (item_name) VALUES ('yellow onion');
INSERT INTO ingredients (item_name) VALUES ('green bell pepper');
INSERT INTO ingredients (item_name) VALUES ('garlic powder');
INSERT INTO ingredients (item_name) VALUES ('onion powder');
INSERT INTO ingredients (item_name) VALUES ('paprika');
INSERT INTO ingredients (item_name) VALUES ('red pepper flakes');
INSERT INTO ingredients (item_name) VALUES ('tomato sauce');
INSERT INTO ingredients (item_name) VALUES ('ground cinnamon');
INSERT INTO ingredients (item_name) VALUES ('elbow macaroni');
INSERT INTO ingredients (item_name) VALUES ('lemons');
INSERT INTO ingredients (item_name) VALUES ('potatoes');
INSERT INTO ingredients (item_name) VALUES ('haddock');
INSERT INTO ingredients (item_name) VALUES ('red chilli');
INSERT INTO ingredients (item_name) VALUES ('sunflower oil');
INSERT INTO ingredients (item_name) VALUES ('parsley');
INSERT INTO ingredients (item_name) VALUES ('bay leaves');
INSERT INTO ingredients (item_name) VALUES ('fennel seeds');
INSERT INTO ingredients (item_name) VALUES ('yukon gold potatoes');
INSERT INTO ingredients (item_name) VALUES ('crème fraîche');
INSERT INTO ingredients (item_name) VALUES ('mascarpone cheese');
INSERT INTO ingredients (item_name) VALUES ('orange zest');
INSERT INTO ingredients (item_name) VALUES ('tapioca');
INSERT INTO ingredients (item_name) VALUES ('baguette');
INSERT INTO ingredients (item_name) VALUES ('yellow onions');
INSERT INTO ingredients (item_name) VALUES ('sweet onions');
INSERT INTO ingredients (item_name) VALUES ('cognac');
INSERT INTO ingredients (item_name) VALUES ('fresh thyme');
INSERT INTO ingredients (item_name) VALUES ('low-sodium chicken stock');
INSERT INTO ingredients (item_name) VALUES ('beef stock');
INSERT INTO ingredients (item_name) VALUES ('white cheddar');
INSERT INTO ingredients (item_name) VALUES ('fine sea salt');
INSERT INTO ingredients (item_name) VALUES ('all-purpose flour');
INSERT INTO ingredients (item_name) VALUES ('celery');
INSERT INTO ingredients (item_name) VALUES ('rose wine');
INSERT INTO ingredients (item_name) VALUES ('extra-virgin olive oil');
INSERT INTO ingredients (item_name) VALUES ('white pepper');
INSERT INTO ingredients (item_name) VALUES ('skirt steak');
INSERT INTO ingredients (item_name) VALUES ('lime juice');
INSERT INTO ingredients (item_name) VALUES ('mustard');
INSERT INTO ingredients (item_name) VALUES ('baking soda');
INSERT INTO ingredients (item_name) VALUES ('orange marmalade');
INSERT INTO ingredients (item_name) VALUES ('kaffir lime leaves');
INSERT INTO ingredients (item_name) VALUES ('swiss cheese');
INSERT INTO ingredients (item_name) VALUES ('mustard powder');
INSERT INTO ingredients (item_name) VALUES ('light brown sugar');
INSERT INTO ingredients (item_name) VALUES ('pecorino romano cheese');
INSERT INTO ingredients (item_name) VALUES ('cheese');
INSERT INTO ingredients (item_name) VALUES ('barilla');
INSERT INTO ingredients (item_name) VALUES ('ricotta');
INSERT INTO ingredients (item_name) VALUES ('parmigiano reggiano cheese');
INSERT INTO ingredients (item_name) VALUES ('tomato paste');
INSERT INTO ingredients (item_name) VALUES ('sausage meat');
INSERT INTO ingredients (item_name) VALUES ('besan');
INSERT INTO ingredients (item_name) VALUES ('turmeric');
INSERT INTO ingredients (item_name) VALUES ('curry leaves');
INSERT INTO ingredients (item_name) VALUES ('grapefruit juice');
INSERT INTO ingredients (item_name) VALUES ('cinnamon sticks');
INSERT INTO ingredients (item_name) VALUES ('vegetable');
INSERT INTO ingredients (item_name) VALUES ('soy sauce');
INSERT INTO ingredients (item_name) VALUES ('baking powder');
INSERT INTO ingredients (item_name) VALUES ('light corn syrup');
INSERT INTO ingredients (item_name) VALUES ('canned tomatoes');
INSERT INTO ingredients (item_name) VALUES ('chicken');
INSERT INTO ingredients (item_name) VALUES ('straw mushrooms');
INSERT INTO ingredients (item_name) VALUES ('shredded sweetened coconut');
INSERT INTO ingredients (item_name) VALUES ('egg whites');
INSERT INTO ingredients (item_name) VALUES ('dried oregano');
INSERT INTO ingredients (item_name) VALUES ('pizza crust');
INSERT INTO ingredients (item_name) VALUES ('fresh rosemary');
INSERT INTO ingredients (item_name) VALUES ('rabbit');
INSERT INTO ingredients (item_name) VALUES ('bread');
INSERT INTO ingredients (item_name) VALUES ('mushrooms');
INSERT INTO ingredients (item_name) VALUES ('cheeses');
INSERT INTO ingredients (item_name) VALUES ('green chilies');
INSERT INTO ingredients (item_name) VALUES ('chickpeas');
INSERT INTO ingredients (item_name) VALUES ('blood oranges');
INSERT INTO ingredients (item_name) VALUES ('kimchi');
INSERT INTO ingredients (item_name) VALUES ('red bell pepper');
INSERT INTO ingredients (item_name) VALUES ('pork tenderloin');
INSERT INTO ingredients (item_name) VALUES ('semisweet chocolate');
INSERT INTO ingredients (item_name) VALUES ('butter beans');
INSERT INTO ingredients (item_name) VALUES ('chilies');
INSERT INTO ingredients (item_name) VALUES ('skinless chicken thighs');
INSERT INTO ingredients (item_name) VALUES ('leeks');
INSERT INTO ingredients (item_name) VALUES ('boneless pork loin');
INSERT INTO ingredients (item_name) VALUES ('plain yogurt');
INSERT INTO ingredients (item_name) VALUES ('cranberry beans');
INSERT INTO ingredients (item_name) VALUES ('chipotles');
INSERT INTO ingredients (item_name) VALUES ('coffee');
INSERT INTO ingredients (item_name) VALUES ('buttermilk');
INSERT INTO ingredients (item_name) VALUES ('sweet onion');
INSERT INTO ingredients (item_name) VALUES ('corn kernels');
INSERT INTO ingredients (item_name) VALUES ('lemongrass');
INSERT INTO ingredients (item_name) VALUES ('cracker crumbs');
INSERT INTO ingredients (item_name) VALUES ('ground chicken');
INSERT INTO ingredients (item_name) VALUES ('chili powder');
INSERT INTO ingredients (item_name) VALUES ('celery salt');
INSERT INTO ingredients (item_name) VALUES ('dried thyme');
INSERT INTO ingredients (item_name) VALUES ('shrimp');
INSERT INTO ingredients (item_name) VALUES ('fresh egg pasta');
INSERT INTO ingredients (item_name) VALUES ('starch');
INSERT INTO ingredients (item_name) VALUES ('dried figs');
INSERT INTO ingredients (item_name) VALUES ('rosemary');
INSERT INTO ingredients (item_name) VALUES ('broccoli');
INSERT INTO ingredients (item_name) VALUES ('rice');
INSERT INTO ingredients (item_name) VALUES ('sambal');
INSERT INTO ingredients (item_name) VALUES ('vegetables');
INSERT INTO ingredients (item_name) VALUES ('fermented black beans');
INSERT INTO ingredients (item_name) VALUES ('pumpkin seeds');
INSERT INTO ingredients (item_name) VALUES ('chicken gizzards');
INSERT INTO ingredients (item_name) VALUES ('eggplant');
INSERT INTO ingredients (item_name) VALUES ('green beans');
INSERT INTO ingredients (item_name) VALUES ('five-spice powder');
INSERT INTO ingredients (item_name) VALUES ('oyster sauce');
INSERT INTO ingredients (item_name) VALUES ('chinese cabbage');
INSERT INTO ingredients (item_name) VALUES ('rice wine');
INSERT INTO ingredients (item_name) VALUES ('sea scallops');
INSERT INTO ingredients (item_name) VALUES ('slices ginger');
INSERT INTO ingredients (item_name) VALUES ('vegetable stock');
INSERT INTO ingredients (item_name) VALUES ('chili peppers');
INSERT INTO ingredients (item_name) VALUES ('plum tomato');
INSERT INTO ingredients (item_name) VALUES ('egg noodles');
INSERT INTO ingredients (item_name) VALUES ('cranberries');
INSERT INTO ingredients (item_name) VALUES ('pink grapefruit juice');
INSERT INTO ingredients (item_name) VALUES ('tangerine juice');
INSERT INTO ingredients (item_name) VALUES ('evaporated milk');
INSERT INTO ingredients (item_name) VALUES ('soy nuts');
INSERT INTO ingredients (item_name) VALUES ('spareribs');
INSERT INTO ingredients (item_name) VALUES ('grapeseed oil');
INSERT INTO ingredients (item_name) VALUES ('smoked paprika');
INSERT INTO ingredients (item_name) VALUES ('pickled mustard greens');
INSERT INTO ingredients (item_name) VALUES ('frozen peas');
INSERT INTO ingredients (item_name) VALUES ('peanut oil');
INSERT INTO ingredients (item_name) VALUES ('sake');
INSERT INTO ingredients (item_name) VALUES ('boneless, skinless chicken breast');
INSERT INTO ingredients (item_name) VALUES ('brown sugar');
INSERT INTO ingredients (item_name) VALUES ('rib lamb chops');
INSERT INTO ingredients (item_name) VALUES ('scallions');
INSERT INTO ingredients (item_name) VALUES ('ground pork');
INSERT INTO ingredients (item_name) VALUES ('black bean');
INSERT INTO ingredients (item_name) VALUES ('carrots');
INSERT INTO ingredients (item_name) VALUES ('carrot');
INSERT INTO ingredients (item_name) VALUES ('curry powder');
INSERT INTO ingredients (item_name) VALUES ('sausages');
INSERT INTO ingredients (item_name) VALUES ('water chestnuts');
INSERT INTO ingredients (item_name) VALUES ('vodka');
INSERT INTO ingredients (item_name) VALUES ('beer');
INSERT INTO ingredients (item_name) VALUES ('st. louis-style spareribs');
INSERT INTO ingredients (item_name) VALUES ('spinach');
INSERT INTO ingredients (item_name) VALUES ('food coloring');
INSERT INTO ingredients (item_name) VALUES ('chicken breast');
INSERT INTO ingredients (item_name) VALUES ('white wine vinegar');
INSERT INTO ingredients (item_name) VALUES ('scallion');
INSERT INTO ingredients (item_name) VALUES ('green onion');
INSERT INTO ingredients (item_name) VALUES ('fresh ginger');
INSERT INTO ingredients (item_name) VALUES ('five spice');
INSERT INTO ingredients (item_name) VALUES ('broccoli rabe');
INSERT INTO ingredients (item_name) VALUES ('light soy sauce');
INSERT INTO ingredients (item_name) VALUES ('yogurt');
INSERT INTO ingredients (item_name) VALUES ('vinegar');
INSERT INTO ingredients (item_name) VALUES ('kosher salt');
INSERT INTO ingredients (item_name) VALUES ('hoisin sauce');
INSERT INTO ingredients (item_name) VALUES ('anchovies');
INSERT INTO ingredients (item_name) VALUES ('sesame oil');
INSERT INTO ingredients (item_name) VALUES ('red chile');
INSERT INTO ingredients (item_name) VALUES ('jasmine rice');
INSERT INTO ingredients (item_name) VALUES ('chinese black) mushrooms');
INSERT INTO ingredients (item_name) VALUES ('soy');
INSERT INTO ingredients (item_name) VALUES ('squid');
INSERT INTO ingredients (item_name) VALUES ('vanilla ice cream');
INSERT INTO ingredients (item_name) VALUES ('green tea');
INSERT INTO ingredients (item_name) VALUES ('octopus');
INSERT INTO ingredients (item_name) VALUES ('sweetened condensed milk');
INSERT INTO ingredients (item_name) VALUES ('pork ribs');
INSERT INTO ingredients (item_name) VALUES ('bean paste');
INSERT INTO ingredients (item_name) VALUES ('five spice powder');
INSERT INTO ingredients (item_name) VALUES ('chives');
INSERT INTO ingredients (item_name) VALUES ('toasted sesame oil');
INSERT INTO ingredients (item_name) VALUES ('bok choy');
INSERT INTO ingredients (item_name) VALUES ('broth');
INSERT INTO ingredients (item_name) VALUES ('brussels sprouts');
INSERT INTO ingredients (item_name) VALUES ('parmesan');
INSERT INTO ingredients (item_name) VALUES ('bananas');
INSERT INTO ingredients (item_name) VALUES ('campari');
INSERT INTO ingredients (item_name) VALUES ('ginger beer');
INSERT INTO ingredients (item_name) VALUES ('wine');
INSERT INTO ingredients (item_name) VALUES ('star anise');
INSERT INTO ingredients (item_name) VALUES ('sausage');
INSERT INTO ingredients (item_name) VALUES ('chipotle peppers');
INSERT INTO ingredients (item_name) VALUES ('corn');
INSERT INTO ingredients (item_name) VALUES ('dungeness crab');
INSERT INTO ingredients (item_name) VALUES ('tamari');
INSERT INTO ingredients (item_name) VALUES ('lettuce');
INSERT INTO ingredients (item_name) VALUES ('roast duck');
INSERT INTO ingredients (item_name) VALUES ('sesame');
INSERT INTO ingredients (item_name) VALUES ('fresh corn');
INSERT INTO ingredients (item_name) VALUES ('lemon rinds');
INSERT INTO ingredients (item_name) VALUES ('leek');
INSERT INTO ingredients (item_name) VALUES ('farro');
INSERT INTO ingredients (item_name) VALUES ('crushed red pepper');
INSERT INTO ingredients (item_name) VALUES ('mozzarella cheese');
INSERT INTO ingredients (item_name) VALUES ('roma tomatoes');
INSERT INTO ingredients (item_name) VALUES ('onions');
INSERT INTO ingredients (item_name) VALUES ('focaccia');
INSERT INTO ingredients (item_name) VALUES ('pasta');
INSERT INTO ingredients (item_name) VALUES ('asafoetida');
INSERT INTO ingredients (item_name) VALUES ('escarole');
INSERT INTO ingredients (item_name) VALUES ('haricots verts');
INSERT INTO ingredients (item_name) VALUES ('cocoa');
INSERT INTO ingredients (item_name) VALUES ('italian sausage');
INSERT INTO ingredients (item_name) VALUES ('fontina');
INSERT INTO ingredients (item_name) VALUES ('orange curacao');
INSERT INTO ingredients (item_name) VALUES ('arborio rice');
INSERT INTO ingredients (item_name) VALUES ('cumin');
INSERT INTO ingredients (item_name) VALUES ('gruyère');
INSERT INTO ingredients (item_name) VALUES ('butternut squash');
INSERT INTO ingredients (item_name) VALUES ('grana padano');
INSERT INTO ingredients (item_name) VALUES ('russet potatoes');
INSERT INTO ingredients (item_name) VALUES ('rum');
INSERT INTO ingredients (item_name) VALUES ('figs');
INSERT INTO ingredients (item_name) VALUES ('cloves');
INSERT INTO ingredients (item_name) VALUES ('hot dogs');
INSERT INTO ingredients (item_name) VALUES ('rice wine vinegar');
INSERT INTO ingredients (item_name) VALUES ('chipotles');
INSERT INTO ingredients (item_name) VALUES ('añejo');
INSERT INTO ingredients (item_name) VALUES ('sherry');
INSERT INTO ingredients (item_name) VALUES ('pieces ginger');
INSERT INTO ingredients (item_name) VALUES ('curry paste');
INSERT INTO ingredients (item_name) VALUES ('buns');
INSERT INTO ingredients (item_name) VALUES ('espresso');
INSERT INTO ingredients (item_name) VALUES ('baby back ribs');
INSERT INTO ingredients (item_name) VALUES ('bread crumbs');
INSERT INTO ingredients (item_name) VALUES ('baking chocolate');
INSERT INTO ingredients (item_name) VALUES ('chicken stock');
INSERT INTO ingredients (item_name) VALUES ('white wine');
INSERT INTO ingredients (item_name) VALUES ('85% lean ground beef');
INSERT INTO ingredients (item_name) VALUES ('ground veal');
INSERT INTO ingredients (item_name) VALUES ('veal stock');
INSERT INTO ingredients (item_name) VALUES ('ham');
INSERT INTO ingredients (item_name) VALUES ('gruyère cheese');
INSERT INTO ingredients (item_name) VALUES ('mustard seeds');
INSERT INTO ingredients (item_name) VALUES ('coconut sugar');
INSERT INTO ingredients (item_name) VALUES ('lemon-lime soda');
INSERT INTO ingredients (item_name) VALUES ('demerara+sugar');
INSERT INTO ingredients (item_name) VALUES ('peas');
INSERT INTO ingredients (item_name) VALUES ('hot dog buns');
INSERT INTO ingredients (item_name) VALUES ('minced ginger');
INSERT INTO ingredients (item_name) VALUES ('frozen raspberries');
INSERT INTO ingredients (item_name) VALUES ('ginger liqueur');
INSERT INTO ingredients (item_name) VALUES ('unsweetened coconut milk');
INSERT INTO ingredients (item_name) VALUES ('thai basil');
INSERT INTO ingredients (item_name) VALUES ('cream cheese');
INSERT INTO ingredients (item_name) VALUES ('cake flour');
INSERT INTO ingredients (item_name) VALUES ('cream of tartar');
INSERT INTO ingredients (item_name) VALUES ('parmesan cheese');
INSERT INTO ingredients (item_name) VALUES ('light cream');
INSERT INTO ingredients (item_name) VALUES ('capers');
INSERT INTO ingredients (item_name) VALUES ('yukon gold potato');
INSERT INTO ingredients (item_name) VALUES ('pecorino cheese');
INSERT INTO ingredients (item_name) VALUES ('tea');
INSERT INTO ingredients (item_name) VALUES ('dijon mustard');
INSERT INTO ingredients (item_name) VALUES ('medium shells');
INSERT INTO ingredients (item_name) VALUES ('red pepper');
INSERT INTO ingredients (item_name) VALUES ('saffron');
INSERT INTO ingredients (item_name) VALUES ('red wine');
INSERT INTO ingredients (item_name) VALUES ('oil');
INSERT INTO ingredients (item_name) VALUES ('green chilli');
INSERT INTO ingredients (item_name) VALUES ('almond flour');
INSERT INTO ingredients (item_name) VALUES ('spring onion');
INSERT INTO ingredients (item_name) VALUES ('semi-sweet chocolate');
INSERT INTO ingredients (item_name) VALUES ('barbecue sauce');
INSERT INTO ingredients (item_name) VALUES ('fish sauce');
INSERT INTO ingredients (item_name) VALUES ('chocolate wafer cookies');
INSERT INTO ingredients (item_name) VALUES ('sweet chocolate');
INSERT INTO ingredients (item_name) VALUES ('hot sauce');
INSERT INTO ingredients (item_name) VALUES ('swiss chard');
INSERT INTO ingredients (item_name) VALUES ('egg yolk');
INSERT INTO ingredients (item_name) VALUES ('ricotta cheese');
INSERT INTO ingredients (item_name) VALUES ('sage');
INSERT INTO ingredients (item_name) VALUES ('syrup');
INSERT INTO ingredients (item_name) VALUES ('half-and-half');
INSERT INTO ingredients (item_name) VALUES ('zucchini');
INSERT INTO ingredients (item_name) VALUES ('balsamic');
INSERT INTO ingredients (item_name) VALUES ('fenugreek');
INSERT INTO ingredients (item_name) VALUES ('gruyere cheese');
INSERT INTO ingredients (item_name) VALUES ('shallots');
INSERT INTO ingredients (item_name) VALUES ('coriander');
INSERT INTO ingredients (item_name) VALUES ('navel oranges');
INSERT INTO ingredients (item_name) VALUES ('cooking oil');
INSERT INTO ingredients (item_name) VALUES ('cooked chicken');
INSERT INTO ingredients (item_name) VALUES ('orange peel');
INSERT INTO ingredients (item_name) VALUES ('drumettes');
INSERT INTO ingredients (item_name) VALUES ('walnuts');
INSERT INTO ingredients (item_name) VALUES ('prosciutto');
INSERT INTO ingredients (item_name) VALUES ('barramundi');
INSERT INTO ingredients (item_name) VALUES ('pecorino');
INSERT INTO ingredients (item_name) VALUES ('parmigiano-reggiano');
INSERT INTO ingredients (item_name) VALUES ('chilli powder');
INSERT INTO ingredients (item_name) VALUES ('cremini');
INSERT INTO ingredients (item_name) VALUES ('veal chops');
INSERT INTO ingredients (item_name) VALUES ('demerara sugar');
INSERT INTO ingredients (item_name) VALUES ('ginger ale');
INSERT INTO ingredients (item_name) VALUES ('sriracha');
INSERT INTO ingredients (item_name) VALUES ('cilantro');
INSERT INTO ingredients (item_name) VALUES ('unsweetened cocoa powder');
INSERT INTO ingredients (item_name) VALUES ('fresh sage');
INSERT INTO ingredients (item_name) VALUES ('chicken broth');
INSERT INTO ingredients (item_name) VALUES ('cream of coconut');
INSERT INTO ingredients (item_name) VALUES ('chile powder');
INSERT INTO ingredients (item_name) VALUES ('cayenne');
INSERT INTO ingredients (item_name) VALUES ('panko');
INSERT INTO ingredients (item_name) VALUES ('fontina cheese');
INSERT INTO ingredients (item_name) VALUES ('grated nutmeg');
INSERT INTO ingredients (item_name) VALUES ('evoo');
INSERT INTO ingredients (item_name) VALUES ('dry white wine');
INSERT INTO ingredients (item_name) VALUES ('yoghurt');
INSERT INTO ingredients (item_name) VALUES ('coconut');
INSERT INTO ingredients (item_name) VALUES ('cider vinegar');
INSERT INTO ingredients (item_name) VALUES ('apples');

