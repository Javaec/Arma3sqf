activateAddons [
];

if !(isNull findDisplay 128) then {[] call (uinamespace getvariable 'bis_fnc_recompile');};
_initCodes = [];

_this = createCenter civilian;
_center_0 = _this;

_group_0 = createGroup _center_0;

_unit_0 = objNull;
if (true) then
{
	_this = _group_0 createUnit ["C_man_p_fugitive_F_euro", [14049.574, 18643.195, 0.093171418], [], 0, "CAN_COLLIDE"];
	_unit_0 = _this;
	_this setPos [14049.574, 18643.195, 0.093171418];
	_this setDir 783.1701;
	_this setVehicleVarName "BIS_placeholderPlayer";
	BIS_placeholderPlayer = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_0 selectLeader _this;};
	if (true) then {selectPlayer _this;};
};

_vehicle_24 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_L_F", [14081.891, 18536.977, 4.5776367e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_24 = _this;
	_this setDir 124.38332;
	_this setPos [14081.891, 18536.977, 4.5776367e-005];
};

_vehicle_30 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_L_F", [14052.759, 18556.219, -8.7738037e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_30 = _this;
	_this setDir -66.808395;
	_this setPos [14052.759, 18556.219, -8.7738037e-005];
};

_vehicle_41 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14079.355, 18539.107, -0.00017547607], [], 0, "CAN_COLLIDE"];
	_vehicle_41 = _this;
	_this setPos [14079.355, 18539.107, -0.00017547607];
};

_vehicle_43 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14076.714, 18540.746, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_43 = _this;
	_this setPos [14076.714, 18540.746, 9.1552734e-005];
};

_vehicle_45 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14065.86, 18547.432, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_45 = _this;
	_this setPos [14065.86, 18547.432, 5.7220459e-006];
};

_vehicle_47 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14063.074, 18549.254, -3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_47 = _this;
	_this setPos [14063.074, 18549.254, -3.8146973e-005];
};

_vehicle_49 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14056.014, 18553.512, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_49 = _this;
	_this setPos [14056.014, 18553.512, -3.8146973e-006];
};

_vehicle_59 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14074.173, 18542.15, -8.2015991e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_59 = _this;
	_this setPos [14074.173, 18542.15, -8.2015991e-005];
};

_vehicle_60 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14071.536, 18543.766, 0.0072193146], [], 0, "CAN_COLLIDE"];
	_vehicle_60 = _this;
	_this setPos [14071.536, 18543.766, 0.0072193146];
};

_vehicle_61 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14069.059, 18545.434, 0.013065338], [], 0, "CAN_COLLIDE"];
	_vehicle_61 = _this;
	_this setPos [14069.059, 18545.434, 0.013065338];
};

_vehicle_62 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14059.73, 18551.258, 0.0085048676], [], 0, "CAN_COLLIDE"];
	_vehicle_62 = _this;
	_this setPos [14059.73, 18551.258, 0.0085048676];
};

_vehicle_63 = objNull;
if (true) then
{
	_this = createVehicle ["RoadCone_F", [14053.119, 18561.355, 0.00044631958], [], 0, "CAN_COLLIDE"];
	_vehicle_63 = _this;
	_this setPos [14053.119, 18561.355, 0.00044631958];
};

_vehicle_72 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbagePallet_F", [14074.271, 18546.883, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_72 = _this;
	_this setDir 31.464014;
	_this setPos [14074.271, 18546.883, -2.2888184e-005];
};

_vehicle_148 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CinderBlocks_F", [13941.572, 18726.863, -0.00010490417], [], 0, "CAN_COLLIDE"];
	_vehicle_148 = _this;
	_this setDir 28.446051;
	_this setPos [13941.572, 18726.863, -0.00010490417];
};

_vehicle_150 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CinderBlocks_F", [13939.387, 18726.652, -5.7220459e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_150 = _this;
	_this setDir -28.005859;
	_this setPos [13939.387, 18726.652, -5.7220459e-005];
};

_vehicle_154 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CinderBlocks_F", [13938.827, 18728.354, -0.00015830994], [], 0, "CAN_COLLIDE"];
	_vehicle_154 = _this;
	_this setDir -139.78505;
	_this setPos [13938.827, 18728.354, -0.00015830994];
};

_vehicle_156 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CinderBlocks_F", [13937.333, 18727.012, 3.2424927e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_156 = _this;
	_this setDir -142.85033;
	_this setPos [13937.333, 18727.012, 3.2424927e-005];
};

_vehicle_159 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V2_F", [13941.894, 18722.885, -6.2942505e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_159 = _this;
	_this setDir 59.791004;
	_this setPos [13941.894, 18722.885, -6.2942505e-005];
};

_vehicle_161 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V1_F", [13930.773, 18718.809, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_161 = _this;
	_this setPos [13930.773, 18718.809, 3.0517578e-005];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_AthiraTruck_01,[0.1,-1.3,-0.6]]"]];
};

_vehicle_162 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V4_F", [13942.947, 18721.666], [], 0, "CAN_COLLIDE"];
	_vehicle_162 = _this;
	_this setDir -42.713772;
	_this setPos [13942.947, 18721.666];
};

_vehicle_163 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ToiletBox_F", [13935.413, 18729.971, -1.335144e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_163 = _this;
	_this setDir 60.771446;
	_this setPos [13935.413, 18729.971, -1.335144e-005];
};

_vehicle_164 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_box_F", [13949.226, 18705.131, 0.13712496], [], 0, "CAN_COLLIDE"];
	_vehicle_164 = _this;
	_this setDir -229.89503;
	_this setVehicleLock "LOCKED";
	_this setPos [13949.226, 18705.131, 0.13712496];
};

_vehicle_165 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_transport_F", [13944.308, 18719.518, 0.22472329], [], 0, "CAN_COLLIDE"];
	_vehicle_165 = _this;
	_this setDir 51.490925;
	_this setVehicleVarName "BIS_AthiraTruck_01";
	BIS_AthiraTruck_01 = _this;
	_this setVehicleLock "LOCKED";
	_this setPos [13944.308, 18719.518, 0.22472329];
};

_vehicle_167 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Bricks_V1_F", [13931.554, 18717.225, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_167 = _this;
	_this setDir -23.322443;
	_this setPos [13931.554, 18717.225, 7.6293945e-006];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_AthiraTruck_01,[-0.05,-2.5,-0.6]]"]];
};

_vehicle_169 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Scaffolding_F", [13934.653, 18741.777, -5.7220459e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_169 = _this;
	_this setDir -21.621712;
	_this setPos [13934.653, 18741.777, -5.7220459e-005];
	_initCodes set [count _initCodes,[_this,"this setVectorUp [0,0,1]"]];
};

_vehicle_170 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [13860.525, 18656.434], [], 0, "CAN_COLLIDE"];
	_vehicle_170 = _this;
	_this setDir 24.595415;
	_this setPos [13860.525, 18656.434];
};

_vehicle_171 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbagePallet_F", [13861.723, 18653.809, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_171 = _this;
	_this setDir 66.289009;
	_this setPos [13861.723, 18653.809, -7.6293945e-006];
};

_vehicle_173 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_sport_F", [14093.339, 18645.316, 0.11237071], [], 0, "CAN_COLLIDE"];
	_vehicle_173 = _this;
	_this setDir -49.062542;
	_this setVehicleLock "LOCKED";
	_this setPos [14093.339, 18645.316, 0.11237071];
};

_vehicle_176 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [13923.837, 18735.084, 0.19267756], [], 0, "CAN_COLLIDE"];
	_vehicle_176 = _this;
	_this setDir -8.0132399;
	_this setPos [13923.837, 18735.084, 0.19267756];
};

_vehicle_178 = objNull;
if (true) then
{
	_this = createVehicle ["Land_PortableLight_double_F", [13927.115, 18724.67, -9.5367432e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_178 = _this;
	_this setDir -152.04294;
	_this setPos [13927.115, 18724.67, -9.5367432e-005];
};

_vehicle_179 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WheelCart_F", [13940.009, 18721.486, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_179 = _this;
	_this setDir -19.033413;
	_this setPos [13940.009, 18721.486, -1.1444092e-005];
};

_vehicle_181 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WheelCart_F", [13931.526, 18736.635, 1.9073486e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_181 = _this;
	_this setDir 190.29834;
	_this setPos [13931.526, 18736.635, 1.9073486e-005];
};

_vehicle_183 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WorkStand_F", [13933.274, 18732.992, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_183 = _this;
	_this setDir -117.68082;
	_this setPos [13933.274, 18732.992, 1.1444092e-005];
};

_vehicle_185 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Gloves_F", [13938.554, 18725.598, -4.7683716e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_185 = _this;
	_this setDir -125.82021;
	_this setPos [13938.554, 18725.598, -4.7683716e-005];
};

_vehicle_191 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Carousel_01_F", [14101.569, 18472.443, 0.00011253357], [], 0, "CAN_COLLIDE"];
	_vehicle_191 = _this;
	_this setDir 56.237808;
	_this setPos [14101.569, 18472.443, 0.00011253357];
};

_vehicle_192 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Slide_F", [14111.167, 18460.854, -0.00011062622], [], 0, "CAN_COLLIDE"];
	_vehicle_192 = _this;
	_this setDir 61.818436;
	_this setPos [14111.167, 18460.854, -0.00011062622];
};

_vehicle_193 = objNull;
if (true) then
{
	_this = createVehicle ["Land_SlideCastle_F", [14115.956, 18429.631, -7.2479248e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_193 = _this;
	_this setDir -29.458208;
	_this setPos [14115.956, 18429.631, -7.2479248e-005];
};

_vehicle_194 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Swing_01_F", [14116.084, 18442.133, -3.4332275e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_194 = _this;
	_this setDir 74.130592;
	_this setPos [14116.084, 18442.133, -3.4332275e-005];
};

_vehicle_196 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Swing_01_F", [14115.091, 18445.488, -0.00015640259], [], 0, "CAN_COLLIDE"];
	_vehicle_196 = _this;
	_this setDir -106.25617;
	_this setPos [14115.091, 18445.488, -0.00015640259];
};

_vehicle_198 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Swing_01_F", [14113.972, 18448.545, -9.5367432e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_198 = _this;
	_this setDir 74.130592;
	_this setPos [14113.972, 18448.545, -9.5367432e-005];
};

_vehicle_201 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Carousel_01_F", [14107.059, 18475.002, 6.4849854e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_201 = _this;
	_this setDir 141.30428;
	_this setPos [14107.059, 18475.002, 6.4849854e-005];
};

_vehicle_203 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Carousel_01_F", [14109.345, 18469.596], [], 0, "CAN_COLLIDE"];
	_vehicle_203 = _this;
	_this setDir 233.70195;
	_this setPos [14109.345, 18469.596];
};

_vehicle_205 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Carousel_01_F", [14103.983, 18467.613, -0.00011253357], [], 0, "CAN_COLLIDE"];
	_vehicle_205 = _this;
	_this setDir -31.82081;
	_this setPos [14103.983, 18467.613, -0.00011253357];
};

_vehicle_208 = objNull;
if (true) then
{
	_this = createVehicle ["Land_SlideCastle_F", [14100.355, 18484.549, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_208 = _this;
	_this setDir 51.814857;
	_this setPos [14100.355, 18484.549, -1.9073486e-006];
};

_vehicle_213 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Swing_01_F", [14099.205, 18440.713, -2.6702881e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_213 = _this;
	_this setDir 239.50464;
	_this setPos [14099.205, 18440.713, -2.6702881e-005];
};

_vehicle_214 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Swing_01_F", [14101.026, 18437.713, 0.12458611], [], 0, "CAN_COLLIDE"];
	_vehicle_214 = _this;
	_this setDir 59.11784;
	_this setPos [14101.026, 18437.713, 0.12458611];
};

_vehicle_215 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Swing_01_F", [14102.872, 18435.039, 0.23960876], [], 0, "CAN_COLLIDE"];
	_vehicle_215 = _this;
	_this setDir 239.50464;
	_this setPos [14102.872, 18435.039, 0.23960876];
};

_vehicle_220 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Slide_F", [14096.12, 18449.813, -9.9182129e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_220 = _this;
	_this setDir 250.58005;
	_this setPos [14096.12, 18449.813, -9.9182129e-005];
};

_vehicle_224 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [13960.573, 18645.725, 1.0341483], [], 0, "CAN_COLLIDE"];
	_vehicle_224 = _this;
	_this setDir 118.12124;
	_this setPos [13960.573, 18645.725, 1.0341483];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_228 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [13963.443, 18650.59, 0.72092354], [], 0, "CAN_COLLIDE"];
	_vehicle_228 = _this;
	_this setDir 119.49531;
	_this setPos [13963.443, 18650.59, 0.72092354];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_231 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13964.29, 18649.693, 0.7005074], [], 0, "CAN_COLLIDE"];
	_vehicle_231 = _this;
	_this setDir 116.91491;
	_this setPos [13964.29, 18649.693, 0.7005074];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_233 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13961.49, 18644.691, 1.0946023], [], 0, "CAN_COLLIDE"];
	_vehicle_233 = _this;
	_this setDir 120.36913;
	_this setPos [13961.49, 18644.691, 1.0946023];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_241 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13962.631, 18645.754, 1.1772937], [], 0, "CAN_COLLIDE"];
	_vehicle_241 = _this;
	_this setDir 90.067482;
	_this setPos [13962.631, 18645.754, 1.1772937];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_243 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13964.929, 18650.934, 0.74467164], [], 0, "CAN_COLLIDE"];
	_vehicle_243 = _this;
	_this setDir -20.469633;
	_this setPos [13964.929, 18650.934, 0.74467164];
	_initCodes set [count _initCodes,[_this,"[24,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_248 = objNull;
if (true) then
{
	_this = createVehicle ["C_Hatchback_01_F", [14103.037, 18526.164, 0.2227947], [], 0, "CAN_COLLIDE"];
	_vehicle_248 = _this;
	_this setDir -125.4503;
	_this setPos [14103.037, 18526.164, 0.2227947];
};

_vehicle_254 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Wreck_Offroad2_F", [13851.642, 18655.09, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_254 = _this;
	_this setDir 146.17728;
	_this setPos [13851.642, 18655.09, -3.0517578e-005];
};

_vehicle_255 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Cages_F", [13864.977, 18692.713, -0.00019645691], [], 0, "CAN_COLLIDE"];
	_vehicle_255 = _this;
	_this setDir -23.912151;
	_this setPos [13864.977, 18692.713, -0.00019645691];
};

_vehicle_256 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CratesShabby_F", [13898.202, 18686.912, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_256 = _this;
	_this setDir 24.646299;
	_this setPos [13898.202, 18686.912, -1.9073486e-006];
};

_vehicle_257 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sack_F", [13897.623, 18685.719, 9.5367432e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_257 = _this;
	_this setDir -15.534001;
	_this setPos [13897.623, 18685.719, 9.5367432e-006];
};

_vehicle_258 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sacks_goods_F", [13895.869, 18685.547, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_258 = _this;
	_this setDir 33.789066;
	_this setPos [13895.869, 18685.547, 7.6293945e-006];
};

_vehicle_259 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [13931.316, 18710.771, -5.3405762e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_259 = _this;
	_this setPos [13931.316, 18710.771, -5.3405762e-005];
};

_vehicle_260 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageBags_F", [13871.153, 18693.697, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_260 = _this;
	_this setDir 13.112207;
	_this setPos [13871.153, 18693.697, 3.0517578e-005];
};

_vehicle_262 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Grave_rocks_F", [13963.467, 18609.076, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_262 = _this;
	_this setDir -55.858814;
	_this setPos [13963.467, 18609.076, 7.6293945e-006];
};

_group_1 = createGroup _center_0;

_unit_1 = objNull;
if (true) then
{
	_this = _group_1 createUnit ["C_Nikos_aged", [14041.563, 18634.021], [], 0, "CAN_COLLIDE"];
	_unit_1 = _this;
	_this setPos [14041.563, 18634.021];
	_this setDir -434.53952;
	_this setVehicleVarName "BIS_nikos";
	BIS_nikos = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_1 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"this setIdentity ""EPC_I_Nikos""; this addGoggles ""G_Aviator""; {this disableAI _x} forEach [""ANIM"", ""AUTOTARGET"", ""MOVE"", ""TARGET""]"]];
};

_this = createCenter west;
_center_2 = _this;

_group_4 = createGroup _center_2;

_unit_3 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["B_G_Soldier_F", [14036.616, 18632.012, -0.00010108948], [], 0, "CAN_COLLIDE"];
	_unit_3 = _this;
	_this setPos [14036.616, 18632.012, -0.00010108948];
	_this setDir -386.67053;
	_this setVehicleVarName "BIS_bodyGuard1";
	BIS_bodyGuard1 = _this;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim; removeAllWeapons this; removeUniform this; removeVest this; removeHeadgear this; this addVest ""V_TacVestIR_blk""; {this addMagazine ""30Rnd_9x21_Mag""} forEach [0,1,2,3,4,5]; this addWeapon ""SMG_02_ACO_F""; this addUniform ""U_BG_Guerilla2_2""; this addHeadgear ""H_Cap_blk_ION""; this addGoggles ""G_Shades_Red"";"]];
};

_unit_4 = objNull;
if (true) then
{
	_this = _group_4 createUnit ["B_G_Soldier_F", [14040.545, 18631.02, -0.00010108948], [], 0, "CAN_COLLIDE"];
	_unit_4 = _this;
	_this setPos [14040.545, 18631.02, -0.00010108948];
	_this setDir -256.91501;
	_this setVehicleVarName "BIS_bodyGuard2";
	BIS_bodyGuard2 = _this;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_4 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""WATCH2"",""ASIS""] call BIS_fnc_ambientAnim; removeAllWeapons this; removeUniform this; removeVest this; removeHeadgear this; this addVest ""V_TacVestIR_blk""; {this addMagazine ""30Rnd_65x39_caseless_mag""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_MXC_Black_F""; this addPrimaryWeaponItem ""optic_aco""; this addUniform ""U_BG_Guerilla2_3""; this addHeadgear ""H_Cap_blk_ION""; this addGoggles ""G_Squares"";"]];
};

_vehicle_266 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [14008.336, 18636.244, 0.91479164], [], 0, "CAN_COLLIDE"];
	_vehicle_266 = _this;
	_this setDir -72.671059;
	_this setPos [14008.336, 18636.244, 0.91479164];
	_initCodes set [count _initCodes,[_this,"[26.2784,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_268 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [14011.747, 18634.969, 0.69539338], [], 0, "CAN_COLLIDE"];
	_vehicle_268 = _this;
	_this setDir -69.136444;
	_this setPos [14011.747, 18634.969, 0.69539338];
	_initCodes set [count _initCodes,[_this,"[26.2784,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_270 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14010.564, 18634.063, 0.87717509], [], 0, "CAN_COLLIDE"];
	_vehicle_270 = _this;
	_this setDir 210.77699;
	_this setPos [14010.564, 18634.063, 0.87717509];
	_initCodes set [count _initCodes,[_this,"[26.2784,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_272 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14011.458, 18634.045, 0.81440073], [], 0, "CAN_COLLIDE"];
	_vehicle_272 = _this;
	_this setDir 184.63353;
	_this setPos [14011.458, 18634.045, 0.81440073];
	_initCodes set [count _initCodes,[_this,"[26.2784,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_274 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14007.541, 18635.156, 0.93680942], [], 0, "CAN_COLLIDE"];
	_vehicle_274 = _this;
	_this setDir 189.89717;
	_this setPos [14007.541, 18635.156, 0.93680942];
	_initCodes set [count _initCodes,[_this,"[26.2784,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_276 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [14021.231, 18631.322, 0.63620323], [], 0, "CAN_COLLIDE"];
	_vehicle_276 = _this;
	_this setDir 108.14132;
	_this setPos [14021.231, 18631.322, 0.63620323];
	_initCodes set [count _initCodes,[_this,"[26.5123,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_278 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_small_F", [14016.088, 18633.295, 0.72861844], [], 0, "CAN_COLLIDE"];
	_vehicle_278 = _this;
	_this setDir -70.148857;
	_this setPos [14016.088, 18633.295, 0.72861844];
	_initCodes set [count _initCodes,[_this,"[26.5123,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_280 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14020.968, 18630.59, 0.74707669], [], 0, "CAN_COLLIDE"];
	_vehicle_280 = _this;
	_this setDir 183.5696;
	_this setPos [14020.968, 18630.59, 0.74707669];
	_initCodes set [count _initCodes,[_this,"[26.5123,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_282 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14015.965, 18632.588, 0.81960404], [], 0, "CAN_COLLIDE"];
	_vehicle_282 = _this;
	_this setDir 196.07622;
	_this setPos [14015.965, 18632.588, 0.81960404];
	_initCodes set [count _initCodes,[_this,"[26.5123,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_285 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14019.98, 18629.607, 0.66628897], [], 0, "CAN_COLLIDE"];
	_vehicle_285 = _this;
	_this setDir 160.58258;
	_this setPos [14019.98, 18629.607, 0.66628897];
	_initCodes set [count _initCodes,[_this,"[26.5123,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_288 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_04_F", [14009.91, 18635.506, 1.1584228], [], 0, "CAN_COLLIDE"];
	_vehicle_288 = _this;
	_this setPos [14009.91, 18635.506, 1.1584228];
	_initCodes set [count _initCodes,[_this,"[26.2784,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_292 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [14026.71, 18649.201, 0.86718047], [], 0, "CAN_COLLIDE"];
	_vehicle_292 = _this;
	_this setDir 18.876457;
	_this setPos [14026.71, 18649.201, 0.86718047];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_294 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [14019.95, 18650.922, 1.1235386], [], 0, "CAN_COLLIDE"];
	_vehicle_294 = _this;
	_this setDir -70.855499;
	_this setPos [14019.95, 18650.922, 1.1235386];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_296 = objNull;
if (true) then
{
	_this = createVehicle ["Land_WoodenTable_large_F", [14028.471, 18655.438, 0.59138209], [], 0, "CAN_COLLIDE"];
	_vehicle_296 = _this;
	_this setDir -71.292351;
	_this setPos [14028.471, 18655.438, 0.59138209];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_298 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14026.575, 18656.154, 0.59167826], [], 0, "CAN_COLLIDE"];
	_vehicle_298 = _this;
	_this setDir -66.016609;
	_this setPos [14026.575, 18656.154, 0.59167826];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_300 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14022.108, 18653.348, 0.93916589], [], 0, "CAN_COLLIDE"];
	_vehicle_300 = _this;
	_this setDir -108.75812;
	_this setPos [14022.108, 18653.348, 0.93916589];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_302 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14020.234, 18652.09, 1.1562546], [], 0, "CAN_COLLIDE"];
	_vehicle_302 = _this;
	_this setDir -19.356985;
	_this setPos [14020.234, 18652.09, 1.1562546];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_304 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14027.823, 18654.568, 0.63043463], [], 0, "CAN_COLLIDE"];
	_vehicle_304 = _this;
	_this setDir -155.90556;
	_this setPos [14027.823, 18654.568, 0.63043463];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_306 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14026.063, 18649.51, 0.87575299], [], 0, "CAN_COLLIDE"];
	_vehicle_306 = _this;
	_this setDir -66.016609;
	_this setPos [14026.063, 18649.51, 0.87575299];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_308 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairWood_F", [14025.881, 18648.955, 0.8199029], [], 0, "CAN_COLLIDE"];
	_vehicle_308 = _this;
	_this setDir -66.016609;
	_this setPos [14025.881, 18648.955, 0.8199029];
	_initCodes set [count _initCodes,[_this,"[26.9564,""ASL""] call BIS_fnc_setHeight"]];
};

_vehicle_310 = objNull;
if (true) then
{
	_this = createVehicle ["C_SUV_01_F", [14039.752, 18664.119, 0.1922103], [], 0, "CAN_COLLIDE"];
	_vehicle_310 = _this;
	_this setDir -295.94489;
	_this setVehicleLock "LOCKED";
	_this setPos [14039.752, 18664.119, 0.1922103];
};

_vehicle_312 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Laptop_unfolded_F", [14036.696, 18635.447, 1.0909926], [], 0, "CAN_COLLIDE"];
	_vehicle_312 = _this;
	_this setDir 94.937119;
	_this setPos [14036.696, 18635.447, 1.0909926];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_AthiraTable, [0.6,0.1,0.55]]"]];
};

_group_5 = createGroup _center_0;

_unit_7 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["C_man_shorts_2_F_euro", [14114.568, 18511.902, 0.44537923], [], 0, "CAN_COLLIDE"];
	_unit_7 = _this;
	_this setPos [14114.568, 18511.902, 0.44537923];
	_this setDir -157.44116;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_group_6 = createGroup _center_2;

_unit_10 = objNull;
if (true) then
{
	_this = _group_6 createUnit ["B_Soldier_lite_F", [14055.851, 18556.418, -4.196167e-005], [], 0, "CAN_COLLIDE"];
	_unit_10 = _this;
	_this setPos [14055.851, 18556.418, -4.196167e-005];
	_this setDir -189.81845;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_6 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""WATCH1"",""ASIS""] call BIS_fnc_ambientAnim;  "]];
};

_unit_12 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["C_man_shorts_2_F_asia", [13997.489, 18569.58, 0.58860904], [], 0, "CAN_COLLIDE"];
	_unit_12 = _this;
	_this setPos [13997.489, 18569.58, 0.58860904];
	_this setDir 5.6581106;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U2"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_13 = objNull;
if (true) then
{
	_this = _group_5 createUnit ["C_man_p_shorts_1_F_asia", [13997.582, 18570.797, 0.5115732], [], 0, "CAN_COLLIDE"];
	_unit_13 = _this;
	_this setPos [13997.582, 18570.797, 0.5115732];
	_this setDir 102.9408;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_5 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_313 = objNull;
if (true) then
{
	_this = createVehicle ["Land_JunkPile_F", [14002.896, 18569.846, 9.727478e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_313 = _this;
	_this setDir -63.373077;
	_this setPos [14002.896, 18569.846, 9.727478e-005];
};

_vehicle_314 = objNull;
if (true) then
{
	_this = createVehicle ["C_Quadbike_01_F", [13988.956, 18592.836, 0.25085217], [], 0, "CAN_COLLIDE"];
	_vehicle_314 = _this;
	_this setDir 36.526455;
	_this setPos [13988.956, 18592.836, 0.25085217];
};

_vehicle_315 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CanisterFuel_F", [13989.505, 18591.746, 2.0980835e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_315 = _this;
	_this setDir 64.728279;
	_this setPos [13989.505, 18591.746, 2.0980835e-005];
};

_vehicle_316 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [13921.51, 18626.811, -6.2942505e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_316 = _this;
	_this setDir -130.44305;
	_this setPos [13921.51, 18626.811, -6.2942505e-005];
};

_vehicle_317 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_closed_F", [13917.914, 18627.381, 0.18007135], [], 0, "CAN_COLLIDE"];
	_vehicle_317 = _this;
	_this setDir -159.65372;
	_this setPos [13917.914, 18627.381, 0.18007135];
};

_vehicle_318 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Garbage_square5_F", [13919.959, 18626.098, -0.00023460388], [], 0, "CAN_COLLIDE"];
	_vehicle_318 = _this;
	_this setDir -21.4389;
	_this setPos [13919.959, 18626.098, -0.00023460388];
};

_vehicle_320 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CrabCages_F", [13876.402, 18696.057, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_320 = _this;
	_this setDir -123.67081;
	_this setPos [13876.402, 18696.057, -1.9073486e-006];
};

_group_8 = createGroup _center_0;

_unit_14 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["C_man_polo_2_F", [13903.191, 18692.004, -0.0001373291], [], 0, "CAN_COLLIDE"];
	_unit_14 = _this;
	_this setPos [13903.191, 18692.004, -0.0001373291];
	_this setDir -123.6002;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_unit_15 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["C_man_shorts_1_F_afro", [13902.001, 18691.496, -0.00010299683], [], 0, "CAN_COLLIDE"];
	_unit_15 = _this;
	_this setPos [13902.001, 18691.496, -0.00010299683];
	_this setDir 68.976624;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_unit_16 = objNull;
if (true) then
{
	_this = _group_8 createUnit ["C_man_p_beggar_F_asia", [13914.545, 18698.555, 1.0448589], [], 0, "CAN_COLLIDE"];
	_unit_16 = _this;
	_this setPos [13914.545, 18698.555, 1.0448589];
	_this setDir -59.995602;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_8 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U3"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_group_9 = createGroup _center_0;

_unit_18 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_1_F_afro", [14094.262, 18642.031, -7.6293945e-005], [], 0, "CAN_COLLIDE"];
	_unit_18 = _this;
	_this setPos [14094.262, 18642.031, -7.6293945e-005];
	_this setDir -77.709473;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_unit_20 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_3_F_afro", [13949.104, 18703.293, 0.00016021729], [], 0, "CAN_COLLIDE"];
	_unit_20 = _this;
	_this setPos [13949.104, 18703.293, 0.00016021729];
	_this setDir -177.58423;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_unit_21 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_4_F_asia", [13952.481, 18695.365, 9.9182129e-005], [], 0, "CAN_COLLIDE"];
	_unit_21 = _this;
	_this setPos [13952.481, 18695.365, 9.9182129e-005];
	_this setDir -37.176697;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_22 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_5_F_afro", [13948.902, 18702.068, -7.4386597e-005], [], 0, "CAN_COLLIDE"];
	_unit_22 = _this;
	_this setPos [13948.902, 18702.068, -7.4386597e-005];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U2""] call BIS_fnc_ambientAnim;  "]];
};

_unit_23 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_shorts_1_F_asia", [13952.736, 18696.568, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
	_unit_23 = _this;
	_this setPos [13952.736, 18696.568, -9.1552734e-005];
	_this setDir 252.24716;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U2"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_24 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_1_1_F", [13952.541, 18669.371, 4.1143546], [], 0, "CAN_COLLIDE"];
	_unit_24 = _this;
	_this setPos [13952.541, 18669.371, 4.1143546];
	_this setDir 48.161552;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_unit_25 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_p_fugitive_F_asia", [14091.602, 18643.9, 4.7683716e-005], [], 0, "CAN_COLLIDE"];
	_unit_25 = _this;
	_this setPos [14091.602, 18643.9, 4.7683716e-005];
	_this setDir 128.14169;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_322 = objNull;
if (true) then
{
	_this = createVehicle ["Land_LuggageHeap_03_F", [14092.959, 18642.711, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_322 = _this;
	_this setDir -141.47363;
	_this setPos [14092.959, 18642.711, 1.5258789e-005];
};

_unit_29 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_2_F_euro", [14007.65, 18635.482, 0.97052419], [], 0, "CAN_COLLIDE"];
	_unit_29 = _this;
	_this setPos [14007.65, 18635.482, 0.97052419];
	_this setDir -1.2407066;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_30 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_4_F", [14008.915, 18633.244, 0.96638787], [], 0, "CAN_COLLIDE"];
	_unit_30 = _this;
	_this setPos [14008.915, 18633.244, 0.96638787];
	_this setDir 90.633118;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_unit_31 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_w_worker_F", [14023.363, 18649.742, 0.96719694], [], 0, "CAN_COLLIDE"];
	_unit_31 = _this;
	_this setPos [14023.363, 18649.742, 0.96719694];
	_this setDir 97.7267;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U2""] call BIS_fnc_ambientAnim;  "]];
};

_unit_32 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_w_worker_F", [13986.598, 18664.627, 0.26916644], [], 0, "CAN_COLLIDE"];
	_unit_32 = _this;
	_this setPos [13986.598, 18664.627, 0.26916644];
	_this setDir 18.676405;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_unit_33 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_shorts_4_F", [14009.868, 18633.084, 0.83791447], [], 0, "CAN_COLLIDE"];
	_unit_33 = _this;
	_this setPos [14009.868, 18633.084, 0.83791447];
	_this setDir -91.245819;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_unit_34 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_hunter_1_F", [14024.578, 18649.957, 0.92926675], [], 0, "CAN_COLLIDE"];
	_unit_34 = _this;
	_this setPos [14024.578, 18649.957, 0.92926675];
	_this setDir -127.58971;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_324 = objNull;
if (true) then
{
	_this = createVehicle ["C_Offroad_01_F", [14227.839, 18286.441, 0.15737602], [], 0, "CAN_COLLIDE"];
	_vehicle_324 = _this;
	_this setDir 333.18256;
	_this setVehicleVarName "BIS_Offroad";
	BIS_Offroad = _this;
	_this setVehicleLock "LOCKED";
	_this setPos [14227.839, 18286.441, 0.15737602];
	_initCodes set [count _initCodes,[_this,"_policecar = [] spawn {sleep 5; BIS_Offroad setObjectTexture [0, ""\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE03_CO.paa""]; BIS_Offroad animate [""HidePolice"", 0]; BIS_Offroad animate [""HideServices"", 1]; BIS_Offroad animate [""HideBackpacks"", 1]; BIS_Offroad animate [""HideBumper1"", 0]; BIS_Offroad animate [""HideBumper2"", 0]; BIS_Offroad animate [""HideConstruction"", 0]; BIS_Offroad animate [""HideDoor3"", 1];}"]];
};

_group_11 = createGroup _center_2;

_unit_36 = objNull;
if (true) then
{
	_this = _group_11 createUnit ["B_Soldier_GL_F", [14225.374, 18284.799, -5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_unit_36 = _this;
	_this setPos [14225.374, 18284.799, -5.7220459e-006];
	_this setDir 57.600201;
	_this setUnitAbility 0.60000002;
	if (true) then {_group_11 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""STAND"",""ASIS""] call BIS_fnc_ambientAnim; "]];
};

_unit_37 = objNull;
if (true) then
{
	_this = _group_11 createUnit ["B_G_Soldier_F", [14226.834, 18285.596, -4.3869019e-005], [], 0, "CAN_COLLIDE"];
	_unit_37 = _this;
	_this setPos [14226.834, 18285.596, -4.3869019e-005];
	_this setDir 226.43709;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_11 selectLeader _this;};
	_initCodes set [count _initCodes,[_this,"[this,""LEAN"",""ASIS""] call BIS_fnc_ambientAnim; removeAllWeapons this; removeUniform this; removeVest this; removeHeadgear this; this addVest ""V_TacVest_blk_POLICE""; {this addMagazine ""30Rnd_556x45_Stanag""} forEach [0,1,2,3,4,5]; this addWeapon ""arifle_Mk20_ACO_F""; this addPrimaryWeaponItem ""optic_hamr""; this addUniform ""U_BG_Guerilla2_3""; this addHeadgear ""H_Beret_blk_POLICE"";    "]];
};

_vehicle_330 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [14115.03, 18512.904, 0.13188811], [], 0, "CAN_COLLIDE"];
	_vehicle_330 = _this;
	_this setDir 121.3756;
	_this setPos [14115.03, 18512.904, 0.13188811];
};

_vehicle_331 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [13997.071, 18569.318, 0.58791703], [], 0, "CAN_COLLIDE"];
	_vehicle_331 = _this;
	_this setDir -52.259186;
	_this setPos [13997.071, 18569.318, 0.58791703];
};

_vehicle_333 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [13996.96, 18570.957, 0.5436995], [], 0, "CAN_COLLIDE"];
	_vehicle_333 = _this;
	_this setDir 7.6779175;
	_this setPos [13996.96, 18570.957, 0.5436995];
};

_vehicle_335 = objNull;
if (true) then
{
	_this = createVehicle ["Land_TablePlastic_01_F", [13998.853, 18569.594, 0.38402566], [], 0, "CAN_COLLIDE"];
	_vehicle_335 = _this;
	_this setDir 115.79787;
	_this setPos [13998.853, 18569.594, 0.38402566];
};

_vehicle_336 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V2_F", [13914.861, 18698.203, 1.0837141], [], 0, "CAN_COLLIDE"];
	_vehicle_336 = _this;
	_this setDir 137.77013;
	_this setPos [13914.861, 18698.203, 1.0837141];
};

_vehicle_337 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [13952.589, 18694.793, 4.0054321e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_337 = _this;
	_this setDir -107.17069;
	_this setPos [13952.589, 18694.793, 4.0054321e-005];
};

_vehicle_338 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [13953.292, 18696.627, 3.8146973e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_338 = _this;
	_this setDir -188.19496;
	_this setPos [13953.292, 18696.627, 3.8146973e-005];
};

_vehicle_339 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [13952.691, 18697.834, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_339 = _this;
	_this setDir 130.13348;
	_this setPos [13952.691, 18697.834, 5.7220459e-006];
};

_unit_42 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_w_worker_F", [14020.28, 18651.762, 1.0604281], [], 0, "CAN_COLLIDE"];
	_unit_42 = _this;
	_this setPos [14020.28, 18651.762, 1.0604281];
	_this setDir 119.92361;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U3"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_46 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_2_F_euro", [14016.813, 18628.498, 3.9481163], [], 0, "CAN_COLLIDE"];
	_unit_46 = _this;
	_this setPos [14016.813, 18628.498, 3.9481163];
	_this setDir 26.330374;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_340 = objNull;
if (true) then
{
	_this = createVehicle ["Land_ChairPlastic_F", [14016.688, 18628.283, 3.9685292], [], 0, "CAN_COLLIDE"];
	_vehicle_340 = _this;
	_this setDir -69.172211;
	_this setPos [14016.688, 18628.283, 3.9685292];
};

_unit_50 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_w_worker_F", [13934.683, 18726.549, 3.4332275e-005], [], 0, "CAN_COLLIDE"];
	_unit_50 = _this;
	_this setPos [13934.683, 18726.549, 3.4332275e-005];
	_this setDir 93.163658;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U1""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_357 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_F", [14043.45, 18637.652, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_357 = _this;
	_this setDir 241.4724;
	_this setVehicleVarName "BIS_infPos";
	BIS_infPos = _this;
	_this setPos [14043.45, 18637.652, 0];
};

_vehicle_358 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_F", [14041.622, 18637.031, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_358 = _this;
	_this setDir -186.58731;
	_this setVehicleVarName "BIS_journalistPos";
	BIS_journalistPos = _this;
	_this setPos [14041.622, 18637.031, 0];
};

_vehicle_364 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_F", [14042.168, 18633.139, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_364 = _this;
	_this setDir -5.08905;
	_this setVehicleVarName "BIS_nikosPos";
	BIS_nikosPos = _this;
	_this setPos [14042.168, 18633.139, 0];
};

_vehicle_365 = objNull;
if (true) then
{
	_this = createVehicle ["C_SUV_01_F", [14202.664, 18321.818, 0.1296604], [], 0, "CAN_COLLIDE"];
	_vehicle_365 = _this;
	_this setDir -129.96867;
	_this setPos [14202.664, 18321.818, 0.1296604];
	_initCodes set [count _initCodes,[_this,"this setFuel 0.345"]];
};

_vehicle_385 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingChair_V1_F", [14043.052, 18633.482], [], 0, "CAN_COLLIDE"];
	_vehicle_385 = _this;
	_this setDir 142.963;
	_this setPos [14043.052, 18633.482];
	_initCodes set [count _initCodes,[_this,"this enableSimulation false;"]];
};

_vehicle_387 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Sunshade_01_F", [14041.139, 18633.42, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_387 = _this;
	_this setPos [14041.139, 18633.42, 0];
};

_vehicle_390 = objNull;
if (true) then
{
	_this = createVehicle ["Land_File1_F", [14026.681, 18616.936], [], 0, "CAN_COLLIDE"];
	_vehicle_390 = _this;
	_this setPos [14026.681, 18616.936];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_AthiraTable, [-0.3,0,0.415]]"]];
};

_vehicle_392 = objNull;
if (true) then
{
	_this = createVehicle ["Land_MobilePhone_smart_F", [14027.649, 18616.662], [], 0, "CAN_COLLIDE"];
	_vehicle_392 = _this;
	_this setPos [14027.649, 18616.662];
	_initCodes set [count _initCodes,[_this,"this attachTo [BIS_AthiraTable, [0.2,0.2,0.41]]"]];
};

_vehicle_393 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_box_F", [14077.811, 18588.891, 0.13497896], [], 0, "CAN_COLLIDE"];
	_vehicle_393 = _this;
	_this setDir -27.526924;
	_this setVehicleLock "LOCKED";
	_this setPos [14077.811, 18588.891, 0.13497896];
};

_vehicle_398 = objNull;
if (true) then
{
	_this = createVehicle ["Land_GarbageContainer_open_F", [14090.171, 18648.078, -0.00036048889], [], 0, "CAN_COLLIDE"];
	_vehicle_398 = _this;
	_this setDir -123.35413;
	_this setPos [14090.171, 18648.078, -0.00036048889];
};

_unit_52 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_2_F_euro", [14079.689, 18674.467, 0.11105608], [], 0, "CAN_COLLIDE"];
	_unit_52 = _this;
	_this setPos [14079.689, 18674.467, 0.11105608];
	_this setDir -130.43022;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_401 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Cyan_F", [14080.173, 18674.926, 0.59842032], [], 0, "CAN_COLLIDE"];
	_vehicle_401 = _this;
	_this setDir 230.87526;
	_this setPos [14080.173, 18674.926, 0.59842032];
};

_vehicle_402 = objNull;
if (true) then
{
	_this = createVehicle ["Land_Can_Dented_F", [14079.711, 18673.83, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
	_vehicle_402 = _this;
	_this setDir 35.19743;
	_this setPos [14079.711, 18673.83, 7.6293945e-006];
};

_vehicle_412 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_small_F", [14044.76, 18664.004, -3.2424927e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_412 = _this;
	_this setDir 67.494667;
	_this setPos [14044.76, 18664.004, -3.2424927e-005];
};

_vehicle_421 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Cyan_F", [14083.212, 18601.305, 0.60734403], [], 0, "CAN_COLLIDE"];
	_vehicle_421 = _this;
	_this setDir 294.0863;
	_this setPos [14083.212, 18601.305, 0.60734403];
};

_unit_61 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_shorts_2_F_asia", [14082.454, 18601.588, 0.022659261], [], 0, "CAN_COLLIDE"];
	_unit_61 = _this;
	_this setPos [14082.454, 18601.588, 0.022659261];
	_this setDir -49.976978;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_62 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_hunter_1_F", [14081.724, 18602.102], [], 0, "CAN_COLLIDE"];
	_unit_62 = _this;
	_this setPos [14081.724, 18602.102];
	_this setDir 113.63567;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U2""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_427 = objNull;
if (true) then
{
	_this = createVehicle ["C_Van_01_box_F", [14069.897, 18679.525, 0.20047566], [], 0, "CAN_COLLIDE"];
	_vehicle_427 = _this;
	_this setDir -45.400795;
	_this setVehicleLock "LOCKED";
	_this setPos [14069.897, 18679.525, 0.20047566];
};

_unit_64 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_5_F_euro", [14069.242, 18678.404, 9.5367432e-006], [], 0, "CAN_COLLIDE"];
	_unit_64 = _this;
	_this setPos [14069.242, 18678.404, 9.5367432e-006];
	_this setDir 35.021168;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""REPAIR_VEH_PRONE""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_429 = objNull;
if (true) then
{
	_this = createVehicle ["RoadBarrier_small_F", [14043.759, 18666.09, -8.7738037e-005], [], 0, "CAN_COLLIDE"];
	_vehicle_429 = _this;
	_this setDir 67.505356;
	_this setPos [14043.759, 18666.09, -8.7738037e-005];
};

_unit_69 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_2_F_euro", [14055.66, 18646.344, 0.030419052], [], 0, "CAN_COLLIDE"];
	_unit_69 = _this;
	_this setPos [14055.66, 18646.344, 0.030419052];
	_this setDir 10.292644;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_433 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Cyan_F", [14055.587, 18645.66, 0.48788497], [], 0, "CAN_COLLIDE"];
	_vehicle_433 = _this;
	_this setDir 371.59799;
	_this setPos [14055.587, 18645.66, 0.48788497];
};

_vehicle_438 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Cyan_F", [14045.884, 18648.674, 0.5534904], [], 0, "CAN_COLLIDE"];
	_vehicle_438 = _this;
	_this setDir 369.26694;
	_this setPos [14045.884, 18648.674, 0.5534904];
};

_unit_75 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_3_F_euro", [14046.126, 18649.137, -0.0002117157], [], 0, "CAN_COLLIDE"];
	_unit_75 = _this;
	_this setPos [14046.126, 18649.137, -0.0002117157];
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""SIT_U1"",""LIGHT""] call BIS_fnc_ambientAnim;  "]];
};

_unit_77 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_w_worker_F", [14055.313, 18647.357, -0.00023269653], [], 0, "CAN_COLLIDE"];
	_unit_77 = _this;
	_this setPos [14055.313, 18647.357, -0.00023269653];
	_this setDir 137.27747;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U2""] call BIS_fnc_ambientAnim;  "]];
};

_unit_81 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_polo_5_F", [14056.474, 18647.156, -0.0084565515], [], 0, "CAN_COLLIDE"];
	_unit_81 = _this;
	_this setPos [14056.474, 18647.156, -0.0084565515];
	_this setDir 209.63458;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U3""] call BIS_fnc_ambientAnim;  "]];
};

_unit_82 = objNull;
if (true) then
{
	_this = _group_9 createUnit ["C_man_p_fugitive_F", [14046.743, 18649.939, -0.00011253357], [], 0, "CAN_COLLIDE"];
	_unit_82 = _this;
	_this setPos [14046.743, 18649.939, -0.00011253357];
	_this setDir 176.53352;
	_this setUnitAbility 0.60000002;
	if (false) then {_group_9 selectLeader _this;};
	_initCodes set [count _initCodes,[_this," [this,""STAND_U2""] call BIS_fnc_ambientAnim;  "]];
};

_vehicle_440 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Pointer_Cyan_F", [14069.943, 18678.873, -0.00016593933], [], 0, "CAN_COLLIDE"];
	_vehicle_440 = _this;
	_this setDir 44.968613;
	_this setPos [14069.943, 18678.873, -0.00016593933];
};

_vehicle_441 = objNull;
if (true) then
{
	_this = createVehicle ["Land_CampingTable_F", [14042.52, 18634.844, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_441 = _this;
	_this setDir -184.918;
	_this setVehicleVarName "BIS_AthiraTable";
	BIS_AthiraTable = _this;
	_this setPos [14042.52, 18634.844, 0];
	_initCodes set [count _initCodes,[_this,"this enableSimulation false; [this, -0.05] call BIS_fnc_setHeight;"]];
};

_vehicle_443 = objNull;
if (true) then
{
	_this = createVehicle ["Sign_Arrow_Direction_F", [14029.763, 18629.984, 0], [], 0, "CAN_COLLIDE"];
	_vehicle_443 = _this;
	_this setDir -14.729;
	_this setVehicleVarName "BIS_cutsceneCarPos";
	BIS_cutsceneCarPos = _this;
	_this setPos [14029.763, 18629.984, 0];
};

{
	this = _x select 0;
	[] call compile (_x select 1);
} foreach _initCodes;
