pragma solidity ^0.4.4;

contract managePalette {

  address public owner;

  enum paletteStatusOptions {Created, Consumed}

  struct palette{
    string paletteBarCode;
    string paletteWeight;
    string products;
    paletteStatusOptions paletteStatus;
  }

  palette[] palettes;


  function managePalette() {
  	owner = msg.sender;
  }

  function createPalette(string barCode, string weight, string products , uint8 status ){

    palette memory paletteObj;
    paletteObj.paletteBarCode = barCode;
    paletteObj.paletteWeight = weight;
    paletteObj.products = products; 
    paletteObj.paletteStatus = paletteStatusOptions(status);

    palettes.push(paletteObj);
  }

  function updatePalette(string barCode, string weight, string products , uint8 status ){

        uint l = palettes.length;
        for(uint i=0; i<l; ++i)
        {
          if(stringsEqual(palettes[i].paletteBarCode,barCode)==true)
				      break;
	 		  }
        palettes[i].paletteWeight = weight;
        palettes[i].products = products;
        palettes[i].paletteStatus = paletteStatusOptions(status);        
  }

  function getPaletteById(string barCode) returns(string weight, string products, paletteStatusOptions status  ){

        uint l = palettes.length;
        for(uint i=0; i<l; ++i)
        {
          if(stringsEqual(palettes[i].paletteBarCode,barCode)==true)
				      break;
	 		  }

        weight = palettes[i].paletteWeight;
        products = palettes[i].products;
        status = palettes[i].paletteStatus; 
  }

  function getProductByPaletteId(string barCode) returns (string paletteProducts){
        
        uint l = palettes.length;
        for(uint i=0; i<l; ++i)
        {
          if(stringsEqual(palettes[i].paletteBarCode,barCode)==true)
				      break;
	 		  }

        paletteProducts = palettes[i].products; 

  }

  function getPaletteByIndex(uint index) returns (string barCode, string weight, string products, paletteStatusOptions status  ){
        
        barCode = palettes[index].paletteBarCode;
        weight = palettes[index].paletteWeight;
        products = palettes[index].products;
        status = palettes[index].paletteStatus; 
  
  }

  // utility function
  function getLength() returns(uint l){
      l=palettes.length;
    }


      // utility function
  function stringsEqual(string storage _a, string memory _b) internal returns (bool) {
      bytes storage a = bytes(_a);
      bytes memory b = bytes(_b);
      if (a.length != b.length) return false;
      for (uint i = 0;i < a.length;i++) if (a[i] != b[i]) return false;
          return true;
  }


  





}
