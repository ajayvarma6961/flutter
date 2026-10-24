import '../models/job.dart';

class SampleJobs {
  static const List<SdgInfo> allSdgs = [
    SdgInfo(
      number: 1,
      title: 'No Poverty',
      shortDesc: 'End poverty in all its forms everywhere.',
      colorHex: 0xFFE5243B,
    ),
    SdgInfo(
      number: 3,
      title: 'Good Health & Well-being',
      shortDesc: 'Ensure healthy lives and promote well-being for all at all ages.',
      colorHex: 0xFF4C9F38,
    ),
    SdgInfo(
      number: 4,
      title: 'Quality Education',
      shortDesc: 'Ensure inclusive and equitable quality education and promote lifelong learning opportunities.',
      colorHex: 0xFFC5192D,
    ),
    SdgInfo(
      number: 7,
      title: 'Affordable & Clean Energy',
      shortDesc: 'Ensure access to affordable, reliable, sustainable and modern energy for all.',
      colorHex: 0xFFFCC30B,
    ),
    SdgInfo(
      number: 8,
      title: 'Decent Work & Economic Growth',
      shortDesc: 'Promote sustained, inclusive and sustainable economic growth, full and productive employment.',
      colorHex: 0xFFA21942,
    ),
    SdgInfo(
      number: 9,
      title: 'Industry, Innovation & Infrastructure',
      shortDesc: 'Build resilient infrastructure, promote inclusive and sustainable industrialization and foster innovation.',
      colorHex: 0xFFFD6925,
    ),
    SdgInfo(
      number: 10,
      title: 'Reduced Inequalities',
      shortDesc: 'Reduce inequality within and among countries.',
      colorHex: 0xFFDD1367,
    ),
    SdgInfo(
      number: 11,
      title: 'Sustainable Cities & Communities',
      shortDesc: 'Make cities and human settlements inclusive, safe, resilient and sustainable.',
      colorHex: 0xFFFD9D24,
    ),
    SdgInfo(
      number: 12,
      title: 'Responsible Consumption & Production',
      shortDesc: 'Ensure sustainable consumption and production patterns.',
      colorHex: 0xFFBF8B2E,
    ),
    SdgInfo(
      number: 13,
      title: 'Climate Action',
      shortDesc: 'Take urgent action to combat climate change and its impacts.',
      colorHex: 0xFF3F7E44,
    ),
    SdgInfo(
      number: 14,
      title: 'Life Below Water',
      shortDesc: 'Conserve and sustainably use the oceans, seas and marine resources for sustainable development.',
      colorHex: 0xFF0A97D9,
    ),
    SdgInfo(
      number: 17,
      title: 'Partnerships for the Goals',
      shortDesc: 'Strengthen the means of implementation and revitalize the Global Partnership for Sustainable Development.',
      colorHex: 0xFF19486A,
    ),
  ];

  static SdgInfo getSdg(int number) {
    return allSdgs.firstWhere(
      (s) => s.number == number,
      orElse: () => SdgInfo(
        number: number,
        title: 'Global Goal $number',
        shortDesc: 'United Nations Sustainable Development Goal',
        colorHex: 0xFF1B4931,
      ),
    );
  }

  static final List<Job> jobs = [
    Job(
      id: 'job-1',
      title: 'Climate Data Analyst',
      organization: 'Terra Collective',
      location: 'Remote, India',
      workplaceType: 'Remote',
      employmentType: 'Full-time',
      salary: '₹12–18 LPA',
      postedDate: '2 days ago',
      category: JobCategory.climate,
      impactStatement:
          'Transform satellite telemetry and ground sensor streams into actionable carbon abatement insights for over 250 rural agricultural cooperatives across South Asia.',
      description:
          'Terra Collective is an open-source climate tech non-profit building high-resolution carbon accounting engines. As a Climate Data Analyst, you will collaborate with remote sensing scientists, ecological modelers, and grassroots farmer producer organizations (FPOs) to quantify greenhouse gas mitigation, soil carbon sequestration, and bio-char application efficacy. Your analysis directly empowers local farming communities to access transparent voluntary carbon markets.',
      responsibilities: const [
        'Build automated Python and SQL data pipelines ingesting Sentinel-2 geospatial imagery and IoT soil moisture data.',
        'Develop statistical regression and anomaly detection models to measure methane emissions in paddy cultivation.',
        'Design interactive dashboards in Streamlit/Metabase for agricultural extension officers and funders.',
        'Author peer-reviewed methodology documents and carbon verification audit reports conforming to Verra and Gold Standard frameworks.',
      ],
      requirements: const [
        '3+ years of experience in data analysis, climate analytics, or environmental sciences.',
        'Proficiency with Python (Pandas, GeoPandas, Xarray, Rasterio) and modern SQL databases.',
        'Familiarity with GHG Protocol standards and GIS tools (QGIS or Google Earth Engine).',
        'Strong storytelling and visualization skills to present complex ecological trends to non-technical stakeholders.',
      ],
      skills: const [
        'Python',
        'GeoPandas',
        'SQL',
        'Climate Modeling',
        'Remote Sensing',
        'Data Visualization',
        'GHG Protocol',
      ],
      sdgs: [
        getSdg(13), // Climate Action
        getSdg(7),  // Clean Energy
        getSdg(12), // Responsible Consumption
      ],
      applyUrl: 'https://terracollective.org/careers/climate-data-analyst',
      contactEmail: 'talent@terracollective.org',
      isFeatured: true,
    ),
    Job(
      id: 'job-2',
      title: 'Community Health Program Lead',
      organization: 'Swasthya Foundation',
      location: 'Pune',
      workplaceType: 'On-site',
      employmentType: 'Full-time',
      salary: '₹9–13 LPA',
      postedDate: '3 days ago',
      category: JobCategory.health,
      impactStatement:
          'Expand maternal and child healthcare networks across 140 peri-urban primary health clinics, directly preventing malnutrition in 45,000 infants annually.',
      description:
          'Swasthya Foundation works at the frontier of primary public health systems in Western India. The Community Health Program Lead will oversee our frontline ASHA and Anganwadi worker digital empowerment initiatives. You will lead field deployment teams, partner with district health administrations, and optimize supply chains for diagnostic kits and essential micronutrient supplements.',
      responsibilities: const [
        'Manage a cohort of 18 field supervisors and 400+ community health workers across Pune and peripheral districts.',
        'Lead rollout of mobile health monitoring tools tracking neonatal checkups, vaccination schedules, and maternal anemia.',
        'Conduct monthly stakeholder alignment meetings with District Health Officers and municipal medical teams.',
        'Analyze field health survey data to identify localized immunization gaps and design targeted intervention drives.',
      ],
      requirements: const [
        'Master’s degree in Public Health (MPH), Social Work (MSW), or Healthcare Administration.',
        '4+ years of grassroots community health or maternal health program implementation experience.',
        'Fluency in Marathi and English with deep cultural empathy for rural and peri-urban families.',
        'Demonstrated competence in program budget management and public-private sector liaisoning.',
      ],
      skills: const [
        'Public Health',
        'Field Program Leadership',
        'ASHA Training',
        'Maternal Care',
        'Monitoring & Evaluation',
        'Community Outreach',
      ],
      sdgs: [
        getSdg(3),  // Good Health & Well-being
        getSdg(10), // Reduced Inequalities
        getSdg(11), // Sustainable Cities
      ],
      applyUrl: 'https://swasthyafoundation.in/join/health-lead',
      contactEmail: 'hr@swasthyafoundation.in',
      isFeatured: true,
    ),
    Job(
      id: 'job-3',
      title: 'Learning Experience Designer',
      organization: 'OpenLearn India',
      location: 'Bengaluru',
      workplaceType: 'Hybrid',
      employmentType: 'Full-time',
      salary: '₹10–15 LPA',
      postedDate: '1 day ago',
      category: JobCategory.education,
      impactStatement:
          'Architect localized, vernacular STEM & digital literacy curricula for 300,000 first-generation learners in state public schools.',
      description:
          'OpenLearn India crafts low-bandwidth, gamified learning modules designed for low-cost Android tablets and community computer labs. As our Learning Experience Designer, you will translate National Curriculum Framework guidelines into interactive, inquiry-based pedagogical micro-lessons that spark scientific curiosity and critical thinking in vernacular languages.',
      responsibilities: const [
        'Design pedagogical frameworks, storytelling storyboards, and interactive exercises for Grades 6–10 Mathematics and Science.',
        'Collaborate with visual illustrators, translators, and game developers to bring multimedia modules to life.',
        'Conduct immersive field classroom user-testing sessions in rural Karnataka and Telangana.',
        'Measure learning retention indices and iteratively refine assessment rubrics based on student usage telemetry.',
      ],
      requirements: const [
        '3+ years in instructional design, educational technology, or curriculum development.',
        'Solid foundation in Bloom’s Taxonomy, Universal Design for Learning (UDL), and constructivist learning theory.',
        'Experience building content in vernacular Indian languages (Hindi, Kannada, or Tamil is a plus).',
        'Portfolio showing intuitive, learner-centered educational experiences or games.',
      ],
      skills: const [
        'Instructional Design',
        'Curriculum Architecture',
        'UDL',
        'Gamification',
        'Vernacular Content',
        'EdTech',
      ],
      sdgs: [
        getSdg(4),  // Quality Education
        getSdg(8),  // Decent Work & Economic Growth
        getSdg(10), // Reduced Inequalities
      ],
      applyUrl: 'https://openlearn.org.in/careers/learning-designer',
      contactEmail: 'pedagogy@openlearn.org.in',
      isFeatured: false,
    ),
    Job(
      id: 'job-4',
      title: 'Sustainable Supply Chain Associate',
      organization: 'EarthKind Foods',
      location: 'Mumbai',
      workplaceType: 'Full-time',
      employmentType: 'Full-time',
      salary: '₹7–10 LPA',
      postedDate: '4 days ago',
      category: JobCategory.climate,
      impactStatement:
          'Eliminate single-use virgin plastics and curb post-harvest food waste by 40% across regenerative agroforestry supply corridors.',
      description:
          'EarthKind Foods bridges regenerative organic farmers directly with urban consumers. We are seeking an energetic Sustainable Supply Chain Associate to oversee procurement logistics, zero-waste cold storage hubs, and biodegradable packaging operations. You will champion fair-trade remuneration and carbon-neutral freight partnerships.',
      responsibilities: const [
        'Audit upstream farm clusters for fair-trade compliance and regenerative organic certification standards.',
        'Optimize route planning and cold-chain temperature monitoring to minimize perishability losses.',
        'Test and procure certified compostable packaging alternatives with regional biopolymer manufacturers.',
        'Track Scope 3 transportation emissions and maintain supplier sustainability scorecards.',
      ],
      requirements: const [
        '2+ years of experience in supply chain operations, logistics, or sustainable procurement.',
        'Working understanding of circular economy principles, cold-chain logistics, and life-cycle assessments (LCA).',
        'Strong problem-solving mindset and comfort working on warehouse floors and rural procurement centers.',
        'Excellent vendor negotiation and project management skills.',
      ],
      skills: const [
        'Sustainable Procurement',
        'Circular Economy',
        'Cold Chain',
        'Life Cycle Assessment',
        'Vendor Management',
        'Scope 3 Emissions',
      ],
      sdgs: [
        getSdg(12), // Responsible Consumption & Production
        getSdg(11), // Sustainable Cities & Communities
        getSdg(13), // Climate Action
      ],
      applyUrl: 'https://earthkindfoods.in/careers/supply-chain-associate',
      contactEmail: 'sustainability@earthkindfoods.in',
      isFeatured: false,
    ),
    Job(
      id: 'job-5',
      title: 'Accessibility Product Designer',
      organization: 'Equal Access Labs',
      location: 'Remote, India',
      workplaceType: 'Remote',
      employmentType: 'Contract',
      salary: '₹8–12 LPA (Contract)',
      postedDate: '5 days ago',
      category: JobCategory.inclusion,
      impactStatement:
          'Pioneer WCAG 2.2 AAA digital interfaces and assistive screen-reader paradigms for India’s 26 million citizens with disabilities.',
      description:
          'Equal Access Labs is a specialized digital accessibility consultancy and research studio. As our Accessibility Product Designer, you will audit, redesign, and advocate for universal accessibility across critical digital public infrastructure, fintech services, and civic portals. You will conduct co-design workshops with users of screen readers, braille displays, and switch access devices.',
      responsibilities: const [
        'Perform hands-on accessibility audits against WCAG 2.2 Level AA/AAA standards and the Indian standard IS 17802.',
        'Design high-fidelity wireframes, contrast systems, and keyboard focus patterns in Figma.',
        'Facilitate inclusive user research sessions with visually impaired and neurodiverse participants.',
        'Create accessibility design tokens and guidelines for client engineering engineering teams.',
      ],
      requirements: const [
        '3+ years in UX/UI product design with a focused passion for accessibility (a11y).',
        'Thorough knowledge of WCAG guidelines, ARIA specifications, and screen reader behavior (NVDA, TalkBack, VoiceOver).',
        'Proficiency in Figma, design systems, and inclusive design heuristics.',
        'Empathy-first communicator capable of advocating for accessible best practices with executive teams.',
      ],
      skills: const [
        'Digital Accessibility (a11y)',
        'WCAG 2.2',
        'Figma Design Systems',
        'VoiceOver / TalkBack Testing',
        'Assistive Tech',
        'User Research',
      ],
      sdgs: [
        getSdg(10), // Reduced Inequalities
        getSdg(9),  // Industry, Innovation & Infrastructure
        getSdg(8),  // Decent Work
      ],
      applyUrl: 'https://equalaccesslabs.org/work-with-us/designer',
      contactEmail: 'inclusive@equalaccesslabs.org',
      isFeatured: true,
    ),
    Job(
      id: 'job-6',
      title: 'Nonprofit Partnerships Manager',
      organization: 'GiveWell Network',
      location: 'Delhi, Hybrid',
      workplaceType: 'Hybrid',
      employmentType: 'Full-time',
      salary: '₹11–16 LPA',
      postedDate: 'Just now',
      category: JobCategory.community,
      impactStatement:
          'Channel over ₹60 Crores in catalytic philanthropic capital to verified grassroots initiatives fighting intergenerational poverty.',
      description:
          'GiveWell Network connects institutional donors, CSR foundations, and high-impact non-governmental organizations. The Nonprofit Partnerships Manager will be the connective tissue between our donor ecosystem and vetted community non-profits across Northern and Eastern India, verifying impact metrics and structuring multi-year funding alliances.',
      responsibilities: const [
        'Identify, vet, and onboard high-performing civil society organizations under our rigorous social return on investment (SROI) framework.',
        'Cultivate relationships with CSR heads of Fortune 500 enterprises and family philanthropic offices.',
        'Structure grant agreements, milestone governance schedules, and transparent impact monitoring protocols.',
        'Organize regional coalition roundtables focusing on systemic poverty alleviation and disaster resilience.',
      ],
      requirements: const [
        '4+ years in strategic partnerships, CSR management, social impact investing, or donor engagement.',
        'Nuanced knowledge of Section 135 Indian Companies Act (CSR law) and FCRA regulations.',
        'Exceptional interpersonal presence and persuasive executive writing prowess.',
        'Demonstrated track record of closing high-value institutional agreements.',
      ],
      skills: const [
        'Philanthropic Strategy',
        'CSR Compliance',
        'Grant Structuring',
        'Stakeholder Management',
        'Impact Measurement',
        'SROI',
      ],
      sdgs: [
        getSdg(17), // Partnerships for the Goals
        getSdg(1),  // No Poverty
        getSdg(10), // Reduced Inequalities
      ],
      applyUrl: 'https://givewellnetwork.in/careers/partnerships-manager',
      contactEmail: 'partners@givewellnetwork.in',
      isFeatured: false,
    ),
    Job(
      id: 'job-7',
      title: 'Microgrid Renewable Systems Engineer',
      organization: 'Gramin Solar Energy Alliance',
      location: 'Jaipur, Rajasthan',
      workplaceType: 'Hybrid',
      employmentType: 'Full-time',
      salary: '₹11–15 LPA',
      postedDate: '6 days ago',
      category: JobCategory.climate,
      impactStatement:
          'Deploy decentralized hybrid solar microgrids that deliver 24x7 clean energy to 80 unelectrified off-grid tribal hamlets.',
      description:
          'Gramin Solar Energy Alliance empowers rural communities with resilient renewable energy infrastructure. As a Microgrid Systems Engineer, you will design solar PV and lithium battery storage systems, oversee contractor installations, and train local village youth as solar technicians for perpetual community maintenance.',
      responsibilities: const [
        'Design electrical schematics, inverter sizing, and battery balance-of-system for 25kW–150kW rural microgrids.',
        'Supervise field commissioning and safety audits in remote geographical zones.',
        'Deploy remote IoT telemetry loggers for real-time inverter health and energy generation diagnostics.',
        'Develop training manuals and conduct capacity-building workshops for village energy committees.',
      ],
      requirements: const [
        'B.Tech / B.E. in Electrical, Renewable, or Energy Engineering.',
        '3+ years in solar PV design, microgrid engineering, or decentralized power systems.',
        'Proficiency in PVsyst, AutoCAD Electrical, and energy simulation tools.',
        'Willingness to travel to field project sites across Rajasthan and Madhya Pradesh.',
      ],
      skills: const [
        'Solar PV Design',
        'PVsyst',
        'Microgrids',
        'Battery Energy Storage',
        'Electrical Engineering',
        'IoT Telemetry',
      ],
      sdgs: [
        getSdg(7),  // Affordable & Clean Energy
        getSdg(13), // Climate Action
        getSdg(9),  // Industry & Innovation
      ],
      applyUrl: 'https://graminsolar.org/careers/systems-engineer',
      contactEmail: 'careers@graminsolar.org',
      isFeatured: false,
    ),
    Job(
      id: 'job-8',
      title: 'Water Governance & Watershed Specialist',
      organization: 'Jal Chetna Sansthan',
      location: 'Udaipur, Hybrid',
      workplaceType: 'Hybrid',
      employmentType: 'Full-time',
      salary: '₹8.5–12 LPA',
      postedDate: '1 week ago',
      category: JobCategory.community,
      impactStatement:
          'Restore depleted aquifers and revive traditional rainwater harvesting check-dams across 60 drought-prone watershed villages.',
      description:
          'Jal Chetna Sansthan blends indigenous water harvesting wisdom with hydrogeological modeling. You will work side-by-side with village panchayats and farmer collectives to map groundwater recharge structures, implement ridge-to-valley soil moisture conservation, and establish democratic community water-sharing compacts.',
      responsibilities: const [
        'Conduct hydrogeological catchment surveys and GIS drainage mapping for watershed interventions.',
        'Mobilize village water user associations (Pani Panchayats) to formulate equitable water distribution agreements.',
        'Oversee check dam, percolation tank, and rooftop rainwater recharge construction projects.',
        'Publish seasonal groundwater level progress reports to guide sustainable crop sowing patterns.',
      ],
      requirements: const [
        'Master’s degree in Hydrology, Environmental Science, Water Resource Management, or Rural Development.',
        '3+ years of experience in participatory watershed management or community water conservation.',
        'Comfort working with rural community leaders and local civic bodies.',
        'GIS and spatial mapping skills applied to hydrology are highly valued.',
      ],
      skills: const [
        'Watershed Management',
        'Hydrogeology',
        'GIS Mapping',
        'Panchayat Engagement',
        'Rainwater Harvesting',
        'Natural Resource Governance',
      ],
      sdgs: [
        getSdg(11), // Sustainable Cities & Communities
        getSdg(13), // Climate Action
        getSdg(14), // Life Below Water
      ],
      applyUrl: 'https://jalchetna.org/careers/watershed-specialist',
      contactEmail: 'contact@jalchetna.org',
      isFeatured: false,
    ),
  ];
}
