pragma solidity ^0.4.4;

contract Registry{

    enum shippedLocations { Pepe, Levis, JackNJones, Wrangler, Lee}
    enum materialStatusOptions {Ready, Consumed}
    
    struct billOfSupply{

        string materialId;    
        string materialName;
        uint materialQuantity;
        string materialOrigin;
        string materialZipcode;
        shippedLocations materialShippedTo;
        materialStatusOptions materialStaus;    
    }

    billOfSupply[] billsOfSupply;

    function createBillOfSupply(string name, uint quantity, string origin, string zipcode, uint8 shippedTo, uint8 status ){

        billOfSupply memory bos;
        bos.materialId = billsOfSupply.length;
        bos.materialName = name;
        bos.materialQuantity = quantity;
        bos.materialOrigin = origin;
        bos.materialZipcode = zipcode;
        bos.shippedTo = shippedLocations(shippedTo);
        bos.materialStaus = materialStatusOptions(status);

        billsOfSupply.push(bos);
    }

    function updateBillsOfSupply(uint mid, string name, uint quantity, string origin, string zipcode, uint8 shippedTo, uint8 status ){

        uint l = billsOfSupply.length;
        for(uint i=0; i<l; ++i)
        {
            if(billsOfSupply[i].materialId == mid)
             break;
        }
        billsOfSupply.materialId = billsOfSupply.length;
        billsOfSupply.materialName = name;
        billsOfSupply.materialQuantity = quantity;
        billsOfSupply.materialOrigin = origin;
        billsOfSupply.materialZipcode = zipcode;
        billsOfSupply.shippedTo = shippedLocations(shippedTo);
        billsOfSupply.materialStaus = materialStatusOptions(status);

    }

}
