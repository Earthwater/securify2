pragma solidity ^0.5.0;

contract TestContract {
    uint storedVar;

    function store(uint v) public {
        storedVar = v;
    }

    function load() public returns (uint) {
        return storedVar;
    }

    function loadAndSink() public {
        sink(load());
    }

    function resetStorageIfTrue(bool condition) public {
        if (condition)
            store(0);
    }

    function main() public payable {
        store(2);
        loadAndSink();

        store(msg.value);
        store(2);
        loadAndSink();

        store(msg.value);
        resetStorageIfTrue(true);
        loadAndSink();

        resetStorageIfTrue(2 == 2);
        loadAndSink();
    }

    // Sink functions (need to be part of the contract)
    function sink(address _) pure public {}

    function sink(uint _) pure public {}
}
