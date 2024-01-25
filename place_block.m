function place_block(bl, rel_pos, wrt_block, gap)
% PLACE_BLOCK Place Simulink block with repect to another one
arguments
    bl (1,1) % block path or handle
    rel_pos (1,1) string {mustBeMember(rel_pos, ...
        ["right_of", "left_of", "below", "above", ...
        "right_below", "left_below", "right_above", "left_above"])}
    wrt_block (1,1) % block path or handle
    gap (1,1) {mustBeInteger, mustBeNonnegative} = 120
end

[lft, top, rgt, btm] = unpack(get_param(wrt_block, "Position"));
center = [lft + rgt, top+btm]/2;

[lft, top, rgt, btm] = unpack(get_param(bl, "Position"));
wdt = rgt - lft;
hgt = btm - top;

switch rel_pos
    case "right_of"
        delta = [gap, 0];
    case "left_of"
        delta = [-gap, 0];
    case "below"
        delta = [0, gap];
    case "above"
        delta = [0, -gap];
    case "right_below"
        delta = [gap, gap]/sqrt(2);
    case "left_below"
        delta = [-gap, gap]/sqrt(2);
    case "right_above"
        delta = [gap, -gap]/sqrt(2);
    case "left_above"
        delta = [-gap, -gap]/sqrt(2);
end
new_center = center + delta;
set_param(bl, "Position",  [
    new_center(1) - wdt/2 % left
    new_center(2) - hgt/2 % top
    new_center(1) + wdt/2 % right
    new_center(2) + hgt/2 % bottom
    ]);
end
