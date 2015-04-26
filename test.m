myId = 2;

HPS = HowiePositioningSystem;

[trans, xnt] = get_frame(HPS);

target = [30; 30];

kp = 1;
kd = 1;
a = 25;
t = 0;

oldError = 0;

OpenSwitch(SENSOR_1);

prey = 19;

while true
    HPS.fetch();
    ids = HPS.getVisibleIds();
    if (GetSwitch(SENSOR_1))
        NXT_PlayTone(400, 500);
        t = 0;
    end
    frame = frame_position(HPS, myId, trans, xnt);
    posError = target - frame(1:2);
    thetaTarget = radtodeg(atan2(posError(2), posError(1)));
    thetaError = thetaTarget - frame(3);
    l = thetaError * kp + kd * (thetaError - oldError);
    oldError = thetaError;
    set_motor_speed([l+50; -l+50]);
    pause(0.1);
    t = t + 0.1;
end
