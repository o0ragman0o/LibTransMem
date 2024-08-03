# LibTransMem

A simple library to get, set and compare values in transitory memory.

author: Darryl Morris (o0ragman0o)  
updated: 3 August 2024

## About
Since the the Cancun update of the Ethereum blockchain, the Ethereum Virtual Machine (EVM) now has
an additional memory type maintained in the executing context which persists for the life of the
tranaction. Transient memory is as cost efficient as normal memory but unlike normal memory, transient
memory will remain even if the contract calls out to another contract. This allows for single transaction
callbacks and other rentry behaviour and composability where persistent information would otherwise need
to be held in expensive state, even if it were disposable.

As Solidity to date has no special key words for specifying a variable should be in transient memory, this
library provisions a contract lower level `get()`, `set()`, and `eq()` (equate) functions working at the
slot level of transient memory 

## Example
```solidity

    pragma solidity >= 0.8.25;
    
    import "https://github.com/o0ragman0o/LibTranMem/src/libTransMem.sol";

    contract TransMem {

        using LibTranMem for uint256;

        uint256 constant T_SLOT_0 = 0;

        function get() public view returns (uint256)
        {
            return T_SLOT_0.get();
        }

        function set(uint256 val) public view
        {
            T_SLOT_0.set(val);
        }

        function eq(uin256 val) public view returns (bool)
        {
            return T_SLOT_0.eq(val);
        }
    }
```
