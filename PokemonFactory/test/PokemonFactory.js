const { expect } = require("chai");

describe("Pokemon contract", function () {
    it("Pokemon Factory shouldn't have pokemons", async function () {

        // const [owner] = await ethers.getSigners(); // Esto lo ocuparán para crear un pokemon

        const PokemonFactory = await ethers.getContractFactory("PokemonFactory");

        const hardhatPokemon = await PokemonFactory.deploy();

        const pokemons = await hardhatPokemon.getAllPokemons();

        expect(pokemons.length).to.equal(0);

    });

    // Reto 5
    it('There must be 2 pokemons', async function() {
      
        const PokemonFactory = await ethers.getContractFactory("PokemonFactory");
        const hardhatPokemon = await PokemonFactory.deploy();
        await hardhatPokemon.createPokemon('Pokemon1', 1, 'Fire', 'Fire is the ability');
        await hardhatPokemon.createPokemon('Pokemon2', 2, 'Water', 'Water is the ability');
        const pokemons = await hardhatPokemon.getAllPokemons();

        // Test assertion
      expect(pokemons.length).to.equal(2);
    });
    
});