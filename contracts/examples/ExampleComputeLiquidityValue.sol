pragma solidity =0.6.6;

import '../libraries/PyladesLiquidityMathLibrary.sol';

contract ExampleComputeLiquidityValue {
    using SafeMath for uint256;

    address public immutable factory;

    constructor(address factory_) public {
        factory = factory_;
    }

    // see PyladesLiquidityMathLibrary#getReservesAfterArbitrage
    function getReservesAfterArbitrage(
        address tokenA,
        address tokenB,
        uint256 truePriceTokenA,
        uint256 truePriceTokenB
    ) external view returns (uint256 reserveA, uint256 reserveB) {
        return
            PyladesLiquidityMathLibrary.getReservesAfterArbitrage(
                factory,
                tokenA,
                tokenB,
                truePriceTokenA,
                truePriceTokenB
            );
    }

    // see PyladesLiquidityMathLibrary#getLiquidityValue
    function getLiquidityValue(
        address tokenA,
        address tokenB,
        uint256 liquidityAmount
    ) external view returns (uint256 tokenAAmount, uint256 tokenBAmount) {
        return PyladesLiquidityMathLibrary.getLiquidityValue(factory, tokenA, tokenB, liquidityAmount);
    }

    // see PyladesLiquidityMathLibrary#getLiquidityValueAfterArbitrageToPrice
    function getLiquidityValueAfterArbitrageToPrice(
        address tokenA,
        address tokenB,
        uint256 truePriceTokenA,
        uint256 truePriceTokenB,
        uint256 liquidityAmount
    ) external view returns (uint256 tokenAAmount, uint256 tokenBAmount) {
        return
            PyladesLiquidityMathLibrary.getLiquidityValueAfterArbitrageToPrice(
                factory,
                tokenA,
                tokenB,
                truePriceTokenA,
                truePriceTokenB,
                liquidityAmount
            );
    }

    // test function to measure the gas cost of the above function
    function getGasCostOfGetLiquidityValueAfterArbitrageToPrice(
        address tokenA,
        address tokenB,
        uint256 truePriceTokenA,
        uint256 truePriceTokenB,
        uint256 liquidityAmount
    ) external view returns (uint256) {
        uint256 gasBefore = gasleft();
        PyladesLiquidityMathLibrary.getLiquidityValueAfterArbitrageToPrice(
            factory,
            tokenA,
            tokenB,
            truePriceTokenA,
            truePriceTokenB,
            liquidityAmount
        );
        uint256 gasAfter = gasleft();
        return gasBefore - gasAfter;
    }
}
