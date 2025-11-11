@experimental
price_vbucks<native><public> := class<final><computes><internal>(price_dimension):


@experimental
MakePriceVBucks<native><public>(Amount:float)<converges>:price_vbucks

@experimental
GetPriceVBucks<native><public>(P:price_vbucks):float