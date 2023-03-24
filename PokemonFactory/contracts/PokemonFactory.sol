// SPDX-License-Identifier: GPL-3.0  

pragma solidity >= 0.7.0 <0.9.0;

contract PokemonFactory {

    struct ability{
        string ability;
        string desccription;
    }

    struct Pokemon{
        uint id;
        string name;
        ability abilities; //Reto #4
    }

    Pokemon[] private pokemons;
    mapping (uint => address) public pokemonToOwner;
    mapping(address => uint) ownerPokemonCount;

    // Reto #1
    event eventNewPokemon(
        string pokemonCreated
    );

    function createPokemon (string memory _name, uint _id, string memory _hability, string memory _description) public{

        require(_id > 0, "Pokemon ID must be greater than 0"); // Reto #2
        require(bytes(_name).length > 2, "Pokemon's name must contain more thatn 2 charaters"); // Reto #2

        pokemons.push(Pokemon(_id, _name, ability(_hability, _description)));
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
        emit eventNewPokemon(_name); // Reto #1
    }

    function getAllPokemons() public view returns(Pokemon[] memory){
        return pokemons;
    }

}