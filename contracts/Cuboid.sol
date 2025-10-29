// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Cuboid Project
 * @dev A simple Solidity contract to represent a 3D cuboid object and perform basic calculations.
 */

contract Project {
    struct Cuboid {
        uint256 length;
        uint256 width;
        uint256 height;
        address owner;
    }

    Cuboid private cuboid;

    event CuboidCreated(address indexed owner, uint256 length, uint256 width, uint256 height);
    event DimensionsUpdated(uint256 length, uint256 width, uint256 height);

    /**
     * @dev Creates a cuboid with given dimensions.
     * Requirements:
     * - Dimensions must be greater than zero.
     */
    function createCuboid(uint256 _length, uint256 _width, uint256 _height) external {
        require(_length > 0 && _width > 0 && _height > 0, "Dimensions must be positive");
        cuboid = Cuboid(_length, _width, _height, msg.sender);
        emit CuboidCreated(msg.sender, _length, _width, _height);
    }

    /**
     * @dev Returns the volume of the cuboid.
     */
    function getVolume() external view returns (uint256) {
        return cuboid.length * cuboid.width * cuboid.height;
    }

    /**
     * @dev Updates the dimensions of the cuboid.
     * Can only be called by the owner.
     */
    function updateDimensions(uint256 _length, uint256 _width, uint256 _height) external {
        require(msg.sender == cuboid.owner, "Only owner can update dimensions");
        require(_length > 0 && _width > 0 && _height > 0, "Dimensions must be positive");
        cuboid.length = _length;
        cuboid.width = _width;
        cuboid.height = _height;
        emit DimensionsUpdated(_length, _width, _height);
    }

    /**
     * @dev Returns current cuboid details.
     */
    function getCuboidDetails() external view returns (uint256, uint256, uint256, address) {
        return (cuboid.length, cuboid.width, cuboid.height, cuboid.owner);
    }
}
