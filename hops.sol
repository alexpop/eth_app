pragma solidity ^0.4.0;

/**
 * @title GPS Tracking Chain
 */
contract test {
    //enum State { Collected, Point, Handover, Delivered }
    struct Hop {
      address provider;
      string state;
      string lat;
      string long;
      string note;
    }
    mapping(string => Hop[]) hops;
    /**
     * @dev Add a hop for a sku ID to the blockchain
     * @param sku The ID of the item to track
     * @param provider The ID of the item to track
     * @param state The ID of the item to track. Ex: "Accepted"
     * @param lat The latitude of the item to track. Ex: "-89.123456"
     * @param long The longitude of the item to track. Ex: "53.123456"
     * @param note Optional notes about this hop
     */
    function AddHop(string sku, address provider, string state, string lat, string long, string note) public {
      Hop memory h = Hop(provider, state, lat, long, note);
      hops[sku].push(h);
    }

    /**
     * @dev Retrieve the list of hops for the sku provided
     * @param sku The ID of the item to get the hops from
     */
    function GetHops(string sku) public returns (Hop[]) {
      return hops[sku];
    }

    /**
     * @dev Retrieve the hops for the sku provided
     * @param sku The ID of the item to get the hops from
     */
    function GetHopsCount(string sku) public constant returns(uint d) {
      return hops[sku].length;
    }
}
