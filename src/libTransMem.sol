// SPDX-License-Identifier: MIT

/*
file:   libTransMem.sol
version: 0.0.1
updated:3-August-2024
author: Darryl Morris (o0ragman0o)
email:  o0ragman0o+sol AT gmail.com

A simple library to get, set and compare values in transitory memory.

----
    import "./libTransMem.sol";

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
----

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
See MIT Licence for further details.
<https://opensource.org/licenses/MIT>.
*/

pragma solidity >= 0.8.25;


library LibTranMem {

    function get(uint256 slot) internal view returns (uint256 val)
    {
        assembly {
           val := tload(slot)
        }
    }

    function set(uint256 slot, uint256 val) internal
    {
        assembly {
           tstore(slot, val)
        }
    }

    function eq(uint256 slot, uint256 test) internal view returns (bool valid)
    {
        assembly {
            let ctx := tload(slot)
            valid := eq(test, ctx)
        }
    }
}