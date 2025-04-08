local QBCore = exports['qb-core']:GetCoreObject()

---@param playerId number
---@return table
function GetPlayer(playerId)
    local player = { source = playerId }
    return player
end

---@param player table
---@return string citizenid
function GetCharacterId(player)
    local qbPlayer = QBCore.Functions.GetPlayer(player.source)
    return qbPlayer and qbPlayer.PlayerData.citizenid or nil
end

---@param player table
---@param filter string
---@return boolean
function IsPlayerInGroup(player, filter)
    local qbPlayer = QBCore.Functions.GetPlayer(player.source)
    if not qbPlayer then return false end

    local jobName = qbPlayer.PlayerData.job.name
    local jobGrade = qbPlayer.PlayerData.job.grade.level

    local expectedJob, requiredGrade = next(filter)

    return jobName == expectedJob and jobGrade >= requiredGrade
end
