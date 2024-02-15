local M = {}

function M.init(env)
end

function M.func(key, env)
    local engine = env.engine
    local context = env.engine.context
    local input = context.input

    local composition = context.composition
    local segment = composition:back()
    if segment == nil then
        return 2
    end
    if segment.menu == nil then
        return 2
    end

    local candidate_count = segment.menu:candidate_count()
    if candidate_count == 1 and input:sub(1, 1) ~= "`" then
        local commit_text = segment:get_candidate_at(0).text
        engine:commit_text(commit_text)
        context:clear()
        return 1
    end

    return 2
end

return M
