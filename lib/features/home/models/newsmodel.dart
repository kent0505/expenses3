class Newsmodel {
  final String name;
  final String desc;
  final String url;
  final String date;

  Newsmodel({
    required this.name,
    required this.desc,
    required this.url,
    required this.date,
  });
}

List<Newsmodel> newsmodels = [
  Newsmodel(
    name: 'Fed\'s Powell defends central bank independence as challenges loom',
    desc:
        'Federal Reserve Chair Jerome Powell said on Tuesday central bank independence is a proven and politically popular way to achieve the best possible outcomes for the U.S. economy.\n\n“The record is pretty clear” that a central bank that operates outside of political factors and direction is “a good institutional arrangement that serves the public well," Powell said, adding "as long as it\'s seen to serve the public well, it’s a good choice."\n\nPowell\'s comments came during testimony on monetary policy and the economy given before the Senate\'s Committee on Banking, Housing, and Urban Affairs.\n\nPowell flagged the ubiquity of independence at central banks among major economies, where the institutions are afforded latitude to achieve their respective mandates without being directed to do so by political authorities. A key aspect of independence is that it gives central banks space to make difficult choices when it comes to managing inflation.\n\nThat bears on the near-term choices that now lie ahead for the Fed. With its short-term interest rate target at the highest level in decades, officials are searching for evidence that will allow them to cut rates as price pressures ease. That decision puts them potentially on track to ease just ahead of the presidential election in November, which would be highly contentious in political terms.\n\nFed independence issues have loomed back into focus amid a presidential election season that could return Donald Trump to the White House. When Trump was president he repeatedly attacked the Fed for its monetary policy choices, breaking from decades of presidents steering clear from actively lobbying the Fed over how to set interest rate policy.',
    url:
        'https://www.reuters.com/resizer/v2/HJQB5EKFRFOX7EUFJ5EJEVL26A.jpg?auth=b22febcdea7c1d41cd6a76746f843a21e0fd8594efded0322313ef758cf58c72&width=640&quality=80',
    date: '10.07.24',
  ),
  Newsmodel(
    name: 'Bank of England scrutinises risk transfers in insurance sector',
    desc:
        'The Bank of England (BoE) said on Tuesday it would increase scrutiny of risks such as bulk purchase annuities, or insurers taking over company defined benefit pension schemes, a growth area in the sector.\n\nGareth Truran, the BoE\'s executive director for insurance, said bulk purchase annuities had changed the dynamics of the insurance market, which could bring "particular risk management challenges" that would need a "high level of scrutiny".\n\nInsurers have been using so-called funded reinsurance arrangements in large volumes to support their bulk purchase annuity business, which some market observers predict to be around 600 billion pounds (\$767 billion) over the next decade.\n\n"Given the risks we see, we will maintain a high level of scrutiny of UK insurers’ use of these transactions, at an individual firm level and across the sector," Truran told an industry event.\n\nThe BoE is working closely with other regulators internationally on these issues, he said.\n\n"We will monitor further market developments, and we stand ready to consider further measures if required to mitigate the risks to UK insurers or their policyholders," Truran said.\n\nHe also confirmed that Britain\'s top insurers would face their next stress test in 2025 when, for the first time, the BoE will publish company-by-company results for life insurers. To date, the central bank has published aggregate results.',
    url:
        'https://www.reuters.com/resizer/v2/JYHZAQX52ZNNPBFQBBSVWLSD2I.jpg?auth=1abf19bbb966bfea9e926c632664cded11462b4e44276649618d5f2437722a65&width=640&quality=80',
    date: '10.07.24',
  ),
  Newsmodel(
    name:
        'Judge trims First Citizens claims that HSBC poached Silicon Valley Bank workers',
    desc:
        'A federal judge in California has dismissed most of First Citizens BancShares\' (FCNCA.O), opens new tab \$1 billion lawsuit accusing HSBC (HSBA.L), opens new tab of poaching more than 40 employees of Silicon Valley Bank after its high-profile collapse.\n\nU.S. Magistrate Judge Laurel Beeler in San Francisco late Tuesday said that she lacked the ability to hear some of the claims by First Citizens, which acquired Silicon Valley Bank when it failed last year, because they alleged conduct that occurred outside California.\n\nBeeler also tossed claims against several HSBC entities and former Silicon Valley Bank employees who joined HSBC, saying First Citizens had not shown an illegal conspiracy to poach workers and trade secrets.\n\n"Right now, the allegations against most defendants show only a failed bank and employees decamping to a better business opportunity," Beeler wrote.\n\nAn HSBC spokesperson in a statement said the bank was pleased with the ruling.\n\n"HSBC is strongly committed to the innovation banking space and to our employees, and will continue to vigorously defend against the lawsuit brought by First Citizens," the spokesperson said.\n\nA representative of First Citizens did not immediately respond to a request for comment.\n\nBeeler is scheduled to hold a conference in August to discuss the next steps in the case.\n\nThe U.S. Federal Deposit Insurance Corporation took over Silicon Valley Bank in March 2023 after a bank run in which depositors rushed to pull out their money, causing the largest bank failure since the 2008 financial crisis.\n\nFirst Citizens then purchased the failed bank\'s assets and deposits, and HSBC separately acquired the lender\'s UK arm.',
    url:
        'https://www.reuters.com/resizer/v2/4XINO5HQ4BI5TKTZRGSQGRJQMU.jpg?auth=c4d37a13e790aca6413b630a618009102971182560a33568c34fdb82ad7ce8d5&width=640&quality=80',
    date: '10.07.24',
  ),
  Newsmodel(
    name:
        'Exonerated trader settles \$150 million lawsuit against Deutsche Bank',
    desc:
        'A former Deutsche Bank trader whose conviction in New York for rigging the Libor interest rate benchmark was overturned has settled his \$150 million lawsuit accusing the German lender of making him a scapegoat by lying to prosecutors.\n\nMatthew Connolly, who once led Deutsche Bank\'s pool trading desk, voluntarily dismissed his lawsuit accusing Deutsche Bank of malicious prosecution on Wednesday, a filing in Manhattan federal court showed.\n\nA spokeswoman for Deutsche Bank said "the matter has been resolved," without providing details. Lawyers for Connolly did not immediately respond to requests for comment.\n\nConnolly and London-based colleague Gavin Black were convicted in 2018 for rigging Libor, with Connolly sentenced to six months of home confinement and a \$100,000 fine.\n\nBut an appeals court overturned both convictions in January 2022, citing a lack of evidence of guilt.',
    url:
        'https://www.reuters.com/resizer/v2/WTTUCRWOBNJFLBQ272AOBZ4UH4.jpg?auth=56e372c331197e9a195a4b78374b9ff7b4eef7180d057e266a17c648e9dc6772&width=640&quality=80',
    date: '10.07.24',
  ),
  Newsmodel(
    name:
        'Italy\'s government not involved in UniCredit\'s ECB lawsuit, source says',
    desc:
        'Prime Minister Giorgia Meloni\'s government is not involved in any way in a legal challenge by UniCredit (CRDI.MI), opens new tab of the terms set by the European Central Bank (ECB) for it to cut its presence in Russia, a senior government source said.\n\nEuro zone banks still having business in Russia more than two years after Moscow invaded Ukraine have come under growing pressure in recent weeks from the bloc\'s supervisors, as well as U.S. authorities, over their ties to the country.\n\nThe euro zone banking sector\'s Chief Supervisor Claudia Buch said in May the ECB had told banks with significant exposure to Russia to speed up their de-risking efforts by setting a clear roadmap for downsizing and exiting the Russian market.\n\nIn the same month, Bank of Italy Governor and ECB policymaker Fabio Panetta urged Italian banks "to get out" because of reputational risks.\n\nUniCredit, which owns Russia\'s 15th largest bank by assets, said last week it was contesting the ECB\'s decision in the European Court of Justice, seeking its suspension pending a judgment.',
    url:
        'https://www.reuters.com/resizer/v2/5HXJYKZW4JK25IT4BTJZIOOCDE.jpg?auth=8ecc726a9a860b69d4e0803a1bbc6f2b4746ae94c8b00cda9321a6086f8f4db7&width=640&quality=80',
    date: '10.07.24',
  ),
  Newsmodel(
    name:
        'US regional banks to face increased scrutiny as CRE exposure stifles buybacks',
    desc:
        ' U.S. regional banks will probably stockpile more rainy-day funds and stay conservative on stock buybacks as losses from commercial real estate (CRE) loans are expected to pressure their earnings, analysts said.\n\nAs regional lenders prepare to report second-quarter results next week, they continue to face tough scrutiny from investors over potential weakness from CRE and commercial borrowers.\n\nRegional bank stocks have lagged the broader market on concerns that high interest rates will deter borrower demand and weigh on profits for most of 2024.\n\nProblems related to CRE loans at regional lender New York Community Bancorp (NYCB.N), opens new tab earlier this year, and more recently First Foundation (FFWM.N), opens new tab, have put the spotlight on default risks.\n\n"CRE portfolios mature gradually over time and losses tend to be lumpy," analysts at Morgan Stanley led by Manan Gosalia wrote in a note.\n\n"We expect higher for longer rates will continue to pressure credit quality for the next several quarters pushing more banks to build loan loss reserves through 2024," they added.',
    url:
        'https://www.reuters.com/resizer/v2/VPSNJQFAQVMWPNK7K4FPEY2AJE.jpg?auth=16d24a5bb989fa4fbe78b22b4e506ced08a6cc179f6252bdb5bff00506cb853e&width=640&quality=80',
    date: '09.07.24',
  ),
  Newsmodel(
    name:
        'Yandex split nears completion as Russian traders finalise share exchange',
    desc:
        'Russian traders have finalised a share exchange for investors in Yandex, often dubbed Russia\'s Google, one of the final steps needed to complete a more than \$5 billion deal that will see local investors take control of the bulk of the technology company\'s business.\n\nA consortium of Russian investors is leading a buyout of Yandex from its Dutch parent company Yandex NV (YNDX.O), opens new tab after months of negotiations, with the parent selling its assets in Russia at a heavily discounted price due to Kremlin demands on foreign asset sales.\n\nThe deal, the largest by a Western-held company to exit Russia since the start of the war in Ukraine, will see Yandex\'s Russia-based businesses, which generate more than 95% of revenue and include search, advertising, e-commerce and ride hailing, acquired by the Russian investors.\n\nSmaller business units in cloud, data solutions, self-driving cars and education technology will be developed internationally by Yandex NV.\n\nYandex\'s Nasdaq shares were suspended shortly after Moscow invaded Ukraine in February 2022, and so the deal will allow Russian investors to trade the stock again, while foreign investors hope to salvage something from the international assets.\n\nRussia\'s two main bourses, Moscow Exchange and SPB Exchange, said late on Tuesday a voluntary exchange for investors to convert their Yandex NV shares into shares in the new Russian entity, MKPAO Yandex, had been completed.',
    url:
        'https://www.reuters.com/resizer/v2/SGLL75OX6BLUDK5GRXJUQMVSK4.jpg?auth=584585f8c291ef96f2116c715803d0088811529ab615bb8548f8606c5b6dbda5&width=640&quality=80',
    date: '09.07.24',
  ),
  Newsmodel(
    name:
        'Late 2027 looms as \'realistic\' date for Europe\'s stock market shake up',
    desc:
        'A coordinated move by stock markets in the European Union and Britain to catch up with Wall Street by halving the settlement time for transactions could realistically happen in late 2027, an EU regulatory hearing was told on Wednesday.\n\nTrades on the London Stock Exchange, Deutsche Boerse, Euronext and other bourses in Europe take two business days to settle, lagging one business day (T+1) in the United States since May.\n\nThe European Securities and Markets Authority, the bloc\'s markets watchdog, held a hearing on Wednesday where a poll of participants overwhelmingly backed an option to complete T+1 in the fourth quarter of 2027.\n\nBritain has targeted the end of 2027 at the latest, and later this year the EU\'s executive European Commission is expected to propose a date, with technical preparations already underway.\n\n"Q4 2027, with all that is already happening, I think is realistic, I don\'t think it\'s too much of a stretch," Sebastijan Hrovatin, a senior official at the European Commission, told the hearing, adding that a final decision would be up to the EU states and the European Parliament.',
    url:
        'https://www.reuters.com/resizer/v2/BJWIKIAN7JI2NAZUMXL47IVGOI.jpg?auth=3d694fcc992fef8ffba1208288ddf3aa57a92aa5055a4d4e6dfb16a20176e7e4&width=640&quality=80',
    date: '09.07.24',
  ),
  Newsmodel(
    name: 'Swiss price regulator puts UBS under observation',
    desc:
        'Switzerland\'s consumer pricing watchdog has put UBS (UBSG.S), opens new tab under observation following its takeover of Credit Suisse, the regulator said on Thursday, amid concerns that the market power of the enlarged lender could lead to higher loan charges.\n\nThe supervisor had met with financial market regulator FINMA, competition authority ComCo and the Swiss National Bank to discuss consequences of the takeover, it said in a statement.\n\nThe meeting laid down the groundwork for necessary cooperation between the different authorities in future, they said.\n\nUBS on Monday said it had completed the merger of its domestic unit with Credit Suisse\'s operations in its home market.\n\nUBS had no immediate comment on the decision but a spokesperson pointed to previous statements the bank had made noting that there was plenty of competition within the Swiss banking sector.',
    url:
        'https://www.reuters.com/resizer/v2/L5KOXHO3SRMNJAAB3ZCCLRBTIU.jpg?auth=5d82f96aacc27ea4b20bc7798d1ffc8b13b781c1f548a04e46f8dfe73c594f03&width=640&quality=80',
    date: '09.07.24',
  ),
];
