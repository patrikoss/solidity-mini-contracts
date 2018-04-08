pragma solidity ^0.4.21;

/* Simple implementation of an iterable map */
contract IterableMap{
    uint32[] keys;
    mapping(uint32 => uint32) map;

    function getSize() constant returns (uint size){
        return keys.length;
    }

    function getElementByKey(uint32 key) constant returns (uint32 value) {
        require(isKeyPresent(key));
        return map[key];
    }
    
    function setElement(uint32 key, uint32 value) {
        if (!isKeyPresent(key)){
            keys.push(key);
        }
        map[key] = value;
    }
    
    function getElementKeyByIndex(uint index) constant returns (uint32 key) {
        require(index < getSize());
        return keys[index];
    }
    
    function getElemenValuetByIndex(uint index) constant returns (uint32 value){
        require(index < getSize());
        return map[keys[index]];
    }
    
    function isKeyPresent(uint32 key) constant returns (bool present){
        for (uint i=0; i < getSize(); i++) {
            if (keys[i] == key){
                return true;
            }
        }
        return false;
    }

}
