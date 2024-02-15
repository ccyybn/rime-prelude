local function remove_tip(input, env)
    local engine = env.engine
    local context = env.engine.context
    local code = context.input
    local codeLen = #code

    for cand in input:iter() do
        local text = cand.text
        local comment = cand.comment

        if #comment > 0 and comment:sub(1, 1) == "~" then
            yield(Candidate(cand.type, 0, codeLen, text, ""))
        else
            yield(cand)
        end
    end
end

return remove_tip
