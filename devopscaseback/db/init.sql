-- init.sql

CREATE TABLE IF NOT EXISTS pokemons (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255),
  description TEXT,
  image_url TEXT
);

INSERT INTO pokemons (name, type, description, image_url) VALUES
  ('Bulbasaur', 'Grass', 'For some time after its birth, it uses the nutrients that are packed into the seed on its back in order to grow.', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/001.png'),
  ('Ivysaur', 'Grass', 'The more sunlight Ivysaur bathes in, the more strength wells up within it, allowing the bud on its back to grow larger.', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/002.png'),
  ('Venusaur', 'Grass', 'While it basks in the sun, it can convert the light into energy. As a result, it is more powerful in the summertime.', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/003.png'),
  ('Charmander', 'Fire', 'The flame on its tail shows the strength of its life-force. If Charmander is weak, the flame also burns weakly.', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/004.png'),
  ('Charizard', 'Fire', 'If Charizard becomes truly angered, the flame at the tip of its tail burns in a light blue shade.', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/006.png'),
  ('Squirtle', 'Water', 'After birth, its back swells and hardens into a shell. It sprays a potent foam from its mouth.', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/007.png'),
  ('Blastoise', 'Water', 'It deliberately increases its body weight so it can withstand the recoil of the water jets it fires.', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/009.png'),
  ('Caterpie', 'Bug', 'For protection, it releases a horrible stench from the antenna on its head to drive away enemies.', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/010.png'),
  ('Butterfree', 'Bug', 'It loves the nectar of flowers and can locate flower patches that have even tiny amounts of pollen.', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/012.png'),
  ('Pikachu', 'Electric', 'When it is angered, it immediately discharges the energy stored in the pouches in its cheeks.', 'https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/025.png');
  ('Sandslash','Ground','It is adept at attacking with the spines on its back and its sharp claws while quickly scurrying about.','https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/028.png' )