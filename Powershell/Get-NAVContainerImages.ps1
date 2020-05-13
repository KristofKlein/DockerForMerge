param([String]$TagsFilter = '', [String]$RegistryType)

switch ($RegistryType) {
    "NAV" { $Registry = "https://mcrflowprodcentralus.cdn.mscr.io/mcrprod/dynamicsnav?P1=1589370103&P2=1&P3=1&P4=wSor0g4nIu20XYl34QhtFFJ9j4eLQWozcAlbSY8rwiM%3D&se=2020-05-13T11%3A41%3A43Z&sig=2TzSwznQi5yDjyf7hM0Makpyo4Df8UuHPszfV775GXg%3D&sp=r&sr=b&sv=2015-02-21" }
    "BC" { $Registry = "https://mcr.microsoft.com/v2/businesscentral/onprem/tags/list"
}

    Default { $Registry = "https://mcr.microsoft.com/v2/businesscentral/onprem/tags/list" }
}
$Registry
$result = Invoke-WebRequest -Uri $Registry 
$JsonObject = ConvertFrom-Json -InputObject $result.Content
$tags = $JsonObject.tags

$tags.count                                #Number of Tags

if ($TagsFilter -eq '') {
    $tags    
} else {
$tags | Where-Object {$_ -like "*$TagsFilter*"}
}