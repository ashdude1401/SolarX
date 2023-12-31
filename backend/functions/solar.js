const states = {
  35: "ANDAMAN and NICOBAR ISLANDS",
  28: "ANDHRA PRADESH",
  12: "ARUNACHAL PRADESH",
  18: "ASSAM",
  10: "BIHAR",
  4: "CHANDIGARH",
  22: "CHHATTISGARH",
  30: "GOA",
  24: "GUJARAT",
  6: "HARYANA",
  2: "HIMACHAL PRADESH",
  1: "JAMMU and KASHMIR",
  20: "JHARKHAND",
  29: "KARNATAKA",
  32: "KERALA",
  37: "LADAKH",
  31: "LAKSHADWEEP",
  23: "MADHYA PRADESH",
  27: "MAHARASHTRA",
  14: "MANIPUR",
  17: "MEGHALAYA",
  15: "MIZORAM",
  13: "NAGALAND",
  7: "NCT OF DELHI",
  21: "ORISSA",
  34: "PUDUCHERRY",
  3: "PUNJAB",
  8: "RAJASTHAN",
  11: "SIKKIM",
  33: "TAMIL NADU",
  36: "TELANGANA",
  38: "THE DADRA AND NAGAR HAVELI AND DAMAN AND DIU",
  16: "TRIPURA",
  9: "UTTAR PRADESH",
  5: "UTTARAKHAND",
  19: "WEST BENGAL",
};

data_irradiation = {
  1: 1046.26,
  2: 1046.26,
  3: 1156.39,
  4: 1156.39,
  5: 1046.26,
  6: 1156.39,
  7: 1156.39,
  8: 1266.52,
  9: 1156.39,
  10: 1156.39,
  11: 1046.26,
  12: 1046.26,
  13: 1046.26,
  14: 1046.26,
  15: 1046.26,
  16: 1046.26,
  17: 1046.26,
  18: 1046.26,
  19: 1156.39,
  20: 1156.39,
  21: 1156.39,
  22: 1266.52,
  23: 1266.52,
  24: 1266.52,
  25: 1266.52,
  26: 1266.52,
  27: 1266.52,
  28: 1266.52,
  29: 1266.52,
  30: 1266.52,
  31: 1266.52,
  32: 1266.52,
  33: 1266.52,
  34: 1266.52,
  35: 1156.39,
  36: 1266.52,
};

function solarEnergy(area,unit,price,monthlyCost, state_no, Perfomance_ratio = 70, efficiency = 17) {
  energy =
    area *
    efficiency *
    (data_irradiation[state_no] / 1000) *
    Perfomance_ratio *
    30*0.1;
  let consumption=monthlyCost/unit;
  let amountGained=25*12*monthlyCost-price;
  let treeSaved=energy/763; 
  let recoveryMonth=price/monthlyCost;
  let co2EmissionMitigated=energy/1220;

  return {"energy":energy,"amountGained":amountGained,"treeSaved":Math.floor(treeSaved),"co2EmissionMitigated(in tonnes)":Math.floor(co2EmissionMitigated),"recoverMonth":Math.floor(recoveryMonth)};
}
module.exports = solarEnergy;
