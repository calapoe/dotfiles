-- Ref: https://gist.github.com/micimize/bdcbc92b31ec7158c3b2c0186f0c53b6
local hs = hs

local M = {
    wins = hs.window,
    wf = hs.window.filter,
    g = hs.geometry,
}
function M.cycleBehind(geom)
    print('here1')
end

function M.getWindowsBehind(geom)
    local currWin = M.wins.frontmostWindow()
    -- local wins = M.wins.allWindows()
    local wf = M.wf.copy(M.wf.defaultCurrentSpace)
    local wins = wf:getWindows()
    for i = 1, #wins do
        print('Window behind is: ........', wins[i])
        x1, y1 = currWin:frame().x, currWin:frame().y
        w1, h1 = currWin:frame().w, currWin:frame().h
        x2, y2 = wins[i]:frame().x, wins[i]:frame().y
        w2, h2 = wins[i]:frame().w, wins[i]:frame().h
        if x1 + w1 <= x2 or x2 + w2 <= x1 then
            print('No overlap')
        end

        if y1 + h1 <= y2 or y2 + h2 <= y1 then
            print('No overlap')
        end

        wins[i + 1]:focus()
        break
    end
end

function M.interects(r1, r2)
    print(r1, r2)
end

return M

