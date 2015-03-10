private ["_unit"];
_unit = BIS_Recon04;

if (alive _unit) then {
	private ["_movementData"];
	_movementData = [[0,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.0499997,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.0499997,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.0899997,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.0899997,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.121,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.143,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.165,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.187,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.209,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.23,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.252,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.274,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.295,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0,0,-0]],[0.316,[11209.2,8761.68,182.82],[0.549347,0.835595,0],[0,0,1],[0.0100365,-0.00140344,-0.000199816]],[0.337,[11209.2,8761.68,182.82],[0.548994,0.835826,0],[0,0,1],[0.0223059,-0.00311911,-0.000444087]],[0.358,[11209.2,8761.68,182.819],[0.548049,0.836446,0],[0,0,1],[0.0447942,-0.00624448,-0.000891893]],[0.379,[11209.2,8761.68,182.819],[0.545196,0.838308,0],[0,0,1],[0,0,-0]],[0.4,[11209.2,8761.66,182.819],[0.507072,0.861904,0],[0,0,1],[0.0882213,-0.0118906,-0.00175836]],[0.421,[11209.2,8761.64,182.819],[0.455567,0.890202,0],[0,0,1],[0.0886656,-0.00792421,-0.0017849]],[0.442,[11209.3,8761.61,182.818],[0.374054,0.927407,0],[0,0,1],[0.088978,-0.00270217,-0.00181425]],[0.463,[11209.4,8761.57,182.817],[0.237097,0.971486,0],[0,0,1],[0.0888627,0.00527333,-0.00184692]],[0.484,[11209.5,8761.53,182.816],[0.0468693,0.998901,0],[0,0,1],[0.0871862,0.0179708,0.000459688]],[0.505,[11209.5,8761.52,182.816],[-0.133449,0.991056,0],[0,0,1],[0.0821381,0.0343179,0.000761459]],[0.526,[11209.6,8761.52,182.816],[-0.285572,0.958357,0],[0,0,1],[0.0746315,0.0485234,0.00101939]],[0.547,[11209.7,8761.53,182.816],[-0.40307,0.915169,0],[0,0,1],[0.0662008,0.0595133,0.00121532]],[0.568,[11209.8,8761.54,182.816],[-0.522771,0.852473,0],[0,0,1],[0.0582466,0.067318,0.00135174]],[0.589,[11209.8,8761.57,182.817],[-0.624069,0.781369,0],[0,0,1],[0.0486392,0.0745561,0.00147519]],[0.61,[11209.9,8761.59,182.817],[-0.692584,0.721337,0],[0,0,1],[0.0350825,0.0718254,0.00140491]],[0.636,[11209.9,8761.64,182.818],[-0.786859,0.617133,0],[0,0,1],[0.0219129,0.0575739,0.00111759]],[0.666,[11210,8761.69,182.819],[-0.850676,0.52569,0],[0,0,1],[-0.478146,0.394492,0.00679077]],[0.696,[11210,8761.75,182.82],[-0.894783,0.446501,0],[0,0,1],[-1.04323,0.644682,0.0107363]],[0.722,[11210,8761.82,182.821],[-0.94135,0.337433,0],[0,0,1],[-1.45135,0.723546,0.0116627]],[0.745,[11210,8761.88,182.822],[-0.973306,0.229512,0],[0,0,1],[-1.5594,0.558333,0.00839335]],[0.767,[11210,8761.95,182.823],[-0.994058,0.108852,0],[0,0,1],[-1.6343,0.384763,0.00501193]],[0.787,[11209.9,8762.02,182.824],[-0.99996,-0.008984,0],[0,0,1],[-1.68422,0.183828,0.00114816]],[0.807,[11209.9,8762.08,182.825],[-0.991761,-0.128106,0],[0,0,1],[-1.70605,-0.0159203,-0.00265446]],[0.827,[11209.9,8762.13,182.826],[-0.971817,-0.235738,0],[0,0,1],[-1.70147,-0.220374,-0.0065095]],[0.847,[11209.9,8762.18,182.826],[-0.942151,-0.33519,0],[0,0,1],[-1.52255,-0.369882,-0.00908629]],[0.867,[11209.8,8762.23,182.827],[-0.89715,-0.441726,0],[0,0,1],[-1.8529,-0.659699,-0.0150156]],[0.887,[11209.8,8762.26,182.827],[-0.850301,-0.526297,0],[0,0,1],[-2.10741,-1.03797,-0.0225109]],[0.907,[11209.7,8762.27,182.827],[-0.803253,-0.595638,0],[0,0,1],[-2.33507,-1.44547,-0.0305212]],[0.927,[11209.6,8762.28,182.827],[-0.755276,-0.655407,0],[0,0,1],[-1.88464,-1.39752,-0.0289941]],[0.947,[11209.6,8762.28,182.827],[-0.698805,-0.715312,0],[0,0,1],[-1.96804,-1.70781,-0.0349693]],[0.967,[11209.5,8762.26,182.827],[-0.679947,-0.733262,0],[0,0,1],[-1.75411,-1.79555,-0.0363312]],[0.987,[11209.5,8762.22,182.826],[-0.679947,-0.733262,0],[0,0,1],[-1.65166,-1.78117,-0.0359183]],[1.007,[11209.5,8762.19,182.825],[-0.679947,-0.733262,0],[0,0,1],[-1.57237,-1.69566,-0.034194]],[1.027,[11209.4,8762.16,182.825],[-0.679947,-0.733262,0],[0,0,1],[-1.50034,-1.61799,-0.0326276]],[1.047,[11209.4,8762.13,182.824],[-0.679947,-0.733262,0],[0,0,1],[-1.4325,-1.54482,-0.0311523]],[1.067,[11209.4,8762.1,182.823],[-0.679947,-0.733262,0],[0,0,1],[-1.3715,-1.47904,-0.0298257]],[1.087,[11209.4,8762.07,182.823],[-0.679947,-0.733262,0],[0,0,1],[-1.31459,-1.41767,-0.028588]],[1.107,[11209.3,8762.04,182.822],[-0.679947,-0.733262,0],[0,0,1],[-1.2883,-1.38931,-0.0280163]],[1.127,[11209.3,8762.01,182.822],[-0.679947,-0.733262,0],[0,0,1],[-1.46397,-1.57876,-0.0318367]],[1.147,[11209.3,8761.97,182.821],[-0.679947,-0.733262,0],[0,0,1],[-1.73142,-1.86718,-0.0376528]],[1.167,[11209.2,8761.93,182.821],[-0.679947,-0.733262,0],[0,0,1],[-2.00793,-2.16537,0.0507219]],[1.187,[11209.2,8761.88,182.822],[-0.679947,-0.733262,0],[0,0,1],[-2.28444,-2.46357,0.0577068]],[1.207,[11209.1,8761.82,182.824],[-0.679947,-0.733262,0],[0,0,1],[-2.56095,-2.76176,0.0646917]],[1.227,[11209.1,8761.76,182.825],[-0.679947,-0.733262,0],[0,0,1],[-2.83425,-3.05649,0.0715954]],[1.247,[11209,8761.7,182.826],[-0.679947,-0.733262,0],[0,0,1],[-2.83425,-3.05649,0.0715954]],[1.267,[11208.9,8761.63,182.828],[-0.679947,-0.733262,0],[0,0,1],[-2.83425,-3.05649,0.0715954]],[1.287,[11208.9,8761.57,182.829],[-0.679947,-0.733262,0],[0,0,1],[-2.83425,-3.05649,0.0715954]],[1.307,[11208.8,8761.51,182.831],[-0.679947,-0.733262,0],[0,0,1],[-2.83425,-3.05649,0.0715954]],[1.327,[11208.8,8761.45,182.832],[-0.679947,-0.733262,0],[0,0,1],[-2.83425,-3.05649,0.0715954]],[1.347,[11208.7,8761.39,182.834],[-0.677397,-0.735618,0],[0,0,1],[-2.83425,-3.05649,0.0715954]],[1.367,[11208.6,8761.36,182.835],[-0.624733,-0.780838,0],[0,0,1],[-2.82362,-3.06631,0.0236936]],[1.387,[11208.6,8761.32,182.836],[-0.576548,-0.817063,0],[0,0,1],[-2.6041,-3.2548,0.0224488]],[1.408,[11208.5,8761.26,182.836],[-0.55187,-0.83393,0],[0,0,1],[-2.40325,-3.4058,0.0212798]],[1.429,[11208.5,8761.2,182.837],[-0.524276,-0.851548,0],[0,0,1],[-2.30038,-3.47611,0.0206712]],[1.449,[11208.4,8761.14,182.837],[-0.500283,-0.865862,0],[0,0,1],[-2.18536,-3.54954,0.0199836]],[1.469,[11208.3,8761.07,182.837],[-0.475898,-0.879501,0],[0,0,1],[-2.08535,-3.60921,0.0193798]],[1.489,[11208.3,8761.01,182.838],[-0.452454,-0.891788,0],[0,0,1],[-1.98371,-3.66606,0.0187608]],[1.51,[11208.2,8760.94,182.838],[-0.422542,-0.906344,0],[0,0,1],[-1.88598,-3.71728,0.0181609]],[1.531,[11208.2,8760.87,182.839],[-0.391337,-0.920247,0],[0,0,1],[-1.7613,-3.77795,0.017389]],[1.552,[11208.1,8760.8,182.839],[-0.36139,-0.932415,0],[0,0,1],[-1.63123,-3.83591,0.0165763]],[1.573,[11208.1,8760.72,182.84],[-0.346272,-0.938134,0],[0,0,1],[-1.5064,-3.88663,0.0157894]],[1.595,[11208.1,8760.64,182.84],[-0.340921,-0.940092,0],[0,0,1],[-1.44338,-3.91046,0.0153897]],[1.616,[11208,8760.56,182.84],[-0.335604,-0.942004,0],[0,0,1],[-1.42108,-3.91863,0.0152479]],[1.636,[11208,8760.48,182.84],[-0.330841,-0.943687,0],[0,0,1],[-1.39891,-3.92659,-0.0103066]],[1.656,[11208,8760.41,182.84],[-0.327281,-0.944927,0],[0,0,1],[-1.37906,-3.93361,-0.0103956]],[1.676,[11207.9,8760.33,182.84],[-0.323887,-0.946096,0],[0,0,1],[-1.36422,-3.93878,-0.0104619]],[1.696,[11207.9,8760.25,182.84],[-0.319879,-0.947459,0],[0,0,1],[-1.35007,-3.94365,-0.0105249]],[1.716,[11207.9,8760.17,182.839],[-0.315659,-0.948873,0],[0,0,1],[-1.33336,-3.94933,-0.0105989]],[1.736,[11207.9,8760.1,182.839],[-0.311019,-0.950404,0],[0,0,1],[-1.31577,-3.95523,-0.0106766]],[1.756,[11207.8,8760.02,182.839],[-0.298827,-0.954307,0],[0,0,1],[-1.29643,-3.96161,-0.0107617]],[1.776,[11207.8,8759.95,182.839],[-0.28915,-0.957284,0],[0,0,1],[-1.24562,-3.97788,-0.0109832]],[1.796,[11207.8,8759.87,182.839],[-0.284924,-0.95855,0],[0,0,1],[-1.20528,-3.99029,-0.0111572]],[1.817,[11207.7,8759.78,182.838],[-0.282128,-0.959377,0],[0,0,1],[-1.18766,-3.99557,-0.0112327]],[1.837,[11207.7,8759.7,182.838],[-0.280277,-0.959919,0],[0,0,1],[-1.176,-3.99901,-0.0112824]],[1.857,[11207.7,8759.62,182.838],[-0.278562,-0.960418,0],[0,0,1],[-1.16829,-4.00127,-0.0113153]],[1.877,[11207.7,8759.54,182.838],[-0.276912,-0.960896,0],[0,0,1],[-1.16114,-4.00335,-0.0113456]],[1.897,[11207.6,8759.46,182.838],[-0.275073,-0.961423,0],[0,0,1],[-1.15426,-4.00534,-0.0113748]],[1.918,[11207.6,8759.38,182.837],[-0.273454,-0.961885,0],[0,0,1],[-1.1466,-4.00754,-0.0114073]],[1.938,[11207.6,8759.3,182.837],[-0.271707,-0.96238,0],[0,0,1],[-1.13985,-4.00947,-0.0114359]],[1.958,[11207.6,8759.22,182.837],[-0.269374,-0.963036,0],[0,0,1],[-1.13257,-4.01153,-0.0114666]],[1.978,[11207.6,8759.14,182.837],[-0.266849,-0.963738,0],[0,0,1],[-1.12284,-4.01426,-0.0115076]],[1.998,[11207.5,8759.06,182.836],[-0.264323,-0.964434,0],[0,0,1],[-1.11232,-4.01719,0.0100742]],[2.018,[11207.5,8758.98,182.837],[-0.261358,-0.965242,0],[0,0,1],[-1.10179,-4.02009,0.0100851]],[2.038,[11207.5,8758.9,182.837],[-0.257744,-0.966213,0],[0,0,1],[-1.08943,-4.02346,0.0100977]],[2.058,[11207.5,8758.82,182.837],[-0.253359,-0.967372,0],[0,0,1],[-1.07437,-4.02751,0.010113]],[2.079,[11207.4,8758.74,182.837],[-0.246468,-0.969151,0],[0,0,1],[-1.05609,-4.03234,0.0101314]],[2.1,[11207.4,8758.65,182.837],[-0.241636,-0.970367,0],[0,0,1],[-1.02736,-4.03975,0.0101597]],[2.121,[11207.4,8758.57,182.838],[-0.237951,-0.971277,0],[0,0,1],[-1.00722,-4.04482,0.0101793]],[2.142,[11207.4,8758.49,182.838],[-0.235185,-0.971951,0],[0,0,1],[-0.991863,-4.04862,0.010194]],[2.163,[11207.3,8758.4,182.838],[-0.232935,-0.972492,0],[0,0,1],[-0.980333,-4.05142,0.010205]],[2.184,[11207.3,8758.32,182.838],[-0.23106,-0.97294,0],[0,0,1],[-0.970955,-4.05368,0.0102138]],[2.205,[11207.3,8758.23,182.838],[-0.229451,-0.97332,0],[0,0,1],[-0.963135,-4.05555,0.0102211]],[2.226,[11207.3,8758.15,182.839],[-0.227867,-0.973692,0],[0,0,1],[-0.956431,-4.05713,0.0102274]],[2.247,[11207.3,8758.06,182.839],[-0.226459,-0.974021,0],[0,0,1],[-0.949828,-4.05868,0.0102335]],[2.268,[11207.2,8757.98,182.839],[-0.22517,-0.97432,0],[0,0,1],[-0.943957,-4.06005,0.0102389]],[2.291,[11207.2,8757.88,182.839],[-0.224406,-0.974496,0],[0,0,1],[-0.938587,-4.0613,0.0102438]],[2.314,[11207.2,8757.79,182.84],[-0.223791,-0.974637,0],[0,0,1],[-0.935401,-4.06203,0.0102468]],[2.337,[11207.2,8757.69,182.84],[-0.223341,-0.974741,0],[0,0,1],[-0.932838,-4.06262,0.0102491]],[2.358,[11207.2,8757.61,182.84],[-0.222923,-0.974836,0],[0,0,1],[-0.930962,-4.06305,-0.0168515]],[2.379,[11207.1,8757.52,182.84],[-0.222375,-0.974961,0],[0,0,1],[-0.929221,-4.06345,-0.0168428]],[2.4,[11207.1,8757.44,182.839],[-0.221679,-0.97512,0],[0,0,1],[-0.926935,-4.06397,-0.0168314]],[2.421,[11207.1,8757.35,182.839],[-0.220982,-0.975278,0],[0,0,1],[-0.924033,-4.06463,-0.0168169]],[2.442,[11207.1,8757.26,182.839],[-0.220425,-0.975404,0],[0,0,1],[-0.92113,-4.06529,-0.0168024]],[2.463,[11207.1,8757.18,182.838],[-0.219739,-0.975559,0],[0,0,1],[-0.918807,-4.06582,-0.0167908]],[2.484,[11207,8757.09,182.838],[-0.218916,-0.975744,0],[0,0,1],[-0.915949,-4.06646,-0.0167764]],[2.505,[11207,8757.01,182.837],[-0.218235,-0.975896,0],[0,0,1],[-0.912518,-4.06723,-0.0167593]],[2.526,[11207,8756.92,182.837],[-0.217684,-0.976019,0],[0,0,1],[-0.909678,-4.06787,-0.016745]],[2.547,[11207,8756.84,182.837],[-0.217129,-0.976143,0],[0,0,1],[-0.907383,-4.06838,-0.0167335]],[2.568,[11207,8756.75,182.836],[-0.216423,-0.9763,0],[0,0,1],[-0.905067,-4.0689,-0.0167219]],[2.589,[11206.9,8756.67,182.836],[-0.215867,-0.976423,0],[0,0,1],[-0.902125,-4.06955,-0.0167071]],[2.61,[11206.9,8756.59,182.836],[-0.215172,-0.976576,0],[0,0,1],[-0.899808,-4.07006,-0.0166955]],[2.63,[11206.9,8756.5,182.835],[-0.21421,-0.976788,0],[0,0,1],[-0.896911,-4.0707,-0.016681]],[2.651,[11206.9,8756.42,182.835],[-0.213232,-0.977002,0],[0,0,1],[-0.892902,-4.07158,-0.0166608]],[2.672,[11206.9,8756.34,182.835],[-0.212394,-0.977184,0],[0,0,1],[-0.888825,-4.07248,-0.0166403]],[2.693,[11206.9,8756.25,182.834],[-0.211695,-0.977336,0],[0,0,1],[-0.88533,-4.07324,-0.0166227]],[2.714,[11206.8,8756.17,182.834],[-0.210985,-0.977489,0],[0,0,1],[-0.882418,-4.07387,-0.0166081]],[2.735,[11206.8,8756.08,182.834],[-0.210133,-0.977673,0],[0,0,1],[-0.879458,-4.07451,-0.0165932]],[2.756,[11206.8,8755.99,182.833],[-0.20928,-0.977856,0],[0,0,1],[-0.875905,-4.07527,-0.0165753]],[2.777,[11206.8,8755.91,182.833],[-0.20857,-0.978008,0],[0,0,1],[-0.872352,-4.07604,-0.0165574]],[2.798,[11206.8,8755.82,182.833],[-0.207859,-0.978159,0],[0,0,1],[-0.86939,-4.07667,-0.0165425]],[2.819,[11206.7,8755.74,182.832],[-0.207426,-0.978251,0],[0,0,1],[-0.866428,-4.0773,-0.0165275]],[2.84,[11206.7,8755.65,182.832],[-0.207284,-0.978281,0],[0,0,1],[-0.864622,-4.07768,-0.0165184]],[2.861,[11206.7,8755.56,182.832],[-0.207143,-0.978311,0],[0,0,1],[-0.864033,-4.07781,-0.0165154]],[2.882,[11206.7,8755.48,182.831],[-0.207002,-0.978341,0],[0,0,1],[-0.863443,-4.07793,-0.0165125]],[2.903,[11206.7,8755.39,182.831],[-0.206863,-0.97837,0],[0,0,1],[-0.862854,-4.07806,-0.0175399]],[2.924,[11206.6,8755.31,182.83],[-0.206723,-0.9784,0],[0,0,1],[-0.862274,-4.07818,-0.0175371]],[2.945,[11206.6,8755.23,182.83],[-0.206723,-0.9784,0],[0,0,1],[-0.861694,-4.0783,-0.0175343]],[2.966,[11206.6,8755.14,182.83],[-0.206723,-0.9784,0],[0,0,1],[-0.861694,-4.0783,-0.0175343]],[2.987,[11206.6,8755.05,182.827],[-0.206723,-0.9784,0],[0,0,1],[-0.861694,-4.0783,-0.223135]],[3.008,[11206.6,8754.97,182.822],[-0.206723,-0.9784,0],[0,0,1],[-0.861694,-4.0783,-0.223135]],[3.029,[11206.6,8754.88,182.818],[-0.206723,-0.9784,0],[0,0,1],[-0.861694,-4.0783,-0.223135]],[3.05,[11206.5,8754.8,182.813],[-0.206723,-0.9784,0],[0,0,1],[-0.861694,-4.0783,-0.223135]],[3.071,[11206.5,8754.71,182.809],[-0.206723,-0.9784,0],[0,0,1],[-0.861694,-4.0783,-0.223135]],[3.092,[11206.5,8754.63,182.804],[-0.206723,-0.9784,0],[0,0,1],[-0.861694,-4.0783,-0.223135]],[3.113,[11206.5,8754.54,182.799],[-0.206723,-0.9784,0],[0,0,1],[-0.861694,-4.0783,-0.223135]],[3.134,[11206.5,8754.45,182.794],[-0.206723,-0.9784,0],[0,0,1],[-0.861694,-4.0783,-0.223135]],[3.155,[11206.4,8754.37,182.79],[-0.206723,-0.9784,0],[0,0,1],[-0.861694,-4.0783,-0.223135]],[3.176,[11206.4,8754.28,182.785],[-0.206723,-0.9784,0],[0,0,1],[-0.861694,-4.0783,-0.223135]],[3.197,[11206.4,8754.2,182.78],[-0.206723,-0.9784,0],[0,0,1],[-0.861694,-4.0783,-0.223135]],[3.218,[11206.4,8754.11,182.776],[-0.206865,-0.97837,0],[0,0,1],[-0.861694,-4.0783,-0.237096]],[3.238,[11206.4,8754.03,182.771],[-0.20714,-0.978311,0],[0,0,1],[-0.862284,-4.07818,-0.237115]],[3.259,[11206.4,8753.95,182.766],[-0.20756,-0.978222,0],[0,0,1],[-0.863432,-4.07794,-0.237152]],[3.28,[11206.3,8753.86,182.761],[-0.20798,-0.978133,0],[0,0,1],[-0.865182,-4.07757,-0.237209]],[3.301,[11206.3,8753.78,182.756],[-0.2084,-0.978044,0],[0,0,1],[-0.866932,-4.07719,-0.237266]],[3.322,[11206.3,8753.7,182.751],[-0.20882,-0.977954,0],[0,0,1],[-0.868682,-4.07682,-0.237322]],[3.343,[11206.3,8753.61,182.746],[-0.209239,-0.977864,0],[0,0,1],[-0.870432,-4.07645,-0.237379]],[3.363,[11206.3,8753.53,182.742],[-0.209654,-0.977776,0],[0,0,1],[-0.872181,-4.07607,-0.237435]],[3.383,[11206.3,8753.45,182.737],[-0.210071,-0.977686,0],[0,0,1],[-0.873911,-4.0757,-0.237491]],[3.403,[11206.2,8753.36,182.73],[-0.21049,-0.977596,0],[0,0,1],[-0.875648,-4.07533,-0.713289]],[3.424,[11206.2,8753.28,182.715],[-0.210774,-0.977535,0],[0,0,1],[-0.877394,-4.07495,-0.713412]],[3.444,[11206.2,8753.2,182.698],[-0.210913,-0.977505,0],[0,0,1],[-0.878577,-4.0747,-1.00301]],[3.465,[11206.2,8753.11,182.677],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.00304]],[3.486,[11206.2,8753.02,182.656],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.00304]],[3.508,[11206.1,8752.93,182.634],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.00304]],[3.529,[11206.1,8752.85,182.613],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.00304]],[3.55,[11206.1,8752.76,182.591],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.00304]],[3.57,[11206.1,8752.68,182.571],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.00304]],[3.591,[11206.1,8752.59,182.55],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.00304]],[3.612,[11206.1,8752.51,182.499],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-2.69563]],[3.633,[11206,8752.42,182.442],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-2.69563]],[3.654,[11206,8752.34,182.387],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-2.69563]],[3.675,[11206,8752.26,182.331],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-2.69563]],[3.696,[11206,8752.17,182.275],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-2.69563]],[3.717,[11206,8752.09,182.219],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-2.69563]],[3.738,[11205.9,8752,182.161],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[3.759,[11205.9,8751.91,182.123],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[3.78,[11205.9,8751.83,182.085],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[3.801,[11205.9,8751.74,182.048],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[3.822,[11205.9,8751.66,182.01],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[3.843,[11205.8,8751.57,181.972],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[3.863,[11205.8,8751.49,181.936],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[3.884,[11205.8,8751.41,181.898],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[3.905,[11205.8,8751.32,181.86],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[3.926,[11205.8,8751.23,181.822],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[3.947,[11205.8,8751.15,181.785],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[3.968,[11205.7,8751.06,181.747],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[3.989,[11205.7,8750.98,181.708],[-0.210913,-0.977505,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[4.01,[11205.7,8750.89,181.67],[-0.210769,-0.977536,0],[0,0,1],[-0.87916,-4.07457,-1.80549]],[4.031,[11205.7,8750.81,181.632],[-0.21063,-0.977566,0],[0,0,1],[-0.878558,-4.0747,-1.80538]],[4.052,[11205.7,8750.72,181.595],[-0.21049,-0.977596,0],[0,0,1],[-0.877976,-4.07483,-1.80528]],[4.073,[11205.6,8750.64,181.558],[-0.210351,-0.977626,0],[0,0,1],[-0.877394,-4.07495,-1.80517]],[4.094,[11205.6,8750.55,181.52],[-0.210212,-0.977656,0],[0,0,1],[-0.876814,-4.07508,-1.80507]],[4.114,[11205.6,8750.47,181.484],[-0.210074,-0.977685,0],[0,0,1],[-0.876235,-4.0752,-1.80497]],[4.135,[11205.6,8750.39,181.446],[-0.209935,-0.977715,0],[0,0,1],[-0.875662,-4.07533,-1.80487]],[4.156,[11205.6,8750.3,181.408],[-0.209793,-0.977746,0],[0,0,1],[-0.875079,-4.07545,-1.80477]],[4.177,[11205.6,8750.22,181.371],[-0.209651,-0.977776,0],[0,0,1],[-0.874487,-4.07558,-1.69515]],[4.197,[11205.5,8750.13,181.337],[-0.209513,-0.977806,0],[0,0,1],[-0.873896,-4.07571,-1.69506]],[4.217,[11205.5,8750.05,181.302],[-0.209513,-0.977806,0],[0,0,1],[-0.87332,-4.07583,-1.69497]],[4.237,[11205.5,8749.97,181.268],[-0.209513,-0.977806,0],[0,0,1],[-0.87332,-4.07583,-1.69497]],[4.257,[11205.5,8749.88,181.233],[-0.209513,-0.977806,0],[0,0,1],[-0.87332,-4.07583,-1.69497]],[4.277,[11205.5,8749.8,181.197],[-0.209513,-0.977806,0],[0,0,1],[-0.87332,-4.07583,-2.08619]],[4.297,[11205.4,8749.72,181.155],[-0.209513,-0.977806,0],[0,0,1],[-0.87332,-4.07583,-2.08619]],[4.318,[11205.4,8749.63,181.111],[-0.209513,-0.977806,0],[0,0,1],[-0.87332,-4.07583,-2.08619]],[4.338,[11205.4,8749.55,181.069],[-0.209513,-0.977806,0],[0,0,1],[-0.87332,-4.07583,-2.08619]],[4.358,[11205.4,8749.47,181.028],[-0.20937,-0.977836,0],[0,0,1],[-0.87332,-4.07583,-1.66406]],[4.378,[11205.4,8749.38,180.994],[-0.209227,-0.977867,0],[0,0,1],[-0.872727,-4.07596,-1.66395]],[4.399,[11205.4,8749.3,180.96],[-0.208938,-0.977929,0],[0,0,1],[-0.872131,-4.07608,-1.66383]],[4.42,[11205.3,8749.22,180.926],[-0.20865,-0.97799,0],[0,0,1],[-0.870925,-4.07634,-1.6636]],[4.441,[11205.3,8749.13,180.892],[-0.208364,-0.978051,0],[0,0,1],[-0.869725,-4.0766,-1.66336]],[4.461,[11205.3,8749.05,180.858],[-0.208086,-0.97811,0],[0,0,1],[-0.86853,-4.07685,-1.66313]],[4.481,[11205.3,8748.97,180.824],[-0.207663,-0.9782,0],[0,0,1],[-0.867375,-4.0771,-1.6629]],[4.501,[11205.3,8748.89,180.791],[-0.207109,-0.978318,0],[0,0,1],[-0.865612,-4.07747,-1.66256]],[4.521,[11205.3,8748.8,180.757],[-0.206542,-0.978438,0],[0,0,1],[-0.863299,-4.07796,-1.6621]],[4.541,[11205.2,8748.72,180.724],[-0.205984,-0.978555,0],[0,0,1],[-0.860936,-4.07846,-1.66164]],[4.561,[11205.2,8748.64,180.69],[-0.205559,-0.978645,0],[0,0,1],[-0.858612,-4.07895,-1.66118]],[4.581,[11205.2,8748.56,180.656],[-0.204992,-0.978764,0],[0,0,1],[-0.856839,-4.07933,-1.66084]],[4.601,[11205.2,8748.47,180.622],[-0.204422,-0.978883,0],[0,0,1],[-0.854476,-4.07982,-1.66037]],[4.621,[11205.2,8748.39,180.589],[-0.203717,-0.97903,0],[0,0,1],[-0.8521,-4.08032,-1.6599]],[4.641,[11205.1,8748.31,180.556],[-0.203009,-0.979177,0],[0,0,1],[-0.849164,-4.08093,-1.65932]],[4.661,[11205.1,8748.23,180.523],[-0.202301,-0.979323,0],[0,0,1],[-0.846213,-4.08154,-1.65874]],[4.681,[11205.1,8748.14,180.489],[-0.201735,-0.97944,0],[0,0,1],[-0.843261,-4.08215,-1.65816]],[4.701,[11205.1,8748.06,180.456],[-0.20131,-0.979527,0],[0,0,1],[-0.8409,-4.08264,-1.65769]],[4.721,[11205.1,8747.98,180.423],[-0.200885,-0.979615,0],[0,0,1],[-0.839129,-4.083,-1.65734]],[4.741,[11205.1,8747.9,180.39],[-0.200467,-0.9797,0],[0,0,1],[-0.837357,-4.08337,-1.65699]],[4.761,[11205,8747.82,180.358],[-0.200049,-0.979786,0],[0,0,1],[-0.835615,-4.08372,-1.65664]],[4.781,[11205,8747.74,180.326],[-0.199771,-0.979842,0],[0,0,1],[-0.833873,-4.08408,-1.6563]],[4.801,[11205,8747.66,180.291],[-0.199483,-0.979901,0],[0,0,1],[-0.832712,-4.08432,-1.65606]],[4.821,[11205,8747.58,180.259],[-0.199199,-0.979959,0],[0,0,1],[-0.831511,-4.08456,-1.65583]],[4.841,[11205,8747.5,180.226],[-0.198642,-0.980072,0],[0,0,1],[-0.83033,-4.0848,-1.65559]],[4.86,[11205,8747.42,180.194],[-0.198141,-0.980173,0],[0,0,1],[-0.828006,-4.08527,-1.65513]],[4.88,[11205,8747.34,180.162],[-0.197632,-0.980276,0],[0,0,1],[-0.82592,-4.0857,-1.65471]],[4.901,[11204.9,8747.25,180.128],[-0.197046,-0.980394,0],[0,0,1],[-0.823798,-4.08613,-1.65429]],[4.921,[11204.9,8747.17,180.095],[-0.196325,-0.980538,0],[0,0,1],[-0.821355,-4.08662,-1.6538]],[4.941,[11204.9,8747.09,180.061],[-0.19546,-0.980711,0],[0,0,1],[-0.818351,-4.08722,-1.6532]],[4.961,[11204.9,8747.01,180.028],[-0.194699,-0.980863,0],[0,0,1],[-0.814745,-4.08794,-1.74054]],[4.981,[11204.9,8746.92,179.993],[-0.193848,-0.981031,0],[0,0,1],[-0.811574,-4.08857,-1.74011]],[5.001,[11204.9,8746.84,179.958],[-0.193061,-0.981186,0],[0,0,1],[-0.808025,-4.08927,-1.73963]],[5.021,[11204.8,8746.76,179.922],[-0.192494,-0.981298,0],[0,0,1],[-0.804746,-4.08992,-1.73919]],[5.041,[11204.8,8746.69,179.892],[-0.192215,-0.981353,0],[0,0,1],[-0.726665,-3.70441,-1.57478]],[5.06,[11204.8,8746.62,179.909],[-0.19194,-0.981406,0],[0,0,1],[-0.651289,-3.32516,1.01203]],[5.079,[11204.8,8746.56,179.926],[-0.19169,-0.981455,0],[0,0,1],[-0.576142,-2.94586,0.896557]],[5.098,[11204.8,8746.51,179.941],[-0.191438,-0.981504,0],[0,0,1],[-0.50127,-2.56651,0.781075]],[5.118,[11204.8,8746.47,179.954],[-0.191181,-0.981554,0],[0,0,1],[-0.425313,-2.18058,0.663599]],[5.138,[11204.8,8746.44,179.965],[-0.191052,-0.981579,0],[0,0,1],[-0.349544,-1.79462,0.54612]],[5.158,[11204.8,8746.41,179.974],[-0.191052,-0.981579,0],[0,0,1],[-0.272888,-1.40203,0.426644]],[5.179,[11204.8,8746.39,179.98],[-0.191052,-0.981579,0],[0,0,1],[-0.191372,-0.983223,0.299199]],[5.201,[11204.8,8746.38,179.983],[-0.191052,-0.981579,0],[0,0,1],[-0.108583,-0.557872,0.169763]],[5.222,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[-0.0270673,-0.139065,0.0423181]],[5.242,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[0,0,-0]],[5.261,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[0,0,-0]],[5.28,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[0,0,-0]],[5.3,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[0,0,-0]],[5.32,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[0,0,-0]],[5.34,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[0,0,-0]],[5.359,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[0,0,-0]],[5.378,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[0,0,-0]],[5.399,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[0,0,-0]],[5.42,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[0,0,-0]],[5.441,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[0,0,-0]],[5.461,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[0,0,-0]],[5.481,[11204.8,8746.37,179.984],[-0.191052,-0.981579,0],[0,0,1],[0,0,-0]]];
	
	// Start sequence
	private ["_sequence"];
	_sequence = [_unit, _movementData] spawn BIS_fnc_UnitPlay;
	
	// Disable AI entirely
	{_unit disableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
	
	// Take off combat mode
	_unit setBehaviour "AWARE";
	_unit setUnitPos "AUTO";
	
	// Get in the helicopter
	_unit assignAsCargo BIS_Mi48;
	[_unit] orderGetIn true;
	
	// Start crouched
	_unit switchMove "AmovPknlMstpSrasWrflDnon";
	
	sleep 0.25;
	
	if (alive _unit) then {
		// Stand up
		_unit switchMove "AmovPknlMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon";
		
		sleep 0.5;
		
		if (alive _unit) then {
			// Start moving
			_unit playMove "AmovPercMrunSrasWrflDf";
			
			sleep 4.5;
			
			if (alive _unit) then {
				// Stop moving
				_unit playMove "AmovPercMstpSrasWrflDnon";
				
				// Wait for the sequence to end
				waitUntil {scriptDone _sequence};
				
				if (alive _unit) then {
					// Re-enable AI
					{_unit enableAI _x} forEach ["ANIM", "AUTOTARGET", "FSM", "MOVE", "TARGET"];
					
					_unit setPos position _unit;
					_unit switchMove "AmovPercMstpSrasWrflDnon";
				};
			};
		};
	};
};