function [] = set_motor_speed( vs )

motorA = vs(1);
motorB = vs(2);

ma = max(min(motorA, 100), -100);
mb = max(min(motorB, 100), -100);

ma = round(ma);
mb = round(mb);

DirectMotorCommand(MOTOR_A, -ma, 0, 'off', 'off', 0, 'off');
DirectMotorCommand(MOTOR_B, -mb, 0, 'off', 'off', 0, 'off');

end