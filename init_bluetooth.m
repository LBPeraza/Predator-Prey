function [ nxt ] = init_bluetooth ()

nxt = COM_OpenNXT('bluetooth.ini');
COM_SetDefaultNXT(nxt);

end