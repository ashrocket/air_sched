--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: airlines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY airlines (id, code, name, country_name, slug) FROM stdin;
2266	0A	Amber Air	Lithuania	0A
2267	0B	Blue Air	Romania	0B
2268	0C	Catovair	Mauritius	0C
2269	0D	Darwin Airline	Switzerland	0D
2270	0G	Ghadames Air Transport	Libya	0G
2271	0J	Premium Jet	Germany	0J
2272	0K	Aircompany Kokshetau	Kazakhstan	0K
2273	0P	Palau Asia Pacific Air	Palau	0P
2274	0S	SpiceJet	India	0S
2275	0V	Vietnam Air Service Company	Viet Nam	0V
2276	0Y	Fly Yeti	Nepal	0Y
2277	1X	Branson AirExpress	USA	1X
2278	2A	Deutsche Bahn AG   	Germany	2A
2279	2B	OJSC AK BARS AERO	Russian Federation	2B
2280	2C	SNCF   	France	2C
2281	2D	Aerovip	Argentina	2D
2282	2E	Smokey Bay Air	USA	2E
2283	2F	Frontier Flying Service	USA	2F
2284	2G	Angara Airlines	Russian Federation	2G
2285	2G1	San Juan Airlines   	USA	2G1
2286	2H	Thalys International	Belgium	2H
2287	2I	Star Peru	Peru	2I
2288	2J	Air Burkina	Burkina Faso	2J
2289	2K	AEROGAL	Ecuador	2K
2290	2L	Helvetic Airways	Switzerland	2L
2291	2M	Moldavian Airlines	Moldova Republic of	2M
2292	2N	Nextjet	Sweden	2N
2293	2O	Island Air Service	USA	2O
2294	2P	PAL Express	Philippines	2P
2295	2Q	Nuovo Trasporto Viaggiatori	Italy	2Q
2296	2Q1	Blekingeflyg	Sweden	2Q1
2297	2Q2	Sundsvallsflyg	Sweden	2Q2
2298	2Q3	Flysmaland	Sweden	2Q3
2299	2Q4	Kalmarflyg	Sweden	2Q4
2300	2R	Via Rail Canada	Canada	2R
2301	2S	Sunny Airways	Thailand	2S
2302	2T	Alajnihah AirTransport	Libya	2T
2303	2U	Sun d'Or International Airlines	Israel	2U
2304	2V	Amtrak	USA	2V
2305	2W	Welcome Air	Austria	2W
2306	2Y	Air Andaman	Thailand	2Y
2307	2Z	TTA	Mozambique	2Z
2308	3A	Chu Kong Passenger Transport Co Ltd.	Hong Kong (sar) China	3A
2309	3B	Job Air - Central Connect Airlines	Czech Republic	3B
2310	3C	RegionsAir   	USA	3C
2311	3D	Denim Air   	Netherlands	3D
2312	3E	Multi-Aero, Inc. D/b/A Air Choice One	USA	3E
2313	3F	Pacific Airways Inc	USA	3F
2314	3G	Gambia Bird Airlines Ltd.	Gambia	3G
2315	3H	Air Inuit	Canada	3H
2316	3I	Pison Airways	Ghana	3I
2317	3J	Jubba Airways Ltd	Kenya	3J
2318	3K	Jetstar Asia	Singapore	3K
2319	3L	Intersky	Austria	3L
2320	3M	Silver Airways Corp	USA	3M
2321	3N	Air Urga	Ukraine	3N
2322	3O	Air Arabia Maroc	Morocco	3O
2323	3P	Tiara Air Aruba	Aruba	3P
2324	3Q	Carib Aviation	Antigua and Barbuda, Leeward Islands	3Q
2325	3R	Gromov Air	Russian Federation	3R
2326	3S	Air Antilles	France	3S
2327	3T	Turan Air	Azerbaijan	3T
2328	3U	Sichuan Airlines	China	3U
2329	3V	TNT Airways S.A.	Belgium	3V
2330	3W	Freedom Airways	Austria	3W
2331	3X	Premier Trans Aire	USA	3X
2332	3Y	Madina Air	Libya	3Y
2333	3Z	Travel Service Polska	Poland	3Z
2334	4A	Royal Bengal Airline	Bangladesh	4A
2335	4B	Boutique Air	USA	4B
2336	4C	Aires	Colombia	4C
2337	4D	Air Sinai	Egypt	4D
2338	4E	Tanana Air Service	USA	4E
2339	4F	Air City	Germany	4F
2340	4G	Gazpromavia	Russian Federation	4G
2341	4H	United Airways Bangladesh	Bangladesh	4H
2342	4I	IzAir	Turkey	4I
2343	4J	Somon Air	Tajikistan	4J
2344	4K	Kenn Borek Air	Canada	4K
2345	4L	Georgian International Airlines	Georgia	4L
2346	4M	LanArgentina	Argentina	4M
2347	4N	Air North	Canada	4N
2348	4O	Interjet	Mexico	4O
2349	4P	Southern Star Airlines	South Sudan	4P
2350	4Q	SAFi Airways	Afghanistan	4Q
2351	4R	Hamburg International	Germany	4R
2352	4S	Solar Cargo	Venezuela	4S
2353	4T	Belair Airlines	Switzerland	4T
2354	4T2	Khantyavia   	Russian Federation	4T2
2355	4U	germanwings	Germany	4U
2356	4V	Lignes Aeriennes Congolaises	Congo Democratic Republic of	4V
2357	4W	Warbelow's Air Ventures Inc.	USA	4W
2358	4X	Mercury World Cargo	USA	4X
2359	4Y	Flight Alaska	USA	4Y
2360	4Z	South African Airlink	South Africa	4Z
2361	4Z1	Swazi Airlink     	Swaziland	4Z1
2362	5A	Alpine Aviation	USA	5A
2363	5B	Euro-Asia Air International	Kazakhstan	5B
2364	5C	NatureAir	Costa Rica	5C
2365	5D	Aeromexico Connect	Mexico	5D
2366	5E	Nok mini	Thailand	5E
2367	5F	Arctic Circle Air Service	USA	5F
2368	5G	Fly 540 Ghana	Ghana	5G
2369	5H	Five Forty Aviation	Kenya	5H
2370	5I	Alsa Grupo Slu	Spain	5I
2371	5J	Cebu Pacific Air	Philippines	5J
2372	5K	Hi Fly Transportes Aereos	Portugal	5K
2373	5L	Aerosur	Bolivia	5L
2374	5M	FlyMontserrat	Montserrat, Leeward Islands	5M
2375	5N	Nordavia - Regional Airlines	Russian Federation	5N
2376	5O	europe AIRPOST	France	5O
2377	5P	Aerolinea Principal	Chile	5P
2378	5Q	BQB Air	Uruguay	5Q
2379	5Q1	Euroceltic   	United Kingdom	5Q1
2380	5R	Karthago Airlines	Tunisia	5R
2381	5S	Global Aviation and Service Group	Libya	5S
2382	5T	Canadian North	Canada	5T
2383	5U	Transportes Aereo Guatemaltecos	Guatemala	5U
2384	5V	Everts Air	USA	5V
2385	5W	Astraeus	United Kingdom	5W
2386	5W1	Iceland Express	Iceland	5W1
2387	5W2	Palmair	United Kingdom	5W2
2388	5X	United Parcel Service Co.	USA	5X
2389	5Y	Atlas Air	USA	5Y
2390	5Z	Bismillah Airlines	Bangladesh	5Z
2391	6A	AVIACSA	Mexico	6A
2392	6B	Baxter Aviation	Canada	6B
2393	6C	Air Timor	Timor-leste	6C
2394	6D	Travel Service Slovakia	Slovakia	6D
2395	6E	IndiGo Air	India	6E
2396	6F	MAT Airways	Macedonia Former Yugoslav Republic of	6F
2397	6G	Sun Air International	USA	6G
2398	6G1	Virgin Islands International Airways   	Virgin Islands, US	6G1
2399	6H	Israir	Israel	6H
2400	6I	Air Alsie	Denmark	6I
2401	6J	Jubba Airways	Somalia	6J
2402	6K	KyrgyzTransAvia	Kyrgyzstan	6K
2403	6L	Aklak Air	Canada	6L
2404	6M	Air Minas Linhas Aereas	Brazil	6M
2405	6N	Al-naser Airlines	Jordan	6N
2406	6N1	EuroManx   	United Kingdom	6N1
2407	6N2	CityConnect Airlines   	Netherlands	6N2
2408	6O	Liaison	Canada	6O
2409	6P	Gryphon Airlines	South Africa	6P
2410	6Q	Cham Wings Airlines	Syrian Arab Republic	6Q
2411	6R	OJSC Mirny Enterprise	Russian Federation	6R
2412	6S	Star Air Aviation	Pakistan	6S
2413	6T	Turks Air	USA	6T
2414	6U	Acg Air Cargo Germany	Germany	6U
2415	6U1	Ukraine National Airlines     	Ukraine	6U1
2416	6V	AVANZA	Spain	6V
2417	6W	Saratov Airlines	Russian Federation	6W
2418	6Y	Smartlynx Airlines Ltd	Latvia	6Y
2419	6Z	Euro-Asia Air	Kazakhstan	6Z
2420	72E	Sky Cabs	Sri Lanka	72E
2421	72J	China Cargo Airlines	China	72J
2422	72N	Starwelt Trans Lloyd Cargo	Malawi	72N
2423	72Y	Thai Air Cargo	Thailand	72Y
2424	73A	Alliance Air	USA	73A
2425	73D	Air People International	Thailand	73D
2426	73L	Africa West	Togo	73L
2427	73N	Airvantage Inc	USA	73N
2428	73S	Aerologic GmbH	Germany	73S
2429	73X	Premier Trans Aire	USA	73X
2430	74C	Click Airways	United Arab Emirates	74C
2431	74J	Air Cargo Carriers Inc.	USA	74J
2432	74S	Solar Cargo	Venezuela	74S
2433	74X	Mercury World Cargo	USA	74X
2434	75B	Euro-Asia Air International	Kazakhstan	75B
2435	75C	C.A.l. Cargo Airlines	Israel	75C
2436	75M	National Airlines	USA	75M
2437	75R	Custom Air Transport, Inc.	USA	75R
2438	75S	L'Aeropostale	France	75S
2439	75W	Itapemirim Transportes Aereos S.A.	Brazil	75W
2440	75Y	Atlas Air	USA	75Y
2441	75Z	Airfreight Express	United Kingdom	75Z
2442	76G	Gabon Airlines Cargo	Gabon	76G
2443	76N	Aero Sucre	Colombia	76N
2444	76P	Aeropuma S.A.	USA	76P
2445	76R	Aerounion	Mexico	76R
2446	76S	Star Air Aviation	Pakistan	76S
2447	76T	Turks Air	USA	76T
2448	76W	Libo Air Cargo	Libya	76W
2449	76Z	Cargolift International Airlines	USA	76Z
2450	77A	Aztec Worldwide Airlines	USA	77A
2451	77C	Coyne Airways	United Kingdom	77C
2452	77J	Swiftair	Spain	77J
2453	77L	Silk Way West Airlines	Azerbaijan	77L
2454	77T	Trans Am Aero Exp. Del Ecuador Cia.Ltda	Ecuador	77T
2455	77U	Commercial Aviation Services, LLC	USA	77U
2456	78D	Expo Aviation	Sri Lanka	78D
2457	78F	PT Cardig Air	Indonesia	78F
2458	78G	Gulf And Caribbean Air	USA	78G
2459	78L	Cargo Plus Aviation Inc	Bahamas	78L
2460	78V	Astral Aviation	Kenya	78V
2461	78W	BAX Global	USA	78W
2462	78Y	China Postal Airlines	China	78Y
2463	79F	Haiti Air Freight International S.A.	USA	79F
2464	79G	Ukraine Air Service	Ukraine	79G
2465	79N	ANA & JP Express	Japan	79N
2466	79X	Diamond International Airlines, Inc	USA	79X
2467	7A	Air Next	Japan	7A
2468	7A5	Airlinair	France	7A5
2469	7B	Moscow Airlines	Russian Federation	7B
2470	7B4	Bankair, Inc.	USA	7B4
2471	7BB	CargoB Airlines	Belgium	7BB
2472	7BF	Bluebird Cargo	Iceland	7BF
2473	7BN	Forward Air	USA	7BN
2474	7BZ	Blue Dart Aviation Limited	India	7BZ
2475	7C	Jeju Airlines	Korea Republic of	7C
2476	7C4	Rus Aviation	United Arab Emirates	7C4
2477	7C8	Cargolux Italia S.p.A.	Italy	7C8
2478	7C9	Cla Air Transport	Philippines	7C9
2479	7CV	Cargolux Airlines International	Luxembourg	7CV
2480	7D	Donbassaero Airlines	Ukraine	7D
2481	7D4	Aries Del Sur S.A.	Argentina	7D4
2482	7D5	DHL Aero Expreso S.A.	Panama	7D5
2483	7E	Sylt Air	Germany	7E
2484	7.00E+07	Estafeta Carga Aerea	Mexico	70000000
2485	7EZ	Evergreen International Airlines, Inc.	USA	7EZ
2486	7F	First Air	Canada	7F
2487	7F1	Unaalik Aviation   	Canada	7F1
2488	7F2	Aerolineas Regionales Ta Regional Cargo	Mexico	7F2
2489	7F4	Shanghai Airlines Cargo International	China	7F4
2490	7F7	Aircompany Volare	Ukraine	7F7
2491	7FC	Falcon Express	United Arab Emirates	7FC
2492	7FK	Africa West	Togo	7FK
2493	7G	Star Flyer	Japan	7G
2494	7GO	Go	United Kingdom	7GO
2495	7GR	Gemini Air Cargo	USA	7GR
2496	7H	ERA Aviation	USA	7H
2497	7HJ	Asian Express Airlines	Australia	7HJ
2498	7HK	Four Star Aviation, Inc	Virgin Islands, US	7HK
2499	7HW	TransAustralian Air	Australia	7HW
2500	7I	Insel Air	Curacao	7I
2501	7IM	Fly Wex	Italy	7IM
2502	7J	Tajikistan Airlines	Tajikistan	7J
2503	7J5	Donghai Airlines	China	7J5
2504	7J7	Galaxy Airlines	Japan	7J7
2505	7JI	Jade Cargo International	China	7JI
2506	7JT	Transair	Australia	7JT
2507	7JW	Arrow Cargo	USA	7JW
2508	7K	Kogalymavia	Russian Federation	7K
2509	7K4	Kalitta Air	USA	7K4
2510	7K5	Aban Air	Iran Islamic Republic of	7K5
2511	7K9	Itapemirim Transportes Aereos	Brazil	7K9
2512	7KO	Alaska Central Express Inc	USA	7KO
2513	7KR	Kitty Hawk Aircargo, Inc.	USA	7KR
2514	7L	Aerocaribbean	Cuba	7L
2515	7L2	Lynden Air Cargo	USA	7L2
2516	7L3	DHL de Guatemala, S.A.	Guatemala	7L3
2517	7L8	Laparkan Airways	USA	7L8
2518	7LE	Laparkan Airways	USA	7LE
2519	7M	Mayair, S.A. de C.V.	Mexico	7M
2520	7M2	Mario's Air, Inc.	USA	7M2
2521	7M3	Absa Cargo	Brazil	7M3
2522	7M4	Commercial Aviation Services, LLC	USA	7M4
2523	7M6	Amerijet International, Inc.	USA	7M6
2524	7M7	Masair	Mexico	7M7
2525	7MG	Midex Airlines	United Arab Emirates	7MG
2526	7N	National Airways	Ethiopia	7N
2527	7N4	Nac Net Inc.	USA	7N4
2528	7N7	Neptune Air	Malaysia	7N7
2529	7NC	Northern Air Cargo, Inc.	USA	7NC
2530	7O	Travel Service Hungary	Hungary	7O
2531	7OE	Asia Overnight Express Corp.	Philippines	7OE
2532	7P	Air Panama	Panama	7P
2533	7P3	Premier Trans Aire	USA	7P3
2534	7P4	Pacific International Airlines	USA	7P4
2535	7PE	Pacific Air Express	Solomon Islands	7PE
2536	7PL	Airstars	Russian Federation	7PL
2537	7Q	Ulendo Airlink	Malawi	7Q
2538	7Q8	Pacific East Asia Cargo Airlines, Inc.	Philippines	7Q8
2539	7Q9	Sayakhat Air Company	Kazakstan	7Q9
2540	7QA	Starlight Airlines	United Arab Emirates	7QA
2541	7QJ	Jet Airways Inc.	USA	7QJ
2542	7QO	Aeromexpress	Mexico	7QO
2543	7QT	Tampa Airlines Cargo	Colombia	7QT
2544	7R	Joint Stock Aviation Company RusLine	Russian Federation	7R
2545	7R6	Rus Aviation	United Arab Emirates	7R6
2546	7R8	Corporate Charter Service Inc.	Puerto Rico	7R8
2547	7R9	Air Charter Inc.	Puerto Rico	7R9
2548	7RH	PT Republic Express Airlines	Indonesia	7RH
2549	7RT	Rutges Cargo	Netherlands	7RT
2550	7RU	AirBridgeCargo	Russian Federation	7RU
2551	7S	Ryan Air	USA	7S
2552	7S5	Air Calypso	USA	7S5
2553	7S8	Shovkoviy Shlyah Airlines	Ukraine	7S8
2554	7SH	Sunsplash Aviation LLC	USA	7SH
2555	7T	Trans Am Aero Exp. Del Ecuador Cia.Ltda	Ecuador	7T
2556	7T2	Thai Air Cargo	Thailand	7T2
2557	7T4	Tie Aviation Inc.	USA	7T4
2558	7TH	Transmile Air	Malaysia	7TH
2559	7TL	Trans Mediterranean Airways	Lebanon	7TL
2560	7U	Commercial Aviation Services, LLC	USA	7U
2561	7U3	Uralinteravia	Russian Federation	7U3
2562	7UD	Fast Air Carrier, Ltda.	Chile	7UD
2563	7V	Federal Airlines (Pty) Ltd	South Africa	7V
2564	7V4	Vensecar Internacional, C.A.	Venezuela	7V4
2565	7VC	Ocean Airlines	Italy	7VC
2566	7W	Wind Rose Aviation	Ukraine	7W
2567	7W8	Winnport Logistics Ltd	Canada	7W8
2568	7XM	Australian Air Express	Australia	7XM
2569	7Y	MED Airways	Lebanon	7Y
2570	7Y8	Yangtze River Express Airlines	China	7Y8
2571	7Z	Halcyonair Cabo Verde Airways S.A.	Cape Verde	7Z
2572	7Z3	Avient Aviation	Zimbabwe	7Z3
2573	7Z7	Sahara Air Cargo	United Arab Emirates	7Z7
2574	7Z8	DHL de Guatemala, S.A.	Guatemala	7Z8
2575	7ZM	CityLine Hungary	Hungary	7ZM
2576	7ZP	Silk Way Airlines	Azerbaijan	7ZP
2577	7ZR	Aviacon Zitotrans	Russian Federation	7ZR
2578	8A	Panama Airways, Inc	Panama	8A
2579	8B	Business Air Centre Co	Thailand	8B
2580	8C	Cotai Ferry Company	Hong Kong (sar) China	8C
2581	8D	Servant Air, Inc.	USA	8D
2582	8E	Bering Air	USA	8E
2583	8F	STP Airways	Sao Tome and Principe	8F
2584	8G	GIRjet	Spain	8G
2585	8H	Highland Airways	United Kingdom	8H
2586	8I	Insel Air Aruba	Aruba	8I
2587	8J	Jet4you	Morocco	8J
2588	8K	K-Mile Air Co	Thailand	8K
2589	8L	Lucky Air Co. Ltd.	China	8L
2590	8M	Myanmar Airways International	Myanmar	8M
2591	8N	Regional Air Services	Tanzania United Republic of	8N
2592	8O	West Coast Air	Canada	8O
2593	8P	Pacific Coastal Airlines Limited	Canada	8P
2594	8Q	Onur Air	Turkey	8Q
2595	8R	Sol Lineas Aereas	Argentina	8R
2596	8S	TurboJET	Hong Kong (sar) China	8S
2597	8T	Air Tindi Ltd	Canada	8T
2598	8U	Afriqiyah Airways	Libya	8U
2599	8V	Wright Air Service	USA	8V
2600	8W	Private Wings	Germany	8W
2601	8Y	China Postal Airlines	China	8Y
2602	8Z	Wizz Air Bulgaria	Bulgaria	8Z
2603	9A	Aladia Airlines	Mexico	9A
2604	9B	Accesrail Inc.	Canada	9B
2605	9B1	Flam Railway   	Norway	9B1
2606	9B2	Michigan Flyer Motorcoach	USA	9B2
2607	9B3	SNCB Europe	Belgium	9B3
2608	9B4	Renfe	Spain	9B4
2609	9BA	One	United Kingdom	9BA
2610	9BB	Arriva Trains Northern   	United Kingdom	9BB
2611	9BC	Central Trains   	United Kingdom	9BC
2612	9BD	Southern   	United Kingdom	9BD
2613	9BE	First Great Eastern   	United Kingdom	9BE
2614	9BF	First Great Western   	United Kingdom	9BF
2843	BJ1	BritishJET	United Kingdom	BJ1
2615	9BG	First North Western   	United Kingdom	9BG
2616	9BH	Great North Eastern Railway   	United Kingdom	9BH
2617	9BI	Midland Main Line   	United Kingdom	9BI
2618	9BJ	First Scotrail	United Kingdom	9BJ
2619	9BK	South Central Trains   	United Kingdom	9BK
2620	9BL	South West Trains   	United Kingdom	9BL
2621	9BM	Virgin Trains   	United Kingdom	9BM
2622	9BN	WAGN Railway   	United Kingdom	9BN
2623	9BO	Arriva Trains Wales   	United Kingdom	9BO
2624	9BP	Wessex Trains   	United Kingdom	9BP
2625	9BQ	NSB - Norwegian State Railways   	Norway	9BQ
2626	9BR	Swedish Railways   	Sweden	9BR
2627	9BS	Wales & West   	United Kingdom	9BS
2628	9BT	Skanetrafiken   	Sweden	9BT
2629	9BU	OBB - Osterreichische Bundesbahnen   	Austria	9BU
2630	9BV	Silverlink Train Services   	United Kingdom	9BV
2631	9BW	First Capital Connect	United Kingdom	9BW
2632	9BX	TransPennine Express   	United Kingdom	9BX
2633	9BY	London Eastern Railway   	United Kingdom	9BY
2634	9BZ	Southeastern Trains	United Kingdom	9BZ
2635	9C	Spring Airlines	China	9C
2636	9D	Toumai Air Tchad	Chad	9D
2637	9E	Endeavor Air	USA	9E
2638	9F	Eurostar International	United Kingdom	9F
2639	9G	Airport Express Rail	United Kingdom	9G
2640	9G1	Arlanda Express   	Sweden	9G1
2641	9G2	Gatwick Express   	United Kingdom	9G2
2642	9G3	Heathrow Express   	United Kingdom	9G3
2643	9G4	Stansted Express   	United Kingdom	9G4
2644	9H	Dutch Antilles Express	Curacao	9H
2645	9I	Helitrans AS	Norway	9I
2646	9J	Dana Airlines Ltd	Nigeria	9J
2647	9K	Cape Air	USA	9K
2648	9L	Colgan Air   	USA	9L
2649	9M	Central Mountain Air Ltd.	Canada	9M
2650	9N	Tropic Air	Belize	9N
2651	9O	National Airways Cameroon	Cameroon	9O
2652	9P	Petra Airline	Jordan	9P
2653	9Q	Caicos Express Airways	Turks and Caicos Islands	9Q
2654	9R	SATENA	Colombia	9R
2655	9S	Swazi Express	Swaziland	9S
2656	9T	ACT Airlines Inc	Turkey	9T
2657	9U	Air Moldova	Moldova Republic of	9U
2658	9V	AVIOR Airlines	Venezuela	9V
2659	9W	Jet Airways (india) Ltd	India	9W
2660	9W1	Jet Airways Konnect	India	9W1
2661	9X	Congo Express	Congo Democratic Republic of	9X
2662	9Y	Fly Georgia	Georgia	9Y
2663	A0	L'avion	France	A0
2664	A2	Astra Airlines	Greece	A2
2665	A3	Aegean Airlines	Greece	A3
2666	A4	Aerocon	Bolivia	A4
2667	A5	HOP!	France	A5
2668	A6	Air Alps Aviation	Austria	A6
2669	A7	Air Niamey	Niger	A7
2670	A8	Aerolink Uganda Ltd	Uganda	A8
2671	A9	Georgian Airways	Georgia	A9
2672	AA	American Airlines	USA	AA
2673	AA1	Van Galder Bus   	USA	AA1
2674	AAE	American Eagle     	USA	AAE
2675	AAF	Aigle Azur   	France	AAF
2676	AAG	Air Atlantique   	United Kingdom	AAG
2677	AAI	Air Aurora   	USA	AAI
2678	AAN	Amsterdam Airlines	Netherlands	AAN
2679	AAQ	Copterline	Finland	AAQ
2680	AAT	Austrian Air Transport   	Austria	AAT
2681	AAU	Australia Asia                         	Australia	AAU
2682	AB	Air Berlin	Germany	AB
2683	ABB	Air Belgium   	Belgium	ABB
2684	ABD	Air Atlanta Icelandic   	Iceland	ABD
2685	ABJ	Abaete Linhas Aereas	Brazil	ABJ
2686	ABO	Superior Aviation, Inc	USA	ABO
2687	ABQ	Airblue	Pakistan	ABQ
2688	ABR	Air Contractors   	Ireland Republic of	ABR
2689	ABT	Alexandair     	Canada	ABT
2690	AC	Air Canada	Canada	AC
2691	AC1	Alberta Citylink   	Canada	AC1
2692	AC2	DRL Coachlines Ltd   	Canada	AC2
2693	AC3	Air Canada Regional   	Canada	AC3
2694	AC4	Exploits Valley Air Services	Canada	AC4
2695	AC5	Sky Regional Airlines	Canada	AC5
2696	ACK	Nantucket Airlines   	USA	ACK
2697	ACL	ItAli Airlines	Italy	ACL
2698	ACS	Air Cess   	United Arab Emirates	ACS
2699	ACU	Aerocancun     	Mexico	ACU
2700	AD	Azul Airlines	Brazil	AD
2701	ADB	Antonov Design Bureau   	Ukraine	ADB
2702	ADI	Audeli   	Spain	ADI
2703	ADK	ADC Airlines   	Nigeria	ADK
2704	ADO	Avia Leasing	Uzbekistan	ADO
2705	AE	Mandarin Airlines	Chinese Taipei	AE
2706	AEK	Aero Costa Rica   	Costa Rica	AEK
2707	AEQ	Air Express Sweden	Sweden	AEQ
2708	AEY	Air Italy	Italy	AEY
2709	AF	Air France	France	AF
2710	AF1	Air France Asie   	France	AF1
2711	AF2	Airspeed Aviation Ltd   	Switzerland	AF2
2712	AF3	Hermes Airlines	Greece	AF3
2713	AFV	Air Afrique Vacances   	Cote D'Ivoire	AFV
2714	AFW	Africa World Airlines Limited	Ghana	AFW
2715	AG	Interprovincial	Canada	AG
2716	AG1	Hunting Cargo Airlines (Ireland)     	Ireland Republic of	AG1
2717	AGL	Air Galaxy	Bangladesh	AGL
2718	AGO	Angola Air Charter     	Angola	AGO
2719	AGP	GPA     	Ireland Republic of	AGP
2720	AGU	Angara Airlines	Russian Federation	AGU
2721	AH	Air Algerie	Algeria	AH
2722	AHC	AZAL Avia Cargo   	Azerbaijan	AHC
2723	AHR	Air Holland   	Netherlands	AHR
2724	AHW	Aeromist-Kharkiv Ltd	Russian Federation	AHW
2725	AI	Air India	India	AI
2726	AIA	Avies Air Company	Estonia	AIA
2727	AIH	Alpine Air Express Chile   	Chile	AIH
2728	AIJ	Air Jet   	France	AIJ
2729	AIN	African International Airways   	Swaziland	AIN
2730	AIS	Aeris   	France	AIS
2731	AJ	Aztec Worldwide Airlines	USA	AJ
2732	AK	AirAsia	Malaysia	AK
2733	AK1	FAX - Fly Asian Xpress	Malaysia	AK1
2734	AKL	Air Kilroe     	United Kingdom	AKL
2735	AKT	Aircompany Karat   	Russian Federation	AKT
2736	AL	Skyway Airlines dba Midwest Connect	USA	AL
2737	ALC	American Linehaul Corporation	USA	ALC
2738	ALK	Airlink   	Australia	ALK
2739	ALO	Allegheny Airlines   	USA	ALO
2740	AM	Aeromexico	Mexico	AM
2741	AMF	Ameriflight   	USA	AMF
2742	AMK	Amerer Air   	Austria	AMK
2743	AMV	AMC Airlines   	Egypt	AMV
2744	AMZ	Air Meuse     	Belgium	AMZ
2745	AN	Ansett Australia	Australia	AN
2746	AN1	Ansett Australia Cargo   	Australia	AN1
2747	AN2	Ansett International   	Australia	AN2
2748	AN3	Skywest Airlines   	Australia	AN3
2749	ANH	Alajnihah AirTransport	Libya	ANH
2750	ANK	Air Nippon	Japan	ANK
2751	AO	Avianova	Russian Federation	AO
2752	AOG	AeroVIP   	Argentina	AOG
2753	AOM	AOM French Airlines   	France	AOM
2754	AP	Air One	Italy	AP
2755	APN	Air Polonia   	Poland	APN
2756	APP	Aeroperlas	Panama	APP
2757	APR	Air Provence International   	France	APR
2758	AQ	MapJet	Austria	AQ
2759	AQU	Airquarius Aviation   	South Africa	AQU
2760	AR	Aerolineas Argentinas	Argentina	AR
2761	AR1	AeroVIP   	Argentina	AR1
2762	ARA	Arik Air	Nigeria	ARA
2763	ARD	Aerocondor	Portugal	ARD
2764	ARF	Airlinair     	France	ARF
2765	ARP	Europe Airpost   	France	ARP
2766	AS	Alaska Airlines	USA	AS
2767	ASF	Air Schefferville     	Canada	ASF
2768	ASU	Aerosur   	Bolivia	ASU
2769	AT	Royal Air Maroc	Morocco	AT
2770	ATM	Airlines Of Tasmania	Australia	ATM
2771	ATN	Air Transport International   	USA	ATN
2772	AU	Austral	Argentina	AU
2773	AUJ	Austrojet	Austria	AUJ
2774	AUK	Auric Air Services	Tanzania United Republic of	AUK
2775	AUZ	Australian Airlines	Australia	AUZ
2776	AV	Avianca	Colombia	AV
2777	AV1	Eastern Bus Company Inc	USA	AV1
2778	AVJ	Avia Traffic Company	Kyrgyzstan	AVJ
2779	AVY	Aerovaradero     	Cuba	AVY
2780	AW	Africa World Airlines Limited	Ghana	AW
2781	AWC	Titan Airways   	United Kingdom	AWC
2782	AWG	Air West Ltd	Georgia	AWG
2783	AWK	Airwork (NZ)	New Zealand	AWK
2784	AWM	Asian Wings Airways	Myanmar	AWM
2785	AWN	Air Niamey	Niger	AWN
2786	AWQ	Indonesia AirAsia	Indonesia	AWQ
2787	AWV	Airwave Transport   	Canada	AWV
2788	AX	Trans States Airlines	USA	AX
2789	AXB	Air India Express	India	AXB
2790	AXY	Axis Airways	France	AXY
2791	AY	Finnair	Finland	AY
2792	AYL	Alpine Air Private	Nepal	AYL
2793	AYZ	Atlant-Soyuz Airlines	Russian Federation	AYZ
2794	AZ	Alitalia - Compagnia Aerea Italiana Spa	Italy	AZ
2795	AZD	Air Zara International	Tanzania United Republic of	AZD
2796	AZI	Astra Airlines	Greece	AZI
2797	AZM	Aerocozumel   	Mexico	AZM
2798	AZY	Arizona Airways Express     	USA	AZY
2799	B2	Belavia	Belarus	B2
2800	B21	Komiinteravia     	Russian Federation	B21
2801	B3	Bhutan Airlines	Bhutan	B3
2802	B4	Bankair, Inc.	USA	B4
2803	B5	East African SAFari Air Express	Kenya	B5
2804	B6	JetBlue Airways Corporation	USA	B6
2805	B7	Uni Airways	Chinese Taipei	B7
2806	B8	Eritrean Airlines	Eritrea	B8
2807	B9	Iran Air Tours	Iran Islamic Republic of	B9
2808	BA	British Airways	United Kingdom	BA
2809	BA1	British Airways Regional   	United Kingdom	BA1
2810	BA2	Aero Services     	United Kingdom	BA2
2811	BA3	Corporate Air Inc.     	Canada	BA3
2812	BA4	National Jets Italia   	Italy	BA4
2813	BA5	Majestic or Samara Rent a Car	Saudi Arabia	BA5
2814	BAL	Britannia Airways   	United Kingdom	BAL
2815	BAW	British Asia Airways   	United Kingdom	BAW
2816	BB	Seaborne Airlines	Virgin Islands, US	BB
2817	BBB	Balair   	Switzerland	BBB
2818	BBT	Air Bashkortostan	Russian Federation	BBT
2819	BC	Skymark Airlines	Japan	BC
2820	BCI	Blue Islands	United Kingdom	BCI
2821	BD	bmi british midland	United Kingdom	BD
2822	BD1	British Midland (Holding Company)   	United Kingdom	BD1
2823	BDR	Badr Airlines	Sudan	BDR
2824	BE	Flybe	United Kingdom	BE
2825	BED	Belgorod State Aviation Enterprise   	Russian Federation	BED
2826	BES	Aero Services Executive   	France	BES
2827	BF	Vincent Aviation	Australia	BF
2828	BFL	Buffalo Airways	Canada	BFL
2829	BFO	Bluebird Cargo	Iceland	BFO
2830	BG	Biman Bangladesh Airlines	Bangladesh	BG
2831	BGH	Balkan Holidays Air	Bulgaria	BGH
2832	BGM	OJSC AK BARS AERO	Russian Federation	BGM
2833	BH	Hawkair	Canada	BH
2834	BHA	Buddha Air	Nepal	BHA
2835	BHB	Bosphorus Airways     	Turkey	BHB
2836	BHL	Bristow Helicopters   	United Kingdom	BHL
2837	BHP	Belair	Switzerland	BHP
2838	BI	Royal Brunei Airlines	Brunei Darussalam	BI
2839	BID	Binair	Germany	BID
2840	BIE	Air Mediterrannee   	France	BIE
2841	BIM	Binter Mediterraneo   	Spain	BIM
2842	BJ	Nouvelair	Tunisia	BJ
2844	BK	Okay Airways	China	BK
2845	BL	Jetstar Pacific Airlines	Viet Nam	BL
2846	BLE	Blue Line   	France	BLE
2847	BLN	Bali Air   	Indonesia	BLN
2848	BLX	TUIfly Nordic	Sweden	BLX
2849	BM	BMI Regional	United Kingdom	BM
2850	BMO	Thai Flying Service	Thailand	BMO
2851	BMR	bmi regional   	United Kingdom	BMR
2852	BMY	Bimini Island Air	USA	BMY
2853	BN	Bahrain Air	Bahrain	BN
2854	BNO	Landair International Airlines	USA	BNO
2855	BO	BB Airways PVT Ltd	Nepal	BO
2856	BOI	Aboitiz Air   	Philippines	BOI
2857	BOR	Borneo Airways     	Brunei Darussalam	BOR
2858	BP	Air Botswana	Botswana	BP
2859	BP1	Kalahari Air Services & Charter   	Botswana	BP1
2860	BPS	Budapest Aircraft Service Ltd.	Hungary	BPS
2861	BQ	Aeromar, C. Por A.	Dominican Republic	BQ
2862	BQB	BQB Air	Uruguay	BQB
2863	BQO	Aeromar, C. Por A.	Dominican Republic	BQO
2864	BR	EVA Airways	Chinese Taipei	BR
2865	BRB	BRA Transportes Aereos	Brazil	BRB
2866	BRH	Star Air Cargo	South Africa	BRH
2867	BRJ	Borajet	Turkey	BRJ
2868	BRP	Aerobratsk	Russian Federation	BRP
2869	BRT	British Airways CitiExpress   	United Kingdom	BRT
2870	BRY	Brymon Airways   	United Kingdom	BRY
2871	BS	British International	United Kingdom	BS
2872	BSK	Miami Air International   	USA	BSK
2873	BSO	Cirrusair	USA	BSO
2874	BT	Air Baltic Corporation	Latvia	BT
2875	BT1	Air Baltic Eastern	Latvia	BT1
2876	BTR	Brewster Bus   	USA	BTR
2877	BTV	Batavia Air	Indonesia	BTV
2878	BU	Compagnie Africaine d'Aviation	Congo Democratic Republic of	BU
2879	BUC	Bulgarian Air Charter   	Bulgaria	BUC
2880	BUE	Sweden Airways AB	Sweden	BUE
2881	BV	Blue Panorama Airlines	Italy	BV
2882	BVI	BVI Airways	Virgin Islands, British	BVI
2883	BVN	Baron Aviation   	USA	BVN
2884	BW	Caribbean Airlines	Trinidad and Tobago	BW
2885	BWI	Blue Wing Airlines	Suriname	BWI
2886	BWL	British World Airlines   	United Kingdom	BWL
2887	BX	Air Busan	Korea Republic of	BX
2888	BXH	Bar XH Air   	Canada	BXH
2889	BXI	Brussels International Airlines   	Belgium	BXI
2890	BY	Britannia Airways	United Kingdom	BY
2891	BZ	Blue Dart Aviation Limited	India	BZ
2892	C0	Centralwings	Poland	C0
2893	C2	CEIBA Intercontinental S.A.	Equatorial Guinea	C2
2894	C3	Contact Air	Germany	C3
2895	C4	Click Airways	United Arab Emirates	C4
2896	C5	CommutAir   	USA	C5
2897	C51	ALTA Lineas Aereas     	Argentina	C51
2898	C6	CanJet Airlines	Canada	C6
2899	C7	Cinnamon Air	Sri Lanka	C7
2900	C8	CRONOSAIR	Equatorial Guinea	C8
2901	C9	Cirrus Airlines	Germany	C9
2902	CA	Air China	China	CA
2903	CA1	Dalian Airlines	China	CA1
2904	CAI	Corendon Airlines	Turkey	CAI
2905	CB	Trans Caribbean Air	USA	CB
2906	CBO	Kitty Hawk International.inc.	USA	CBO
2907	CC	CM Airlines	Honduras	CC
2908	CC1	McCaffertys Greyhound Pty Ltd   	Australia	CC1
2909	CCG	Central Connect Airlines   	Czech Republic	CCG
2910	CCI	Capital Cargo International Airlines   	USA	CCI
2911	CCN	Classic Airways     	United Kingdom	CCN
2912	CCO	Air Atlanta Icelandic   	Iceland	CCO
2913	CD	Alliance Air   	India	CD
2914	CDE	Comed Aviation     	United Kingdom	CDE
2915	CDR	Canadian Regional Airlines   	Canada	CDR
2916	CE	Chalair	France	CE
2917	CER	Cetraca Air Service	Congo Democratic Republic of	CER
2918	CF	City Airline	Sweden	CF
2919	CFB	City Bird France   	France	CFB
2920	CG	Airlines Of Papua New Guinea	Papua New Guinea	CG
2921	CGH	Air Guizhou   	China	CGH
2922	CGK	Click Airways	United Arab Emirates	CGK
2923	CGL	Seagle Air	Slovakia	CGL
2924	CGO	Caicos Caribbean Airways	USA	CGO
2925	CGW	Air Great Wall   	China	CGW
2926	CH	Bemidji Airlines	USA	CH
2927	CHC	China Ocean Helicopters   	China	CHC
2928	CHF	Chitaavia   	Russian Federation	CHF
2929	CHO	Ukraine Air Service	Ukraine	CHO
2930	CHP	AVIACSA	Mexico	CHP
2931	CHQ	Chautauqua Airlines     	USA	CHQ
2932	CI	China Airlines	Chinese Taipei	CI
2933	CIB	Condor Berlin   	Germany	CIB
2934	CIC	ICC Air Cargo Canada   	Canada	CIC
2935	CIO	Ciao Fly   	Italy	CIO
2936	CJ	BA Cityflyer	United Kingdom	CJ
2937	CJG	Zhejiang Airlines   	China	CJG
2938	CK	China Cargo Airlines	China	CK
2939	CKT	Caledonian Airways     	United Kingdom	CKT
2940	CL	Lufthansa Cityline GMBH   	Germany	CL
2941	CLA	Color Air     	Norway	CLA
2942	CLG	Chalair	France	CLG
2943	CLV	Skybus                                 	Greece	CLV
2944	CM	Copa Airlines	Panama	CM
2945	CME	Prince Edward Air	Canada	CME
2946	CMV	Calima Aviacion	Spain	CMV
2947	CN	Grand China Air	China	CN
2948	CND	Corendon DUTCH Airlines	Netherlands	CND
2949	CNJ	Nanjing Airlines   	China	CNJ
2950	CNK	Sunwest International Aviation Services	Canada	CNK
2951	CNO	SAS Norway	Norway	CNO
2952	CNX	All Canada Express   	Canada	CNX
2953	CO	Continental Airlines	USA	CO
2954	CO1	Continental Express Bus   	USA	CO1
2955	COC	Cirrus     	Germany	COC
2956	COE	Expressjet   	USA	COE
2957	CP	Compass Airlines, Inc.	USA	CP
2958	CP1	Ontario Regional Airlines   	Canada	CP1
2959	CP2	CP CRAL/Partners   	Canada	CP2
2960	CP3	Northern     	Canada	CP3
2961	CP4	Western Regional Airlines     	Canada	CP4
2962	CPB	Corporate Express Airlines	Canada	CPB
2963	CPN	Caspian Airlines   	Iran Islamic Republic of	CPN
2964	CPT	Corporate Air (US)   	USA	CPT
2965	CQ	Czech Connect Airlines	Czech Republic	CQ
2966	CRA	Cronosair	Equatorial Guinea	CRA
2967	CRG	Cargoitalia	Italy	CRG
2968	CS	Continental Micronesia	Guam	CS
2969	CSC	Sichuan Airlines   	China	CSC
2970	CT	Alitalia CityLiner S.p.A.	Italy	CT
2971	CTB	City Bird   	Belgium	CTB
2972	CTH	China General Aviation Corp   	China	CTH
2973	CU	Cubana	Cuba	CU
2974	CUA	China United Airlines	China	CUA
2975	CUT	Court Air   	South Africa	CUT
2976	CV	Cargolux Airlines International	Luxembourg	CV
2977	CVA	Air Chathams	New Zealand	CVA
2978	CVO	Cargolux Airlines International	Luxembourg	CVO
2979	CW	Chinggis Airways	Mongolia	CW
2980	CWU	Wuhan Air Lines   	China	CWU
2981	CWW	Royal Cargo   	Canada	CWW
2982	CX	Cathay Pacific Airways	Hong Kong (sar) China	CX
2983	CXT	Coastal Air Transport	Virgin Islands, US	CXT
2984	CY	Cyprus Airways	Cyprus	CY
2985	CYH	Yunnan Airlines   	China	CYH
2986	CYL	Air One CityLiner	Italy	CYL
2987	CYN	Zhongyuan Airlines   	China	CYN
2988	CYZ	China Postal Airlines   	China	CYZ
2989	CZ	China Southern Airlines	China	CZ
2990	CZ1	Shantou Airlines   	China	CZ1
2991	D2	Severstal Aircompany	Russian Federation	D2
2992	D3	Daallo Airlines	Djibouti	D3
2993	D4	Alidaunia	Italy	D4
2994	D5	DHL Aero Expreso S.A.	Panama	D5
2995	D6	Inter Air	South Africa	D6
2996	D61	ITAB - International Trans Air Business	Congo Democratic Republic of	D61
2997	D7	Airasia X	Malaysia	D7
2998	D8	Djibouti Airlines	Djibouti	D8
2999	D9	DONAVIA	Russian Federation	D9
3000	DA	Air Georgia	Georgia	DA
3001	DAG	Daghestan Airlines	Russian Federation	DAG
3002	DAL	Delta Express   	USA	DAL
3003	DAT	Delta Air Transport     	Belgium	DAT
3004	DB	HOP! Brit Air	France	DB
3005	DBK	Dubrovnik Airline	Croatia	DBK
3006	DBY	Britannia Airways GmbH     	Germany	DBY
3007	DC	Braathens Regional AB	Sweden	DC
3008	DC1	Gotlandsflyg	Sweden	DC1
3009	DC2	Kullaflyg	Sweden	DC2
3010	DCT	Directflight	United Kingdom	DCT
3011	DD	Nok Air	Thailand	DD
3012	DE	Condor Flugdienst	Germany	DE
3013	DE1	Condor Berlin     	Germany	DE1
3014	DEL	Carib Aviation   	Antigua and Barbuda, Leeward Islands	DEL
3015	DET	D.E.T.A. Air JSC	Kazakhstan	DET
3016	DF	AeBal   	Spain	DF
3017	DG	Tigerair Philippines	Philippines	DG
3018	DGD	MB Air Services & Logistics	United Arab Emirates	DGD
3019	DGO	Custom Air Transport, Inc	USA	DGO
3020	DH	Douniah Airlines	Mali	DH
3021	DHK	DHL Air	United Kingdom	DHK
3022	DI	D.E.T.A. Air JSC	Kazakhstan	DI
3023	DJ	Virgin Australia Airlines	Australia	DJ
3024	DJ1	Pacific Blue Airlines   	New Zealand	DJ1
3025	DJ2	Polynesian Blue   	Samoa	DJ2
3026	DK	Eastland Air	Australia	DK
3027	DKN	Kingfisher Red	India	DKN
3028	DL	Delta Air Lines	USA	DL
3029	DL2	Song   	USA	DL2
3030	DLU	Aerolineas del Sur	Chile	DLU
3031	DM	Sterling Blue	Denmark	DM
3032	DM1	Maersk Helicopters     	Denmark	DM1
3033	DN	Senegal Airlines	Senegal	DN
3034	DNM	Denim Air	Netherlands	DNM
3035	DNO	Aztec Airways	USA	DNO
3036	DO	Discovery Airways Ltd	Nigeria	DO
3037	DP	First Choice Airways	United Kingdom	DP
3038	DQ	D-Connection	Kenya	DQ
3039	DR	Ruili Airlines	China	DR
3040	DRO	Mediterranean Air Service	Tunisia	DRO
3041	DS	easyJet Switzerland SA	Switzerland	DS
3042	DSB	Air Senegal     	Senegal	DSB
3043	DSL	Diamond Sakha Airlines     	Russian Federation	DSL
3044	DSO	DHL Aero Expreso S.A.	Panama	DSO
3045	DT	TAAG Angola Airlines	Angola	DT
3046	DTH	Tassili Airlines   	Algeria	DTH
3047	DU	Norwegian Long Haul A/S	Norway	DU
3048	DV	Air Company SCAT	Kazakhstan	DV
3049	DV1	North Sound Express   	Virgin Islands, British	DV1
3050	DW	Aero Charter	Ukraine	DW
3051	DX	Danish Air Transport	Denmark	DX
3052	DY	Norwegian Air Shuttle	Norway	DY
3053	DZ	Donghai Airlines	China	DZ
3054	E0	Eos Airlines	USA	E0
3055	E2	Eagle Atlantic Airlines	Ghana	E2
3056	E3	Sabaidee Airways Co Ltd	Thailand	E3
3057	E4	Elysian Airlines	Senegal	E4
3058	E5	Air Arabia Egypt	Egypt	E5
3059	E6	Aviaexpresscruise Airlines	Russian Federation	E6
3060	E61	Ajara Airlines   	Georgia	E61
3061	E7	Equaflight	Congo Democratic Republic of	E7
3062	E8	City Airways	Thailand	E8
3063	E9	Evelop Airlines S.L.	Spain	E9
3064	EA	East Horizon Airlines	Afghanistan	EA
3065	EAA	Kyrgyz Airways	Kyrgyzstan	EAA
3066	EAF	Palmair	United Kingdom	EAF
3067	EAG	Eagle Airways   	New Zealand	EAG
3068	EAQ	Eastern Australia Airlines   	Australia	EAQ
3069	EAW	European Airways     	United Kingdom	EAW
3070	EB	Pullmantur Air	Spain	EB
3071	EBU	Delta AirElite   	USA	EBU
3072	EC	Openskies	United Kingdom	EC
3073	ECA	EuroCypria Airlines   	Cyprus	ECA
3074	ECO	Eastern Australia Airlines     	Australia	ECO
3075	ED	Air Dominicana	Dominican Republic	ED
3076	EDA	Exec Direct Aviation	Jamaica	EDA
3077	EDO	Andes Airlines	Ecuador	EDO
3078	EDW	Edelweiss Air	Switzerland	EDW
3079	EE	Eastern SkyJets	United Arab Emirates	EE
3080	EEX	Avanti Airlines   	Germany	EEX
3081	EEZ	Eurofly   	Italy	EEZ
3082	EF	Eznis Airways	Mongolia	EF
3083	EG	CJSC East Air	Tajikistan	EG
3084	EGA	Ecuato Guineana de Aviacion   	Equatorial Guinea	EGA
3085	EGN	Eagle Aviation   	France	EGN
3086	EH	Air Nippon Network	Japan	EH
3087	EHN	East Horizon Airlines	Afghanistan	EHN
3088	EI	Aer Lingus	Ireland Republic of	EI
3089	EI1	Aer Lingus Commuter     	Ireland Republic of	EI1
3090	EJ	New England Airlines	USA	EJ
3091	EK	Emirates	United Arab Emirates	EK
3092	EKA	Equaflight	Congo	EKA
3093	EL	Air Nippon	Japan	EL
3094	ELC	Small Planet Airlines	Lithuania	ELC
3095	ELO	Export Air Del Peru SA	USA	ELO
3096	EM	Aero Benin	Benin	EM
3097	EMO	Empire Airlines   	USA	EMO
3098	EN	Air Dolomiti	Italy	EN
3099	EO	FlyCongo	Congo Democratic Republic of	EO
3100	EO1	Air Tropiques   	Congo Democratic Republic of	EO1
3101	EP	Iran Aseman Airlines	Iran Islamic Republic of	EP
3102	EPA	Farnair Germany   	Germany	EPA
3103	EQ	TAME Linea Aerea del Ecuador	Ecuador	EQ
3104	EQL	Air Sao Tome e Principe   	Sao Tome and Principe	EQL
3105	ER	Astar Air Cargo, Inc.   	USA	ER
3106	ER1	DHL Air   	United Kingdom	ER1
3107	ER2	ELAN     	United Kingdom	ER2
3108	ERO	Sun D'Or International Airlines     	Israel	ERO
3109	ERT	Eritrean Airlines     	Eritrea	ERT
3110	ES	DHL International E.C.	Bahrain	ES
3111	ESA	Seagreen Air Transport     	Antigua and Barbuda, Leeward Islands	ESA
3112	ESC	El Sol de America   	Venezuela	ESC
3113	ESO	DHL International E.C.	Bahrain	ESO
3114	EST	Flugfelag Austerlands     	Iceland	EST
3115	ET	Ethiopian Airlines	Ethiopia	ET
3116	EU	Chengdu Airlines	China	EU
3117	EUK	Air Atlanta Europe Ltd.   	United Kingdom	EUK
3118	EUL	Euralair   	France	EUL
3119	EUP	EuroAir	Greece	EUP
3120	EUY	EU Jet   	Ireland Republic of	EUY
3121	EV	ExpressJet Airlines, Inc.	USA	EV
3122	EW	Eurowings	Germany	EW
3123	EX	Air Santo Domingo	Dominican Republic	EX
3124	EXK	Executive Airlines/American Eagle	USA	EXK
3125	EXN	EXIN   	Poland	EXN
3126	EXT	Nightexpress	Germany	EXT
3127	EXY	SA Express   	South Africa	EXY
3128	EY	Etihad Airways	United Arab Emirates	EY
3129	EZ	Sun Air Of Scandinavia   	Denmark	EZ
3130	EZA	Eznis Airways	Mongolia	EZA
3131	EZE	Eastern Airways     	United Kingdom	EZE
3132	EZO	Evergreen International Airlines, Inc.	USA	EZO
3133	EZS	EasyJet Switzerland   	Switzerland	EZS
3134	F2	SafariLink	Kenya	F2
3135	F3	Fly Excellent AB	Sweden	F3
3136	F31	Aliways   	Italy	F31
3137	F4	Air Flamenco	Puerto Rico	F4
3138	F5	Fly540 S.A	Angola	F5
3139	F6	FaroeJet	Faroe Islands	F6
3140	F7	Darwin Airline	Switzerland	F7
3141	F8	Freedom Airlines   	USA	F8
3142	F9	Frontier Airlines Inc.	USA	F9
3143	F91	Lynx Aviation	USA	F91
3144	FA	FreshAer	Ireland Republic of	FA
3145	FAE	Merlin Express     	USA	FAE
3146	FAH	Farner Air Transport Hungary   	Hungary	FAH
3147	FAO	Falcon Air Express   	USA	FAO
3148	FAT	Farnair Europe	Switzerland	FAT
3149	FB	Bulgaria Air	Bulgaria	FB
3150	FBO	Fine Air Services, Inc.	USA	FBO
3151	FBR	Belair Ile de France     	France	FBR
3152	FC	Falcon Express	United Arab Emirates	FC
3153	FCA	First Choice Airways	United Kingdom	FCA
3154	FCL	Florida Coastal Airlines, Inc.	USA	FCL
3155	FCN	Falcon Air   	Sweden	FCN
3156	FCO	Falcon Express	United Arab Emirates	FCO
3157	FD	Thai AirAsia	Thailand	FD
3158	FDM	Freedom Airlines	USA	FDM
3159	FE	Far Eastern Air Transport	Chinese Taipei	FE
3160	FEM	Flywell Airlines   	Zambia	FEM
3161	FF	Tower Air	USA	FF
3162	FFM	Firefly	Malaysia	FFM
3163	FG	Ariana Afghan Airlines	Afghanistan	FG
3164	FH	Futura International Airways	Spain	FH
3165	FHE	Hello	Switzerland	FHE
3166	FI	Icelandair	Iceland	FI
3167	FI1	Danish State Railways (DSB)   	Denmark	FI1
3168	FI2	Loftleidir Icelandic	Iceland	FI2
3169	FJ	Fiji Airways	Fiji	FJ
3170	FK	Africa West	Togo	FK
3171	FKO	Africa West	Togo	FKO
3172	FL	Airtran Airways	USA	FL
3173	FL1	Greyhound Lines   	USA	FL1
3174	FLN	Express Air Services     	South Africa	FLN
3175	FLT	Flightline   	United Kingdom	FLT
3176	FM	Shanghai Airlines	China	FM
3177	FN	Fastjet Tanzania Ltd	Tanzania United Republic of	FN
3178	FNA	Air Iceland     	Iceland	FNA
3179	FO	Felix Airways	Yemen	FO
3180	FO1	Sociedad de Transportes Aereos     	Mozambique	FO1
3181	FOF	Fred Olsen Air Transport     	Norway	FOF
3182	FOM	Freedom Air (NZ)	New Zealand	FOM
3183	FOS	Formosa Airlines                       	Taiwan Province of China	FOS
3184	FP	Freedom Air	Guam	FP
3185	FQ	Brindabella Airlines	Australia	FQ
3186	FR	Ryanair	Ireland Republic of	FR
3187	FRN	First Nation Airways	Nigeria	FRN
3188	FRS	Flandre Air     	France	FRS
3189	FS	Syphax Airlines	Tunisia	FS
3190	FSO	Servicios Transportes Aereos Fueguinos	USA	FSO
3191	FT	Farnair Switzerland AG	Switzerland	FT
3192	FTA	Frontier Flying Service	USA	FTA
3193	FTI	Fly FTi   	Germany	FTI
3194	FU	Air Littoral	France	FU
3195	FU1	Air Littoral Riviera   	France	FU1
3196	FUA	Futura International Airways   	Spain	FUA
3197	FV	Rossiya Airlines	Russian Federation	FV
3198	FW	IBEX Airlines	Japan	FW
3199	FWQ	Flight West Airlines	Australia	FWQ
3200	FX	FedEx	USA	FX
3201	FXL	Fly Excellent AB	Sweden	FXL
3202	FY	Firefly	Malaysia	FY
3203	FZ	Flydubai	United Arab Emirates	FZ
3204	G0	Ghana International	Ghana	G0
3205	G2	Compania Aerea Viajes Guinea Airlines	Equatorial Guinea	G2
3206	G3	VARIG-gol Airlines/vrg Linhas Aereas Sa	Brazil	G3
3207	G4	Allegiant Air LLC	USA	G4
3208	G5	China Express Airlines	China	G5
3209	G6	Ghadames Air Transport	Libya	G6
3210	G7	GoJet Airlines	USA	G7
3211	G8	Go Air	India	G8
3212	G9	Air Arabia	United Arab Emirates	G9
3213	GA	Garuda Indonesia	Indonesia	GA
3214	GAI	Gromov Air	Russian Federation	GAI
3215	GB	ABX Air, Inc.	USA	GB
3216	GBB	Global Aviation	South Africa	GBB
3217	GBC	Gabon Airlines Cargo	Gabon	GBC
3218	GBK	Gabon Airlines Cargo	Gabon	GBK
3219	GBO	ABX Air, Inc. Usps	USA	GBO
3220	GC	Global Feeder Services	USA	GC
3221	GCE	Air Europa Canarias   	Spain	GCE
3222	GCR	GLACE - Greenlandair Charter   	Greenland	GCR
3223	GD	Grandstar Cargo International Airlines	China	GD
3224	GE	Transasia Airways	Chinese Taipei	GE
3225	GEB	Gee Bee Air   	Greece	GEB
3226	GEC	Lufthansa Cargo Airlines   	Germany	GEC
3227	GES	Gestair	Spain	GES
3228	GEX	Georgian Express     	Georgia	GEX
3229	GF	Gulf Air	Bahrain	GF
3230	GG	Sky Lease Cargo	USA	GG
3231	GGN	Air Georgian Ltd dba Air Alliance	Canada	GGN
3232	GGX	Guangxi Airlines   	China	GGX
3233	GH	Globus LLC	Russian Federation	GH
3234	GI	Itek Air	Kyrgyzstan	GI
3235	GIO	Regionnair     	Canada	GIO
3236	GJ	CDI Cargo Airlines Ltd	China	GJ
3237	GJT	Gir Jet   	Spain	GJT
3238	GK	Jetstar Japan	Japan	GK
3239	GL	Air Greenland	Greenland	GL
3240	GM	Tri MG Airlines	Indonesia	GM
3241	GMI	Germania Fluggesellschaft	Germany	GMI
3242	GN	Air Gabon	Gabon	GN
3243	GNT	bmi british midland commuter   	United Kingdom	GNT
3244	GO	Kuzu Airlines Cargo	Turkey	GO
3245	GOT	Air Express   	Sweden	GOT
3246	GOW	Go Air	India	GOW
3247	GP	Pantanal Linhas Aereas	Brazil	GP
3248	GQ	Sky Express S.A.	Greece	GQ
3249	GR	Aurigny Air Services	United Kingdom	GR
3250	GRE	Air Scotland	United Kingdom	GRE
3251	GRN	Greenair     	Turkey	GRN
3252	GRO	Gemini Air Cargo	USA	GRO
3253	GS	TianJin Airlines	China	GS
3254	GSS	Global Supply Systems   	United Kingdom	GSS
3255	GSW	Sky Wings	Greece	GSW
3256	GT	GB Airways   	Gibraltar	GT
3257	GU	Aviateca	Guatemala	GU
3258	GUJ	Gujarat Airways   	India	GUJ
3259	GV	Grant Aviation, Inc.	USA	GV
3260	GW	Airlines Of Kuban	Russian Federation	GW
3261	GWL	Great Wall Airlines	China	GWL
3262	GWO	Golden West Airlines	USA	GWO
3263	GX	JetX	Iceland	GX
3264	GXL	XL Airways Germany	Germany	GXL
3265	GXO	Air Ontario   	Canada	GXO
3266	GY	Sky Bishkek	Kyrgyzstan	GY
3267	GZ	Air Rarotonga	Cook Islands	GZ
3268	H1	Hahn Air Systems	Germany	H1
3269	H2	Sky Airline	Chile	H2
3270	H3	Hermes Airlines	Greece	H3
3271	H4	Heli Securite	France	H4
3272	H5	Hola Airlines	Spain	H5
3273	H6	Hageland Aviation Services Inc	USA	H6
3274	H7	Eagle Air	Uganda	H7
3275	H8	Auric Air Services	Tanzania United Republic of	H8
3276	H9	Helitt Lineas Aereas	Spain	H9
3277	HA	Hawaiian Airlines	USA	HA
3278	HAS	Hokkaido Air System   	Japan	HAS
3279	HB	Asia Atlantic Airlines	Thailand	HB
3280	HBR	Hebridean Air Services	United Kingdom	HBR
3281	HC	Holidays Czech Airlines	Czech Republic	HC
3282	HCB	Helenair (Barbados)   	Barbados	HCB
3283	HCC	Holidays Czech Airlines	Czech Republic	HCC
3284	HCL	Helenair Corporation Ltd   	Saint Lucia	HCL
3285	HD	Hokkaido International Airlines	Japan	HD
3286	HE	Luftfahrt Gesellschaft Walter	Germany	HE
3287	HEJ	Hellas Jet	Greece	HEJ
3288	HEL	Helicol   	Colombia	HEL
3289	HEX	Heathrow Express   	United Kingdom	HEX
3290	HF	Air Cote d'Ivoire	Cote D'Ivoire	HF
3291	HFL	Heliflyg   	Sweden	HFL
3292	HG	NIKI	Austria	HG
3293	HGH	Atlantic Air Lift	France	HGH
3294	HH	Taban Air	Iran Islamic Republic of	HH
3295	HI	Papillon Airways	USA	HI
3296	HJ	Tasman Cargo Airlines Pty Ltd	Australia	HJ
3297	HJO	Asian Express Airlines	Australia	HJO
3298	HK	Hamburg Airways	Germany	HK
3299	HKO	Four Star Aviation, Inc	Virgin Islands, US	HKO
3300	HLA	Heavylift Cargo Airlines   	United Kingdom	HLA
3301	HLN	Air Holland   	Netherlands	HLN
3302	HLQ	Harlequin Air   	Japan	HLQ
3303	HM	Air Seychelles	Seychelles	HM
3304	HMA	Air Tahoma   	USA	HMA
3305	HN	Afghan Airlines	Afghanistan	HN
3306	HO	Juneyao Airlines	China	HO
3307	HOA	Baleares Link Express S.L.	Spain	HOA
3308	HP	America West Airlines	USA	HP
3309	HP1	America West Express     	USA	HP1
3310	HPY	Happy Air	Thailand	HPY
3311	HQ	Thomas Cook Airlines Belgium N.V	Belgium	HQ
3312	HR	Hahn Air	Germany	HR
3313	HR1	Tell Air     	Germany	HR1
3314	HR2	Zozik Air	Germany	HR2
3315	HS	DirektFlyg	Sweden	HS
3316	HT	Hellenic Imperial Airways	Greece	HT
3317	HTT	Air Tchad   	Chad	HTT
3318	HU	Hainan Airlines	China	HU
3319	HUO	Northern Air Cargo	USA	HUO
3320	HV	Transavia.com	Netherlands	HV
3321	HW	North-Wright Airways Ltd.	Canada	HW
3322	HW1	Hello	Switzerland	HW1
3323	HWO	TransAustralian Air	Australia	HWO
3324	HX	Hong Kong Airlines	Hong Kong (sar) China	HX
3325	HXA	China Express Airlines	China	HXA
3326	HXL	HollandExel   	Netherlands	HXL
3327	HY	Uzbekistan Airways	Uzbekistan	HY
3328	HZ	Sakhalinskie Aviatrassy	Russian Federation	HZ
3329	HZA	Horizon Airlines   	Australia	HZA
3330	I2	Iberia Express	Spain	I2
3331	I3	Ata Airlines	Iran Islamic Republic of	I3
3332	I4	Scott Air LLC	USA	I4
3333	I5	Air Mali	Mali	I5
3334	I6	Air Indus (pvt.) Ltd.	Pakistan	I6
3335	I7	Paramount Airways	India	I7
3336	I8	Izhavia	Russian Federation	I8
3337	I9	Air Italy	Italy	I9
3338	IA	Iraqi Airways	Iraq	IA
3339	IAW	Iraqi Airways	Iraq	IAW
3340	IB	Iberia	Spain	IB
3341	IBB	Binter Canarias     	Spain	IBB
3342	IBT	Ibertrans   	Spain	IBT
3343	IC	Indian Airlines	India	IC
3344	ICD	Icaro	Ecuador	ICD
3345	ICL	Cargo Air Lines     	Israel	ICL
3346	ICN	Inter-Canadien   	Canada	ICN
3347	ID	Batik Air	Indonesia	ID
3348	IDO	Airmax	USA	IDO
3349	IE	Solomon Airlines	Solomon Islands	IE
3350	IE1	SkyAirWorld	Australia	IE1
3351	IE2	Strategic Alliance of Australia	Australia	IE2
3352	IF	Islas Airways	Spain	IF
3353	IFS	Italy First   	Italy	IFS
3354	IG	Meridiana fly S.p.A.	Italy	IG
3355	IGA	SkyTaxi	Poland	IGA
3356	IH	Irtysh-Air	Kazakhstan	IH
3357	II	IBC Airways	USA	II
3358	IIO	IBC Airways	USA	IIO
3359	IJ	Great Wall Airlines	China	IJ
3360	IK	Kaya Airlines	Mozambique	IK
3361	IKM	Starbow Airlines	Ghana	IKM
3362	IL	PT Trigana Air	Indonesia	IL
3363	IM	menaJet	United Arab Emirates	IM
3364	IN	InvestAvia	Kazakhstan	IN
3365	INX	Inter Airlines	Turkey	INX
3366	IO	IrAero	Russian Federation	IO
3367	IOS	Isles of Scilly Skybus	United Kingdom	IOS
3368	IP	Orbest	Spain	IP
3369	IQ	Augsburg Airways   	Germany	IQ
3370	IR	Iran Air	Iran Islamic Republic of	IR
3371	IRB	Iran Air Tours     	Iran Islamic Republic of	IRB
3372	IRO	CSA Air   	USA	IRO
3373	IRS	Asia Sahand Airlines	Iran Islamic Republic of	IRS
3374	IRY	Eram Airlines	Iran Islamic Republic of	IRY
3375	IS	Island Airlines, Inc.	USA	IS
3376	IT	Kingfisher Airlines	India	IT
3377	IU	Ibis Airlines	Australia	IU
3378	IV	Wind Jet	Italy	IV
3379	IV1	BerlinJet   	Germany	IV1
3380	IW	Wings Air	Indonesia	IW
3381	IWD	Iberworld   	Spain	IWD
3382	IX	Air India Express	India	IX
3383	IY	Yemenia Yemen Airways	Yemen	IY
3384	IZ	Arkia - Israeli Airlines	Israel	IZ
3385	IZA	Izhavia	Russian Federation	IZA
3386	J0	Jetlink Express	Kenya	J0
3387	J1	Primair	USA	J1
3388	J2	Azerbaijan Airlines	Azerbaijan	J2
3389	J3	Northwestern Air Lease Ltd.	Canada	J3
3390	J4	Badr Airlines	Sudan	J4
3391	J5	Alaska Seaplane Service L.L.C.	USA	J5
3392	J6	Jamaica Air Shuttle	Jamaica	J6
3393	J7	Centre-Avia Airlines	Russian Federation	J7
3394	J8	Berjaya Air	Malaysia	J8
3395	J9	Jazeera Airways	Kuwait	J9
3396	JA	BH Airlines	Bosnia and Herzegovina	JA
3397	JAF	Jetairfly	Belgium	JAF
3398	JAO	Bankair, Inc. (US)	USA	JAO
3399	JAZ	Japan Air Charter     	Japan	JAZ
3400	JB	Helijet International Inc	Canada	JB
3401	JC	JAL Express	Japan	JC
3402	JD	Beijing Capital Airlines	China	JD
3403	JE	Mango	South Africa	JE
3404	JEA	Jet Air Ltd.	Poland	JEA
3405	JF	L.A.B Flying Services	USA	JF
3406	JG	JetGo Australia	Australia	JG
3407	JH	Fuji Dream Airlines	Japan	JH
3408	JHM	JHM Cargo Airlines   	Costa Rica	JHM
3409	JHO	Amerijet International, Inc.	USA	JHO
3410	JI	Jade Cargo International	China	JI
3411	JIA	PSA Airlines   	USA	JIA
3412	JJ	TAM Linhas Aereas	Brazil	JJ
3413	JK	Spanair	Spain	JK
3414	JK1	Orionair	Spain	JK1
3415	JK2	Pronair	Spain	JK2
3416	JL	Japan Airlines	Japan	JL
3417	JL1	J-Air   	Japan	JL1
3418	JLJ	Japan Airlines Domestic   	Japan	JLJ
3419	JM	Air Jamaica	Jamaica	JM
3420	JM1	Air Jamaica Express   	Jamaica	JM1
3421	JM2	Eastern Caribbean Express   	Saint Lucia	JM2
3422	JMX	Air Jamaica Express	Jamaica	JMX
3423	JN	Livingston Air	Italy	JN
3424	JO	Jalways	Japan	JO
3425	JOR	Blue Air	Romania	JOR
3426	JP	Adria Airways	Slovenia	JP
3427	JQ	Jetstar Airways	Australia	JQ
3428	JR	Joy Air	China	JR
3429	JS	Air Koryo	Korea Democratic People's Republic of	JS
3430	JT	Lion Air	Indonesia	JT
3431	JT1	Wing Air   	Indonesia	JT1
3432	JTG	JetTime	Denmark	JTG
3433	JTO	Transair	Australia	JTO
3434	JU	Air Serbia	Serbia	JU
3435	JUS	USA Jet Airlines   	USA	JUS
3436	JV	Bearskin Lake Air Services LP	Canada	JV
3437	JW	Vanilla Air	Japan	JW
3438	JWO	Arrow Air	USA	JWO
3439	JX	Jett8 Airlines Cargo	Singapore	JX
3440	JY	Air Turks & Caicos	Turks and Caicos Islands	JY
3441	JZ	Skyways	Sweden	JZ
3442	K2	Eurolot	Poland	K2
3443	K3	Taquan Air Services	USA	K3
3444	K31	Air One     	USA	K31
3445	K4	Kalitta Air	USA	K4
3446	K5	Wings Of Alaska Seaport Airline	USA	K5
3447	K6	Cambodia Angkor Air	Cambodia	K6
3448	K7	Air KBZ	Myanmar	K7
3449	K8	Kan Air	Thailand	K8
3450	K9	TonleSap Airlines	Cambodia	K9
3451	KA	Dragonair	Hong Kong (sar) China	KA
3452	KAE	Kartika Airlines	Indonesia	KAE
3453	KB	Druk Air	Bhutan	KB
3454	KBR	Koral Blue	Egypt	KBR
3455	KC	Air Astana	Kazakhstan	KC
3456	KD	Kalstar Aviation	Indonesia	KD
3457	KDA	Kendell Airlines   	Australia	KDA
3458	KDR	Royal Daisy Airlines	Uganda	KDR
3459	KE	Korean Air	Korea Republic of	KE
3460	KEA	Kalahari Express Airlines   	Namibia	KEA
3461	KF	Blue1	Finland	KF
3462	KF1	Katmai Air Taxi   	USA	KF1
3463	KFA	Kelowna Flightcraft	Canada	KFA
3464	KFL	Kenya Flamingo Airlines	Kenya	KFL
3465	KG	Aerogaviota	Cuba	KG
3466	KGA	Kyrghyzstan Airlines   	Kyrgyzstan	KGA
3467	KGC	Peach Air     	United Kingdom	KGC
3468	KH	Aloha Air Cargo	USA	KH
3469	KHO	Aircompany Khors	Ukraine	KHO
3470	KI	Adam Air	Indonesia	KI
3471	KIS	Contactair   	Germany	KIS
3472	KJ	Air Incheon	Korea Republic of	KJ
3473	KJI	Kaiken Lineas Aereas     	Argentina	KJI
3474	KK	Atlasjet Airlines	Turkey	KK
3475	KL	KLM-Royal Dutch Airlines	Netherlands	KL
3476	KL1	KLM Cargo Airlines   	Netherlands	KL1
3477	KL2	NS - Dutch Railways   	Netherlands	KL2
3478	KL3	Thalys International	Belgium	KL3
3479	KLS	Kalstar Aviation	Indonesia	KLS
3480	KM	Air Malta	Malta	KM
3481	KMV	Komiinteravia	Russian Federation	KMV
3482	KN	China United Airlines	China	KN
3483	KND	Kan Air	Thailand	KND
3484	KNE	NAS Air - National Air Service	Saudi Arabia	KNE
3485	KNO	Winnport Air Cargo	Canada	KNO
3486	KNX	Knighthawk Air Express   	Canada	KNX
3487	KO	Aircompany Khors	Ukraine	KO
3488	KP	ASKY Airlines	Togo	KP
3489	KQ	Kenya Airways	Kenya	KQ
3490	KQ1	Aircraft Leasing Services   	Kenya	KQ1
3491	KR	Air Bishkek	Kyrgyzstan	KR
3492	KRO	Kitty Hawk Air Cargo, Inc.	USA	KRO
3493	KS	Penair	USA	KS
3494	KT	Katmai Air LLC	USA	KT
3495	KTS	Kotlas Air Enterprises	Russian Federation	KTS
3496	KU	Kuwait Airways	Kuwait	KU
3497	KV	Asian Air Express	Tajikistan	KV
3498	KW	Wataniya Airways	Kuwait	KW
3499	KX	Cayman Airways	Cayman Islands	KX
3500	KY	Kunming Airlines	China	KY
3501	KYV	Kibris Turkish Airlines	Turkey	KYV
3502	KZ	Nippon Cargo Airlines	Japan	KZ
3503	KZO	Nippon Cargo Airlines	Japan	KZO
3504	L2	Lynden Air Cargo	USA	L2
3505	L21	Lynden Air Cargo                       	USA	L21
3506	L3	DHL de Guatemala, S.A.	Guatemala	L3
3507	L4	Air Liaison	Canada	L4
3508	L41	Liaison	Canada	L41
3509	L5	LAC Linea Aerea Cuencana	Ecuador	L5
3510	L6	Mauritanian Airlines International	Mauritania	L6
3511	L7	Linea Aerea Carguera de Colombia S.A.	Colombia	L7
3512	L8	Equaflight Gabon	Gabon	L8
3513	L9	Belle Air Europe	Italy	L9
3514	LA	Lan Airlines	Chile	LA
3515	LA1	LAN Peru     	Peru	LA1
3516	LAL	Labrador Airways   	Canada	LAL
3517	LAU	Lineas Aereas Suramericanas   	Colombia	LAU
3518	LB	Lloyd Aereo Boliviano	Bolivia	LB
3519	LC	ECAIR	Congo	LC
3520	LCO	LAC-Lineas Aereas Del Caribe Sa	Colombia	LCO
3521	LD	AHK Air Hong Kong	Hong Kong (sar) China	LD
3522	LDE	Lineas Aereas del Estado	Argentina	LDE
3523	LDI	Lauda Air SpA     	Italy	LDI
3524	LDO	AHK Air Hong Kong	Hong Kong	LDO
3525	LE	Laparkan Airways	USA	LE
3526	LEO	Leopair     	Switzerland	LEO
3527	LF	Lao Central Airlines	Lao People's Democratic Republic	LF
3528	LFA	Air Alfa   	Turkey	LFA
3529	LFM	AirLift Service	Macedonia Former Yugoslav Republic of	LFM
3530	LFO	Lufthansa Cargo India	India	LFO
3531	LG	Luxair	Luxembourg	LG
3532	LG1	Conseta-Cirrus   	Germany	LG1
3533	LG2	Luxair Commuter   	Luxembourg	LG2
3534	LG3	Luxair Executive   	Luxembourg	LG3
3535	LH	Lufthansa German Airlines	Germany	LH
3536	LH1	Lufthansa Leasing   	Germany	LH1
3537	LH2	SABTCO - Saudi Bahraini Transport Co	Bahrain	LH2
3538	LH3	DLH Bus Services	Germany	LH3
3539	LH4	Eberhardt Travel	Germany	LH4
3540	LH5	Lufthansa Italia	Italy	LH5
3541	LHN	Express One International   	USA	LHN
3542	LI	LIAT (1974)	Antigua and Barbuda, Leeward Islands	LI
3543	LIN	Linair   	Hungary	LIN
3544	LIS	Eastern Express	Kazakhstan	LIS
3545	LJ	Jin Air	Korea Republic of	LJ
3546	LK	Kyrgyz Airlines	Kyrgyzstan	LK
3547	LKE	Lucky Air Co. Ltd.	China	LKE
3548	LKO	Link America	USA	LKO
3549	LKY	Air Solutions	USA	LKY
3550	LL	Lineas Aereas Allegro, S.A. de C.V.   	Mexico	LL
3551	LLM	Yamal Airlines	Russian Federation	LLM
3552	LM	Loganair	United Kingdom	LM
3553	LN	Libyan Airlines	Libya	LN
3554	LNQ	Varsity Express	United Kingdom	LNQ
3555	LNS	Lionair   	Sri Lanka	LNS
3556	LO	LOT - Polish Airlines	Poland	LO
3557	LO1	EuroLOT   	Poland	LO1
3558	LO2	Aeropromocja   	Poland	LO2
3559	LO3	Mistral Bus Company   	Poland	LO3
3560	LO4	Jet Air Ltd.   	Poland	LO4
3561	LOG	Loganair	United Kingdom	LOG
3562	LP	Lan Peru	Peru	LP
3563	LPU	Virgin Express France     	France	LPU
3564	LPV	Air Alps Aviation     	Austria	LPV
3565	LQ	Skynet Asia Awys	Japan	LQ
3566	LR	LACSA-Lineas Aereas Costarricenses	Costa Rica	LR
3567	LRS	Servicios Aereos Nacionales S.A.(SANSA)	Costa Rica	LRS
3568	LRT	Airlines Of South Australia   	Australia	LRT
3569	LS	Jet2.com	United Kingdom	LS
3570	LS1	Jet2   	United Kingdom	LS1
3571	LSK	Aurela	Lithuania	LSK
3572	LSO	Channel Express	United Kingdom	LSO
3573	LT	Air Lituanica	Lithuania	LT
3574	LTE	LTE International Airways   	Spain	LTE
3575	LTR	Lufttransport A/S   	Norway	LTR
3576	LU	LanExpress	Chile	LU
3577	LV	Mega Global Air Services (Maldives)	Maldives	LV
3578	LVG	Livingston	Italy	LVG
3579	LW	Pacific Wings	USA	LW
3580	LW1	Pacific Wings                          	USA	LW1
3581	LW2	New Mexico Airlines	USA	LW2
3582	LW3	PW Express	USA	LW3
3583	LW4	Georgiaskies	USA	LW4
3584	LW5	TennesseeSkies/KentuckySkies/GeorgiaSki	USA	LW5
3585	LWA	Liberia World Airlines     	Liberia	LWA
3586	LX	Swiss/Crossair	Switzerland	LX
3587	LX1	Swiss European Air Lines   	Switzerland	LX1
3588	LX2	Skyport International Inc.	Canada	LX2
3589	LXF	LynxAir International	USA	LXF
3590	LXR	Air Luxor     	Portugal	LXR
3591	LY	El Al Israel Airlines	Israel	LY
3592	LYD	Lydd Air	United Kingdom	LYD
3593	LYN	Kyrgyzstan	Kyrgyzstan	LYN
3594	LZ	Belle Air	Albania	LZ
3595	M0	AeroMongolia	Mongolia	M0
3596	M2	Mahfooz Aviation (gambia) Ltd	Gambia	M2
3597	M3	Air Norway/north Flying	Denmark	M3
3598	M4	Smart Aviation Company	Egypt	M4
3599	M5	Kenmore Air	USA	M5
3600	M6	Amerijet International, Inc.	USA	M6
3601	M7	Marsland Aviation	Sudan	M7
3602	M8	AirMax Cargo S.A	Peru	M8
3603	M9	Motor Sich PJSC	Ukraine	M9
3604	MA	MALEV Hungarian Airlines	Hungary	MA
3605	MA1	Malev Express   	Hungary	MA1
3606	MAI	Mauritanian Airlines International	Mauritania	MAI
3607	MAL	Morningstar Air Express   	Canada	MAL
3608	MAX	Air Liaison	Canada	MAX
3609	MB	MNG Airlines Cargo	Turkey	MB
3610	MCA	MCA Airlines Sweden AB	Sweden	MCA
3611	MCS	Macedonian Airlines   	Greece	MCS
3612	MD	Air Madagascar	Madagascar	MD
3613	MDA	MD Icelandic Airlines   	Iceland	MDA
3614	MDC	Mid-Atlantic Freight   	USA	MDC
3615	MDL	Mandala Airlines	Indonesia	MDL
3616	MDM	Med Avia   	Malta	MDM
3617	MDS	Med Airlines   	Italy	MDS
3618	MDZ	Mid Airlines   	Zimbabwe	MDZ
3619	ME	Middle East Airlines	Lebanon	ME
3620	MEH	Malev Express	Hungary	MEH
3621	MEI	Merlin Airways   	USA	MEI
3622	MF	Xiamen Airlines Company	China	MF
3623	MFZ	Mofaz Air   	Malaysia	MFZ
3624	MG	Midex Airlines	United Arab Emirates	MG
3625	MGD	Northern-East Cargo Airlines     	Russian Federation	MGD
3626	MGO	Mediterranean Air Service	Tunisia	MGO
3627	MH	Malaysia Airlines	Malaysia	MH
3628	MH1	MASWings	Malaysia	MH1
3629	MI	SilkAir	Singapore	MI
3630	MIW	Airborne of Sweden   	Sweden	MIW
3631	MJ	Mihin Lanka	Sri Lanka	MJ
3632	MK	Air Mauritius	Mauritius	MK
3633	MKA	MK Airlines   	Ghana	MKA
3634	MKI	MK Flugfelagid   	Iceland	MKI
3635	MKL	McCall Air	USA	MKL
3636	ML	Air Mediterranee	France	ML
3637	MLW	MeeladAir S.A.	Greece	MLW
3638	MM	Peach Aviation Limited	Japan	MM
3639	MMZ	Euroatlantic Airways	Portugal	MMZ
3640	MN	Comair	South Africa	MN
3641	MN1	Kulula   	South Africa	MN1
3642	MNA	Merpati Nusantara Airlines	Indonesia	MNA
3643	MNG	AeroMongolia	Mongolia	MNG
3644	MNK	Metavia Airlines   	South Africa	MNK
3645	MNL	Miniliner   	Italy	MNL
3646	MNT	Flymontserrat	Montserrat, Leeward Islands	MNT
3647	MO	Calm Air Intl Ltd	Canada	MO
3648	MON	Monarch Charter	United Kingdom	MON
3649	MP	Martinair Holland	Netherlands	MP
3650	MPD	Air Plus Comet   	Spain	MPD
3651	MPJ	mapjet	Austria	MPJ
3652	MPR	Skyline   	Nigeria	MPR
3653	MPX	Aeromexpress	Mexico	MPX
3654	MQ	American Eagle   	USA	MQ
3655	MR	Mongolian Airlines Group	Mongolia	MR
3656	MRA	Martinaire   	USA	MRA
3657	MS	Egyptair	Egypt	MS
3658	MSA	Mistral Air   	Italy	MSA
3659	MSC	Moscow Airways     	Russian Federation	MSC
3660	MSE	Egyptair Express	Egypt	MSE
3661	MST	Master Top Linhas Aereas S/A	Brazil	MST
3662	MSW	Master Airways	Serbia	MSW
3663	MT	Thomas Cook Airlines of Manchester	United Kingdom	MT
3664	MTC	Minerva Airlines   	Italy	MTC
3665	MTN	Mountain Air Cargo   	USA	MTN
3666	MTQ	Societe Martinique Aeronautique   	Martinique	MTQ
3667	MU	China Eastern Airlines	China	MU
3668	MU1	China Eastern-Jiangsu   	China	MU1
3669	MU2	China Eastern-Quilu   	China	MU2
3670	MUG	Muk Air Ghana     	Ghana	MUG
3671	MV	PT Aviastar Mandiri	Indonesia	MV
3672	MVL	Magadan Airlines	Russian Federation	MVL
3673	MW	Mokulele Airlines	USA	MW
3674	MX	Mexicana de Aviacion	Mexico	MX
3675	MX1	Mexicana Inter	Mexico	MX1
3676	MX2	Mexicana Link	Mexico	MX2
3677	MY	Maya Island Air	Belize	MY
3678	MYO	Aerotransportes Mas De Carga	Mexico	MYO
3679	MYT	MyTravel Airways	United Kingdom	MYT
3680	MZ	Saereo S.A	Ecuador	MZ
3681	MZA	Irtysh-Air	Kazakhstan	MZA
3682	N2	Trans Mediterranean Airways	Lebanon	N2
3683	N3	Aerolineas MAS	Dominican Republic	N3
3684	N4	Trans Air Benin	Benin	N4
3685	N5	Norfolk Air	Norfolk Island	N5
3686	N6	Alpine Air Private Ltd.	Nepal	N6
3687	N61	Cardinal Airlines   	USA	N61
3688	N7	NHT Linhas Aereas	Brazil	N7
3689	N8	National Airlines	USA	N8
3690	N9	Kabo Air	Nigeria	N9
3691	NA	North American Airlines	USA	NA
3692	NAL	Nakanihon Airline   	Japan	NAL
3693	NAO	North American Airlines	USA	NAO
3694	NAW	Newair   	Denmark	NAW
3695	NB	Sterling	Denmark	NB
3696	NC	Northern Air Cargo, Inc.	USA	NC
3697	NC1	Norfolk Express   	Australia	NC1
3698	NCH	Chanchangi Airlines	Nigeria	NCH
3699	NCN	National Airlines     	Chile	NCN
3700	NCO	Northern Air Cargo, Inc.	USA	NCO
3701	ND	Sky Wings Airlines	Greece	ND
3702	NE	SkyEurope	Slovakia	NE
3703	NF	Air Vanuatu	Vanuatu	NF
3704	NF1	Vanair   	Vanuatu	NF1
3705	NG	Lauda Air   	Austria	NG
3706	NGK	Oriental Air Bridge Co., Ltd. (ORC)	Japan	NGK
3707	NH	All Nippon Airways	Japan	NH
3708	NH1	Air Japan   	Japan	NH1
3709	NH2	ANA Wings	Japan	NH2
3710	NHG	NHT Linhas Aereas	Brazil	NHG
3711	NI	Portugalia	Portugal	NI
3712	NIG	Aerocontractors	Nigeria	NIG
3713	NIS	Nicaraguense de Aviacion   	Nicaragua	NIS
3714	NJ	Vanguard Airlines	USA	NJ
3715	NK	Spirit Airlines	USA	NK
3716	NL	Shaheen Air International	Pakistan	NL
3717	NLE	Boston-Maine Airways   	USA	NLE
3718	NM	Manx2	United Kingdom	NM
3719	NMA	Tasman Pacific Airlines   	New Zealand	NMA
3720	NN	VIM Airlines	Russian Federation	NN
3721	NO	NEOS S.P.A.	Italy	NO
3722	NOS	NEOS   	Italy	NOS
3723	NP	Nile Air	Egypt	NP
3724	NPO	Heavylift Cargo Airlines   	United Kingdom	NPO
3725	NQ	Air Japan	Japan	NQ
3726	NR	Max Air	Nigeria	NR
3727	NRO	Russ Air Transport Company	Russian Federation	NRO
3728	NS	Hebei Airlines	China	NS
3729	NSE	SATENA	Colombia	NSE
3730	NT	Binter Canarias	Spain	NT
3731	NT1	Canarias Airlines	Spain	NT1
3732	NTA	Northern Thunderbird	Canada	NTA
3733	NTI	Aerocontinente Chile S.A.   	Chile	NTI
3734	NTR	TNT Express Europe   	United Kingdom	NTR
3735	NU	Japan Transocean Air	Japan	NU
3736	NV	Iranian Naft Airlines	Iran Islamic Republic of	NV
3737	NV1	Air Tindi Ltd                          	Canada	NV1
3738	NW	Northwest Airlines	USA	NW
3739	NW1	Northwest Airlink   	USA	NW1
3740	NX	Air Macau	Macao (sar) China	NX
3741	NXA	Air Next	Japan	NXA
3742	NY	Air Iceland	Iceland	NY
3743	NYH	New York Helicopter     	USA	NYH
3744	NYS	Ulendo Airlink	Malawi	NYS
3745	NZ	Air New Zealand	New Zealand	NZ
3746	NZ1	Air National   	New Zealand	NZ1
3747	NZ2	Airwork (NZ)   	New Zealand	NZ2
3748	NZ3	Vincent Aviation Ltd.   	New Zealand	NZ3
3749	NZ4	Zeal320 Limited	New Zealand	NZ4
3750	NZL	Air New Zealand Link   	New Zealand	NZL
3751	NZM	Mount Cook Airlines   	New Zealand	NZM
3752	O2	Jet Air	Poland	O2
3753	O3	SF Airlines	China	O3
3754	O4	Antrak Air	Ghana	O4
3755	O5	Comores Aviation International	Comoros	O5
3756	O6	OceanAir	Brazil	O6
3757	O7	Eznis Airways	Mongolia	O7
3758	O8	Axis Lines	Cameroon	O8
3759	O81	Elite Aviation L.L.C.	United Arab Emirates	O81
3760	O9	Nova Airways	Sudan	O9
3761	OA	Olympic Air	Greece	OA
3762	OA1	Macedonian Airlines     	Greece	OA1
3763	OAE	Omni Air International	USA	OAE
3764	OAI	Tor Air	Sweden	OAI
3765	OAW	Helvetic Airways	Switzerland	OAW
3766	OB	Boliviana de Aviacion - BoA	Bolivia	OB
3767	OBS	Orbest	Portugal	OBS
3768	OC	Oriental Air Bridge Co., Ltd. (ORC)	Japan	OC
3769	OD	Malindo Airways	Malaysia	OD
3770	OE	Cairo Aviation	Egypt	OE
3771	OF	Air Finland	Finland	OF
3772	OG	Air Onix	Ukraine	OG
3773	OH	Comair Inc   	USA	OH
3774	OI	Okapi Airlines	Congo	OI
3775	OJ	Fly Jamaica	Jamaica	OJ
3776	OK	Czech Airlines	Czech Republic	OK
3777	OKJ	Okada Air   	Nigeria	OKJ
3778	OL	OLT Express Germany GmbH	Germany	OL
3779	OLS	Sol Lineas Aereas	Argentina	OLS
3780	OLY	Olympic Aviation   	Greece	OLY
3781	OM	MIAT - Mongolian Airlines	Mongolia	OM
3782	ON	Our Airline	Nauru	ON
3783	ONT	Air Ontario     	Canada	ONT
3784	ONX	Air Onix	Ukraine	ONX
3785	OO	SkyWest Airlines   	USA	OO
3786	OP	Olympic Airlines	Greece	OP
3787	OP2	Chalk's Express	USA	OP2
3788	OP3	Island Express Airline	USA	OP3
3789	OPN	Air Open Sky   	France	OPN
3790	OPS	Seawings	United Arab Emirates	OPS
3791	OQ	Scoot	Singapore	OQ
3792	OR	Arkefly	Netherlands	OR
3793	ORI	Orion Air	Singapore	ORI
3794	ORT	Orient Avia   	Russian Federation	ORT
3795	OS	Austrian Airlines AG dba Austrian	Austria	OS
3796	OS1	Greyhound Canada   	Canada	OS1
3797	OS2	Central Connect Airlines   	Czech Republic	OS2
3798	OT	Aeropelican Air Services	Australia	OT
3799	OU	Croatia Airlines	Croatia	OU
3800	OV	Estonian Air	Estonia	OV
3801	OV1	Estonian Air Regional	Estonia	OV1
3802	OVA	Aero Nova	Spain	OVA
3803	OW	Executive Airlines, Inc.	USA	OW
3804	OX	Orient Thai Airlines	Thailand	OX
3805	OXO	Millon Air	USA	OXO
3806	OY	Andes Lineas Aereas	Argentina	OY
3807	OZ	Asiana Airlines	Korea Republic of	OZ
3808	P0	Proflight Commuter Services	South Africa	P0
3809	P1	PublicCharters.com	USA	P1
3810	P11	Charter Air Transport, Inc.	USA	P11
3811	P12	Ultimate Jetcharters	USA	P12
3812	P13	Aerodynamics	USA	P13
3813	P2	AirKenya Express	Kenya	P2
3814	P3	Passaredo	Brazil	P3
3815	P4	Aero Lineas Sosa	Honduras	P4
3816	P5	AeroRepublica	Colombia	P5
3817	P6	Pascan Aviation Inc.	Canada	P6
3818	P7	Palau Airways	Palau	P7
3819	P8	Air Mekong	Viet Nam	P8
3820	P9	Peruvian Airlines	Peru	P9
3821	PA	Airblue	Pakistan	PA
3822	PAO	Polynesian Airlines	Samoa	PAO
3823	PAQ	Pacific Air Express	Solomon Islands	PAQ
3824	PAY	Aerolineas Paraguayas ARPA   	Paraguay	PAY
3825	PB	Provincial Airlines	Canada	PB
3826	PB1	Innu Mikun Airlines   	Canada	PB1
3827	PBI	Virgin Australia Airlines (NZ)	New Zealand	PBI
3828	PBL	Polynesian Blue	Samoa	PBL
3829	PBU	Air Burundi     	Burundi	PBU
3830	PC	Pegasus Airlines	Turkey	PC
3831	PC1	Airlines Tonga	Tonga	PC1
3832	PCM	Westair Industries   	USA	PCM
3833	PCT	Peace Air Togo     	Togo	PCT
3834	PD	Porter Airlines Inc.	Canada	PD
3835	PD1	Trillium Air   	Canada	PD1
3836	PD2	Trillium Air     	Canada	PD2
3837	PDI	MidAtlantic Airways   	USA	PDI
3838	PDS	Pace Airlines   	USA	PDS
3839	PDT	Piedmont Southern Airways	USA	PDT
3840	PE	Peoples Vienna Line	Austria	PE
3841	PE1	Wind Jet   	Italy	PE1
3842	PEA	Pan Europeenne Air Service	France	PEA
3843	PEC	Pacific East Asia Cargo     	Philippines	PEC
3844	PEG	Pelangi Air   	Malaysia	PEG
3845	PEL	Aeropelican   	Australia	PEL
3846	PEX	Pelican Express     	USA	PEX
3847	PF	Primera Air Scandinavia	Denmark	PF
3848	PFZ	Proflight Commuter Services	South Africa	PFZ
3849	PG	Bangkok Airways	Thailand	PG
3850	PG1	Siem Reap Airlines   	Cambodia	PG1
3851	PG2	Krungthep Limousine	Thailand	PG2
3852	PGA	Portugalia	Portugal	PGA
3853	PGC	Thai Cargo Airline	Thailand	PGC
3854	PGP	Perm Airlines	Russian Federation	PGP
3855	PH	transavia Denmark	Denmark	PH
3856	PHG	Phoenix Aviation   	United Arab Emirates	PHG
3857	PHM	Petroleum Helicopters   	USA	PHM
3858	PI	Polar Airlines Ltd	Russian Federation	PI
3859	PIC	Jetstar Pacific Airlines	Viet Nam	PIC
3860	PIR	Pamir Airways	Afghanistan	PIR
3861	PJ	Air Saint-Pierre	Saint Pierre and Miquelon	PJ
3862	PK	Pakistan International Airlines	Pakistan	PK
3863	PK1	PIA Express	Pakistan	PK1
3864	PL	Southern Air Charter	Bahamas	PL
3865	PLK	Air Pulkovo     	Russian Federation	PLK
3866	PLR	Northwestern Air Lease Ltd.            	Canada	PLR
3867	PLZ	Planet Airways   	USA	PLZ
3868	PM	CANARY FLY	Spain	PM
3869	PN	China West Air	China	PN
3870	PNP	Pineapple Air	Bahamas	PNP
3871	PNR	Pan Air Lineas Aereas   	Spain	PNR
3872	PO	Polar Air Cargo	USA	PO
3873	PP	Jet Aviation Business Jets AG	Switzerland	PP
3874	PQ	AirAsia Philippines	Philippines	PQ
3875	PQO	Tashkent Aircraft Production Corp	Uzbekistan	PQO
3876	PR	Philippine Airlines	Philippines	PR
3877	PRO	Propair   	Canada	PRO
3878	PS	Ukraine International Airlines	Ukraine	PS
3879	PST	Air Panama	Panama	PST
3880	PT	Peach Aviation Limited	Japan	PT
3881	PTB	Passaredo Transportes Aereos	Brazil	PTB
3882	PTF	Prest'affair   	France	PTF
3883	PTI	Privatair   	Switzerland	PTI
3884	PTU	Europe Air Charter   	Luxembourg	PTU
3885	PU	Pluna	Uruguay	PU
3886	PU1	COT Bus Company	Uruguay	PU1
3887	PV	Saint Barth Commuter	Guadeloupe	PV
3888	PVG	Privilege	Spain	PVG
3889	PW	Precisionair	Tanzania United Republic of	PW
3890	PX	Air Niugini	Papua New Guinea	PX
3891	PXA	Pan Am World Airways                   	USA	PXA
3892	PXS	Boston-Maine Airways   	USA	PXS
3893	PY	Surinam Airways	Suriname	PY
3894	PZ	Transportes Aereos Del Mercosur	Paraguay	PZ
3895	Q0	Quebecair Express	Canada	Q0
3896	Q2	Maldivian	Maldives	Q2
3897	Q3	Anguilla Air Services	Anguilla, Leeward Islands	Q3
3898	Q4	Starlink Aviation	Canada	Q4
3899	Q5	40 Mile Air	USA	Q5
3900	Q6	Skytrans	Australia	Q6
3901	Q7	Skybahamas	Bahamas	Q7
3902	Q8	Trans Air Congo	Congo	Q8
3903	Q9	Sky Jet M.G. Inc	Canada	Q9
3904	QA	Cimber A/S	Denmark	QA
3905	QB	Faraz Qeshm Airline	Iran Islamic Republic of	QB
3906	QC	Camair-Co	Cameroon	QC
3907	QD	Air Class Lineas Aereas	Uruguay	QD
3908	QDO	Qwestair	Australia	QDO
3909	QE	Crossair Europe	France	QE
3910	QF	Qantas Airways	Australia	QF
3911	QF1	Eastern Australia Airlines   	Australia	QF1
3912	QF2	Asian-Australian Airlines   	Australia	QF2
3913	QF3	Sunstate Airlines   	Australia	QF3
3914	QF4	Impulse Airlines   	Australia	QF4
3915	QF5	Jetconnect   	New Zealand	QF5
3916	QF6	Great Southern Railway   	Australia	QF6
3917	QF7	Airlink   	Australia	QF7
3918	QFA	Southern Australia Airlines   	Australia	QFA
3919	QG	Citilink Indonesia	Indonesia	QG
3920	QH	Kyrgyzstan	Kyrgyzstan	QH
3921	QI	Cimber Sterling	Denmark	QI
3922	QI1	Cimber Air GmbH   	Germany	QI1
3923	QI2	Tor Air AB	Sweden	QI2
3924	QI3	Primera Air	Sweden	QI3
3925	QJ	Jet Airways Inc.	USA	QJ
3926	QJO	Jet Airways Inc.	USA	QJO
3927	QK	Air Canada Jazz   	Canada	QK
3928	QL	LASER Airlines	Venezuela	QL
3929	QLA	Aviation Quebec Labrador     	Canada	QLA
3930	QM	Air Malawi	Malawi	QM
3931	QN	Air Armenia	Armenia	QN
3932	QNZ	Jetconnect   	New Zealand	QNZ
3933	QO	Aeromexpress	Mexico	QO
3934	QOO	Aeromexpress	Mexico	QOO
3935	QP	Starlight Airlines	United Arab Emirates	QP
3936	QQ	Alliance Airlines	Australia	QQ
3937	QQA	Alliance Airlines Pty. Ltd.   	Australia	QQA
3938	QR	Qatar Airways	Qatar	QR
3939	QS	SmartWings	Czech Republic	QS
3940	QS1	Travel Service Slovakia	Slovakia	QS1
3941	QSC	African Safari Airways	Switzerland	QSC
3942	QT	Tampa Airlines Cargo	Colombia	QT
3943	QTO	Tampa Airlines Cargo	Colombia	QTO
3944	QU	Utair-ukraine	Ukraine	QU
3945	QV	Lao Airlines	Lao People's Democratic Republic	QV
3946	QW	Blue Wings	Germany	QW
3947	QWA	Pel-Air   	Australia	QWA
3948	QX	Horizon Air   	USA	QX
3949	QY	European Air Transport Leipzig GmbH	Germany	QY
3950	QZ	Indonesia AirAsia	Indonesia	QZ
3951	R0	Royal Airlines	Pakistan	R0
3952	R2	ORENAIR	Russian Federation	R2
3953	R3	Yakutia	Russian Federation	R3
3954	R4	Rus Aviation	United Arab Emirates	R4
3955	R5	Jordan Aviation	Jordan	R5
3956	R6	DOT LT	Lithuania	R6
3957	R7	ASERCA Airlines	Venezuela	R7
3958	R8	Kyrgyzstan Airlines	Kyrgyzstan	R8
3959	R9	TAF Linhas Aereas	Brazil	R9
3960	RA	Nepal Airlines Corporation	Nepal	RA
3961	RAC	Ryukyu Air Commuter   	Japan	RAC
3962	RB	Syrian Arab Airlines	Syrian Arab Republic	RB
3963	RBS	Air Bas	Belarus	RBS
3964	RC	Atlantic Airways Faroe Islands	Faroe Islands	RC
3965	RD	Ryan International Airlines	USA	RD
3966	RE	Aer Arann	Ireland Republic of	RE
3967	RES	Resortexpress   	USA	RES
3968	RF	Florida West International Airways Inc.	USA	RF
3969	RFO	Florida West	USA	RFO
3970	RG	Rotanajet Aviation	United Arab Emirates	RG
3971	RGA	Region Air   	Singapore	RGA
3972	RGN	Cygnus Air   	Spain	RGN
3973	RH	Robin Hood Aviation	Austria	RH
3974	RI	Tigerair Mandala	Indonesia	RI
3975	RIE	Ariella Airlines S.A.	Burkina Faso	RIE
3976	RIG	Riair     	Latvia	RIG
3977	RIO	Air Pac Airlines	USA	RIO
3978	RIU	Riau Air	Indonesia	RIU
3979	RJ	Royal Jordanian	Jordan	RJ
3980	RK	Region-Avia	Russian Federation	RK
3981	RK1	Air Afrique Charter     	Cote D'Ivoire	RK1
3982	RL	Royal Falcon	Jordan	RL
3983	RLA	LAR     	Romania	RLA
3984	RLK	Air Nelson   	New Zealand	RLK
3985	RLO	Air Charter Inc.	Puerto Rico	RLO
3986	RM	Regional Air (KE)	Kenya	RM
3987	RN	Paradise Air	USA	RN
3988	RNX	1time	South Africa	RNX
3989	RO	Tarom	Romania	RO
3990	ROL	Aeroel Airways     	Israel	ROL
3991	ROY	Pacific Royale Airways	Indonesia	ROY
3992	RP	Chautauqua Airlines, Inc.	USA	RP
3993	RPA	Republic Airline	USA	RPA
3994	RPX	BAC Express Airlines   	United Kingdom	RPX
3995	RQ	Kam Air	Afghanistan	RQ
3996	RQ1	Air Alps Aviation     	Austria	RQ1
3997	RR	Royal Air Force	United Kingdom	RR
3998	RRM	Jetran Air	Romania	RRM
3999	RS	Sky Regional Airlines	Canada	RS
4000	RSE	SNAS Aviation	Saudi Arabia	RSE
4001	RT	RAK Airways	United Arab Emirates	RT
4002	RTQ	Air Turquoise	France	RTQ
4003	RU	AirBridgeCargo	Russian Federation	RU
4004	RU1	Western Air   	Bahamas	RU1
4005	RUC	RUTACA   	Venezuela	RUC
4006	RV	Air Canada Rouge	Canada	RV
4007	RVL	Air Vallee	Italy	RVL
4008	RVP	Aero VIP	Portugal	RVP
4009	RW	Republic Airline	USA	RW
4010	RWA	Royal Wings	Jordan	RWA
4011	RWB	Alliance Express   	Rwanda	RWB
4012	RX	Regent Airways	Bangladesh	RX
4013	RY	PT Pacific Royale Airlines	Indonesia	RY
4014	RYJ	RYJET	Spain	RYJ
4015	RYN	Ryan International Airlines	USA	RYN
4016	RZ	SANSA Airlines	Costa Rica	RZ
4017	S0	Slok Air International	Gambia	S0
4018	S2	Jet Lite	India	S2
4019	S3	Santa Barbara Airlines C.A.	Venezuela	S3
4020	S4	Sata International	Portugal	S4
4021	S5	Shuttle America	USA	S5
4022	S6	Sun Air	Sudan	S6
4023	S7	S7 Airlines	Russian Federation	S7
4024	S8	Charlan Air	South Africa	S8
4025	S9	Starbow Airlines	Ghana	S9
4026	SA	South African Airways	South Africa	SA
4027	SA1	Million Air Charter   	South Africa	SA1
4028	SAL	Asia Alpha Airways	Kyrgyzstan	SAL
4029	SAM	SAM - Sociedad Aeronautica de Medellin	Colombia	SAM
4030	SAW	Cham Wings Airlines	Syrian Arab Republic	SAW
4031	SB	Air Caledonie International	New Caledonia	SB
4032	SBA	Sol Linhas Aereas Ltda	Brazil	SBA
4033	SBE	Sabre Airways     	United Kingdom	SBE
4034	SBO	Stabo Air   	Zambia	SBO
4035	SC	Shandong Airlines	China	SC
4036	SCH	Schreiner Airways   	Netherlands	SCH
4037	SCY	Air Scandic   	United Kingdom	SCY
4038	SD	Sudan Airways	Sudan	SD
4039	SDL	SkySouth	United Kingdom	SDL
4040	SE	XL Airways France	France	SE
4041	SEO	DAS Air     	United Kingdom	SEO
4042	SET	SAETA   	Ecuador	SET
4043	SEU	Star Airlines   	France	SEU
4044	SF	Tassili Airlines	Algeria	SF
4045	SFQ	Sahara Air Cargo	United Arab Emirates	SFQ
4046	SFR	Safair   	South Africa	SFR
4047	SG	SpiceJet	India	SG
4048	SGB	Sky King, Inc.	USA	SGB
4049	SGX	Saga Airlines	Turkey	SGX
4050	SH	Sharp Airlines	Australia	SH
4051	SHK	Shorouk Air   	Egypt	SHK
4052	SHY	Sky Airlines	Turkey	SHY
4053	SI	Blue Islands	United Kingdom	SI
4054	SI1	Air Norway 2000     	Norway	SI1
4055	SIB	Sibaviatrans	Russian Federation	SIB
4056	SJ	Sriwijaya Air	Indonesia	SJ
4057	SJA	Skyjet Aviation Uganda Ltd	Uganda	SJA
4058	SJF	Skyjet France   	France	SJF
4059	SK	SAS Scandinavian Airlines	Sweden	SK
4060	SK1	Scandinavian Airlines Commuter   	Denmark	SK1
4061	SK2	Snowflake   	Sweden	SK2
4062	SKJ	Skyjet   	Belgium	SKJ
4063	SKQ	Pearl Aviation     	Australia	SKQ
4064	SKT	Skyjet     	Belgium	SKT
4065	SKU	SK Air                                 	Slovakia	SKU
4066	SL	Thai Lion Air	Thailand	SL
4067	SLI	Aerolitoral     	Mexico	SLI
4068	SLR	Sobelair                               	Belgium	SLR
4069	SLW	Servicios Aereos Litoral               	Mexico	SLW
4070	SM	Spirit of Manila Airlines	Philippines	SM
4071	SMC	SMAC   	Indonesia	SMC
4072	SME	Smart Aviation Company	Egypt	SME
4073	SN	Brussels Airlines	Belgium	SN
4074	SNB	Sterling	Denmark	SNB
4075	SNC	Air Cargo Carriers   	USA	SNC
4076	SNJ	Skynet Asia Airways	Japan	SNJ
4077	SNP	Sun Pacific International     	USA	SNP
4078	SO	SALSA d'Haiti	Haiti	SO
4079	SOA	Skoda Engineering Air Transport     	Czech Republic	SOA
4080	SOO	Southern Air   	USA	SOO
4081	SOP	Solinair   	Slovenia	SOP
4082	SP	SATA Air Acores	Portugal	SP
4083	SQ	Singapore Airlines	Singapore	SQ
4084	SQC	SIA Cargo   	Singapore	SQC
4085	SR	Swissair	Switzerland	SR
4086	SR1	Swissair Asia   	Switzerland	SR1
4087	SR2	Swiss Federal Railways   	Switzerland	SR2
4088	SRK	Sky Work Airlines	Switzerland	SRK
4089	SRN	Sprintair SA	Poland	SRN
4090	SRO	Saereo S.A.	Ecuador	SRO
4091	SRR	Star Air   	Denmark	SRR
4092	SS	Corsair	France	SS
4093	SSQ	Sunstate Airlines   	Australia	SSQ
4094	SSV	Skyservice   	Canada	SSV
4095	ST	Germania	Germany	ST
4096	STI	Sontair   	Canada	STI
4097	STP	STP Airways	Sao Tome and Principe	STP
4098	SU	Aeroflot Russian Airlines	Russian Federation	SU
4099	SUF	Pacific Sun	Fiji	SUF
4100	SUL	TAM Express Linhas Aereas S/A   	Brazil	SUL
4101	SUW	Sunny Airways	Thailand	SUW
4102	SV	Saudi Arabian Airlines	Saudi Arabia	SV
4103	SVP	Star Aviation	India	SVP
4104	SW	Air Namibia	Namibia	SW
4105	SWI	Sunworld International Airlines   	USA	SWI
4106	SWT	Swiftair	Spain	SWT
4107	SWU	Swiss European Air Lines   	Switzerland	SWU
4108	SX	Sky Work Airlines	Switzerland	SX
4109	SXG	Sterling Transportation, Inc.	USA	SXG
4110	SXS	SunExpress     	Turkey	SXS
4111	SY	Sun Country Airlines	USA	SY
4112	SYA	Cardinal Lineas Aereas   	Argentina	SYA
4113	SYO	Southend Cargo Airlines	Zimbabwe	SYO
4114	SZ	Somon Air	Tajikistan	SZ
4115	SZL	Airlink Swaziland   	Swaziland	SZL
4116	T0	Trans American Airlines dba TACA Peru	Peru	T0
4117	T2	Trans Mediterranean Airways	Lebanon	T2
4118	T3	Eastern Airways	United Kingdom	T3
4119	T4	TRIP Linhas Aereas	Brazil	T4
4120	T5	Turkmenistan Airlines	Turkmenistan	T5
4121	T6	1time	South Africa	T6
4122	T7	Twin Jet	France	T7
4123	T8	Trans African Airlines	Mali	T8
4124	T9	Transcarga Intl Airways	Venezuela	T9
4125	TA	TACA International Airlines	El Salvador	TA
4126	TA1	TACA de Honduras	Honduras	TA1
4127	TA2	TACA Inter (Guatemala)     	Guatemala	TA2
4128	TA3	TACA Inter (Cuba)   	Cuba	TA3
4129	TAH	Air Moorea   	French Polynesia	TAH
4351	W21	Jetisfaction	Germany	W21
4130	TAM	TAM - Transportes Aereos Regionais   	Brazil	TAM
4131	TAS	Lotus Air   	Egypt	TAS
4132	TB	Jetairfly	Belgium	TB
4133	TBX	Tobago Express   	Trinidad and Tobago	TBX
4134	TC	Air Tanzania	Tanzania United Republic of	TC
4135	TCH	Trans-Charter Airlines     	Russian Federation	TCH
4136	TCN	Express.Net Airlines   	USA	TCN
4137	TCW	Thomas Cook Airlines Belgium	Belgium	TCW
4138	TCX	Thomas Cook Airlines	United Kingdom	TCX
4139	TD	Atlantis European Airways	Armenia	TD
4140	TDR	Trade Air	Croatia	TDR
4141	TDX	Tradewinds Airlines   	USA	TDX
4142	TE	SkyTaxi	Poland	TE
4143	TEC	TEA Cyprus     	Cyprus	TEC
4144	TEU	Teuto Air   	Germany	TEU
4145	TF	Malmo Aviation	Sweden	TF
4146	TFO	Thai Flying Service	Thailand	TFO
4147	TFR	Canadian Regional Airlines             	Canada	TFR
4148	TFX	Toll Aviation	Australia	TFX
4149	TG	Thai Airways International	Thailand	TG
4150	TGN	PT Trigana Air	Indonesia	TGN
4151	TH	Transmile Air	Malaysia	TH
4152	THO	Transmile Air	Malaysia	THO
4153	TI	Tailwind Airlines	Turkey	TI
4154	TIB	Trip Linhas Aereas	Brazil	TIB
4155	TII	ATI Aircompany   	Ukraine	TII
4156	TIW	Transcarga Intl Airways	Venezuela	TIW
4157	TJ	Tradewind Aviation	USA	TJ
4158	TK	Turkish Airlines	Turkey	TK
4159	TK1	Anadolujet	Turkey	TK1
4160	TL	Airnorth Regional	Australia	TL
4161	TL1	Emu Airways   	Australia	TL1
4162	TLA	TransAer International Airways     	Ireland Republic of	TLA
4163	TLO	Trans Mediterranean Airways	Lebanon	TLO
4164	TLP	Tulip Air   	Netherlands	TLP
4165	TLR	Air Libya	Libya	TLR
4166	TLX	Cargo Lion   	Luxembourg	TLX
4167	TM	LAM-Linhas Aereas De Mocambique	Mozambique	TM
4168	TMA	Trans Mediterranean Airways	Lebanon	TMA
4169	TMG	Tri Mg Airlines	Indonesia	TMG
4170	TML	Travaux Aeriens de Madagascar   	Madagascar	TML
4171	TN	Air Tahiti Nui	French Polynesia	TN
4172	TNZ	Tasman Pacific Connection   	New Zealand	TNZ
4173	TO	Transavia.com France	France	TO
4174	TOK	Airlines Of Papua New Guinea	Papua New Guinea	TOK
4175	TOL	Tolair Services   	Puerto Rico	TOL
4176	TOM	Thomson Airways	United Kingdom	TOM
4177	TOO	Trans Arabian Air Transport (SD)	Sudan	TOO
4178	TP	TAP Portugal	Portugal	TP
4179	TPA	TAMPA   	Colombia	TPA
4180	TPU	TACA Peru   	Peru	TPU
4181	TQ	Tandem Aero	Moldova Republic of	TQ
4182	TQA	Braathens Sverige     	Sweden	TQA
4183	TR	Tigerair Singapore	Singapore	TR
4184	TR1	Aerobrasil   	Brazil	TR1
4185	TRD	Trans Island Air   	Barbados	TRD
4186	TRU	Triangle Airline                       	Uganda	TRU
4187	TRZ	Transmeridian Airlines   	USA	TRZ
4188	TS	Air Transat A.T.Inc.	Canada	TS
4189	TSJ	Trast Aero	Kyrgyzstan	TSJ
4190	TSP	Transportes Aereos Inter	Guatemala	TSP
4191	TSW	TEA Switzerland     	Switzerland	TSW
4192	TT	Tigerair Australia	Australia	TT
4193	TTA	TTA	Mozambique	TTA
4194	TTL	Total Linhas Aereas   	Brazil	TTL
4195	TU	Tunisair	Tunisia	TU
4196	TUB	TUI Airlines Belgium	Belgium	TUB
4197	TUL	Tulpar Air	Russian Federation	TUL
4198	TUS	ABSA Cargo   	Brazil	TUS
4199	TV	Tibet Airlines	China	TV
4200	TV1	Virgin Express (Ireland)     	Ireland Republic of	TV1
4201	TVL	Travel Service Hungary   	Hungary	TVL
4202	TW	T'way Air	Korea Republic of	TW
4203	TWE	Transwede   	Sweden	TWE
4204	TWI	Tailwind Airlines	Turkey	TWI
4205	TX	Air Caraibes	Guadeloupe	TX
4206	TXE	Transaero Express   	Russian Federation	TXE
4207	TXP	The Expediting Co., Inc.	USA	TXP
4208	TY	Air Caledonie	New Caledonia	TY
4209	TYA	Airline Tajmyr	Russian Federation	TYA
4210	TYO	Trans-Air-Link	USA	TYO
4211	TYW	Tyrol Air Ambulance   	Austria	TYW
4212	TZ	Scoot	Singapore	TZ
4213	TZK	Tajikistan Airlines   	Tajikistan	TZK
4214	U2	Easyjet	United Kingdom	U2
4215	U3	Avies Air Company	Estonia	U3
4216	U4	Buddha Air	Nepal	U4
4217	U5	Usa 3000 Airlines	USA	U5
4218	U6	Ural Airlines	Russian Federation	U6
4219	U7	Air Uganda	Uganda	U7
4220	U8	Armavia	Armenia	U8
4221	U9	Tatarstan	Russian Federation	U9
4222	UA	United Airlines	USA	UA
4223	UA1	Ted   	USA	UA1
4224	UA2	United Express	USA	UA2
4225	UA3	Continental Connection	USA	UA3
4226	UA4	United Connection Bus	USA	UA4
4227	UA5	United Express Bus	USA	UA5
4228	UA6	Anthonys Limo   	USA	UA6
4229	UA7	SNCF Railways     	France	UA7
4230	UA8	Serendipity Bus   	USA	UA8
4231	UAC	United Air Charter                     	Zimbabwe	UAC
4232	UAL	United Express   	USA	UAL
4233	UB	Myanma Airways	Myanmar	UB
4234	UC	Lan Cargo	Chile	UC
4235	UCA	Commutair     	USA	UCA
4236	UD	Hex'Air	France	UD
4237	UDO	Fast Air Carrier, Ltda.	Chile	UDO
4238	UE	Nasair	Eritrea	UE
4239	UF	Ukrainian-mediterranean Airlines	Ukraine	UF
4240	UFS	United Feeder Services     	USA	UFS
4241	UG	Sevenair	Tunisia	UG
4242	UH	US Helicopter	USA	UH
4243	UI	Eurocypria Airlines	Cyprus	UI
4244	UJ	ALMasria Universal Airlines	Egypt	UJ
4245	UK	KLM uk	United Kingdom	UK
4246	UK1	Buzz   	United Kingdom	UK1
4247	UKT	Sky-Trek Airlines   	United Kingdom	UKT
4248	UL	Srilankan Airlines	Sri Lanka	UL
4249	UL1	SriLankan Air Taxi   	Sri Lanka	UL1
4250	ULA	Zuliana de Aviacion     	Venezuela	ULA
4251	UM	Air Zimbabwe	Zimbabwe	UM
4252	UN	Transaero Airlines	Russian Federation	UN
4253	UO	Hong Kong Express Airways	Hong Kong (sar) China	UO
4254	UP	Bahamasair	Bahamas	UP
4255	UP1	Congo Air     	Bahamas	UP1
4256	UP2	Sky Unlimited   	Bahamas	UP2
4257	UPA	Air Foyle   	United Kingdom	UPA
4258	UQ	Business Aviation Centre	Ukraine	UQ
4259	UR	UTair-Express	Russian Federation	UR
4260	URE	Eureca   	Italy	URE
4261	URJ	Star Air Aviation	Pakistan	URJ
4262	US	US Airways	USA	US
4263	US1	Metrojet   	USA	US1
4264	US2	US Airways Leasing   	USA	US2
4265	US3	Republic Airlines   	USA	US3
4266	US4	US Airways Shuttle	USA	US4
4267	USA	US Airways Shuttle   	USA	USA
4268	USC	Airnet Systems, Inc.	USA	USC
4269	USE	US Airways Express     	USA	USE
4270	UT	UTair Aviation	Russian Federation	UT
4271	UU	Air Austral	Reunion	UU
4272	UV	INAER Helicopteros S.A.U.	Spain	UV
4273	UVL	Orel Avia     	Russian Federation	UVL
4274	UW	Uni-top Airlines	China	UW
4275	UX	Air Europa	Spain	UX
4276	UX1	Air Europa Express   	Spain	UX1
4277	UXS	Skyway Airlines                        	USA	UXS
4278	UY	Air Caucasus Ltd.	Georgia	UY
4279	UZ	Buraq Air	Libya	UZ
4280	V0	Conviasa	Venezuela	V0
4281	V2	Vision Airlines	USA	V2
4282	V3	Carpatair	Romania	V3
4283	V4	Vieques Air Link	Puerto Rico	V4
4284	V5	Danube Wings	Slovakia	V5
4285	V51	VIP Wings	Slovakia	V51
4286	V6	VIP S.A.	Ecuador	V6
4287	V7	Volotea	Spain	V7
4288	V8	Iliamna Air Taxi	USA	V8
4289	V9	Citywing	United Kingdom	V9
4290	VA	Virgin Australia International	Australia	VA
4291	VA1	Volareweb.com   	Italy	VA1
4292	VA2	Fantasea Cruises	Australia	VA2
4293	VA3	Hayman Resort	Australia	VA3
4294	VAS	Aviatrans   	Russian Federation	VAS
4295	VAV	Cambodia Angkor Air	Cambodia	VAV
4296	VB	Vivaaerobus	Mexico	VB
4297	VBA	V Bird	Netherlands	VBA
4298	VC	Strategic Airlines Pty Ltd	Australia	VC
4299	VCV	Conviasa	Venezuela	VCV
4300	VD	Kun Peng Airlines	China	VD
4301	VDA	Volga-Dnepr Airlines	Russian Federation	VDA
4302	VE	CAI Second	Italy	VE
4303	VEI	Virgin Express (Ireland)     	Ireland Republic of	VEI
4304	VES	Vieques Air Link	Puerto Rico	VES
4305	VF	Valuair	Singapore	VF
4306	VG	Cityjet	Belgium	VG
4307	VG1	VLM Netherlands   	Netherlands	VG1
4308	VH	Aeropostal, Alas De Venezuela S.A.	Venezuela	VH
4309	VI	Volga-Dnepr Airlines	Russian Federation	VI
4310	VI1	AirBridge Cargo   	Russian Federation	VI1
4311	VID	Aviaprad	Russian Federation	VID
4312	VIM	Air Via	Bulgaria	VIM
4313	VIO	Volga-Dnepr Airlines	Russian Federation	VIO
4314	VJ	VietJet Air	Viet Nam	VJ
4315	VJC	VietJet Air	Viet Nam	VJC
4316	VK	Air Nigeria	Nigeria	VK
4317	VKG	MyTravel Airways A/S   	Denmark	VKG
4318	VKO	Vnukovo Airlines   	Russian Federation	VKO
4319	VL	Sonicblue Airways	Canada	VL
4320	VLE	Volare     	Italy	VLE
4321	VLO	VARIG Logistica	Brazil	VLO
4322	VM	Macair Jet	Argentina	VM
4323	VN	Vietnam Airlines	Viet Nam	VN
4324	VNR	Vanair     	Vanuatu	VNR
4325	VNZ	Tbilaviamsheni	Georgia	VNZ
4326	VO	Tyrolean Airways   	Austria	VO
4327	VP	FlyMe	Maldives	VP
4328	VQ	NovoAir	Bangladesh	VQ
4329	VR	TACV Cabo Verde Airlines	Cape Verde	VR
4330	VRN	Voronezhavia	Russian Federation	VRN
4331	VS	Virgin Atlantic Airways	United Kingdom	VS
4332	VS1	Virgin Sun   	United Kingdom	VS1
4333	VS2	Air Atlanta Europe Ltd.   	United Kingdom	VS2
4334	VSG	Airclass Airways	Spain	VSG
4335	VT	Air Tahiti	French Polynesia	VT
4336	VTT	Victoria Airlines     	Italy	VTT
4337	VU	Air Ivoire	Cote D'Ivoire	VU
4338	VUR	VIP S.A.	Ecuador	VUR
4339	VV	Private JSC Aerosvit Airlines	Ukraine	VV
4340	VV1	Autolux   	Ukraine	VV1
4341	VV2	Maus Ltd.   	Ukraine	VV2
4342	VV3	Merkur Company   	Hungary	VV3
4343	VV4	ATASS   	Ukraine	VV4
4344	VV5	Voyage Service   	Ukraine	VV5
4345	VV6	Europe Line East   	Hungary	VV6
4346	VW	Transportes Aeromar S.A. De C.V.	Mexico	VW
4347	VX	Virgin America	USA	VX
4348	VY	Vueling Airlines	Spain	VY
4349	VZ	Velvet Sky	South Africa	VZ
4350	W2	FlexFlight ApS	Denmark	W2
4352	W22	Metrobus	Turkey	W22
4353	W23	Advance Air	Germany	W23
4354	W24	Guinea Airlines	Equatorial Guinea	W24
4355	W3	Arik Air	Nigeria	W3
4356	W4	Lc Busre	Peru	W4
4357	W5	Mahan Air	Iran Islamic Republic of	W5
4358	W6	Wizz Air	Hungary	W6
4359	W7	Sayakhat Air Company	Kazakhstan	W7
4360	W8	Cargojet Airways Ltd.	Canada	W8
4361	W9	Air Bagan	Myanmar	W9
4362	WA	KLM Cityhopper	Netherlands	WA
4363	WAO	Vensecar Internacional C.A.	Venezuela	WAO
4364	WAU	Wizz Air Ukraine	Ukraine	WAU
4365	WAV	Warbelow's Air Ventures Inc.	USA	WAV
4366	WB	Rwandair Express	Rwanda	WB
4367	WBA	Finncomm Airlines	Finland	WBA
4368	WC	Islena Airlines	Honduras	WC
4369	WD	Dairo Air Services	Uganda	WD
4370	WDA	Wimbi Dira Airways	Congo Democratic Republic of	WDA
4371	WDL	WDL Aviation   	Germany	WDL
4372	WE	Centurion Air Cargo	USA	WE
4373	WE1	Pronto Airways	Canada	WE1
4374	WEA	White Eagle Aviation	Poland	WEA
4375	WEB	Webjet	Brazil	WEB
4376	WEO	Challenge Air Cargo, Inc.	USA	WEO
4377	WES	Western Express Air Lines   	Canada	WES
4378	WEW	Express Air	Canada	WEW
4379	WF	Wideroe's Flyveselskap	Norway	WF
4380	WG	Sunwing Airlines Inc.	Canada	WG
4381	WG1	Vacation Express Public Charter	USA	WG1
4382	WH	Westair Benin	Benin	WH
4383	WHT	White Coloured By You	Portugal	WHT
4384	WI	White Coloured By You	Portugal	WI
4385	WIG	Wiggins Airways   	USA	WIG
4386	WIO	Tradewinds Int'l Airlines	USA	WIO
4387	WJ	Air LAbrador	Canada	WJ
4388	WK	Edelweiss Air	Switzerland	WK
4389	WL	Aeroperlas	Panama	WL
4390	WLG	Volga-Aviaexpress	Russian Federation	WLG
4391	WLX	West Air Luxembourg   	Luxembourg	WLX
4392	WM	Windward Island Airways International	St Maarten (dutch Part)	WM
4393	WM1	Anguilla Air Services	Anguilla, Leeward Islands	WM1
4394	WN	Southwest Airlines	USA	WN
4395	WO	World Airways	USA	WO
4396	WOA	World Airways   	USA	WOA
4397	WOW	Air Southwest	United Kingdom	WOW
4398	WP	Island Air	USA	WP
4399	WQ	Romavia	Romania	WQ
4400	WR	Aviaprad	Russian Federation	WR
4401	WS	Westjet	Canada	WS
4402	WSG	Wasaya Airways   	Canada	WSG
4403	WST	Western Air	Bahamas	WST
4404	WT	Wasaya Airways LP	Canada	WT
4405	WU	Wizz Air Ukraine	Ukraine	WU
4406	WV	Wings Air (US)	USA	WV
4407	WW	bmibaby	United Kingdom	WW
4408	WX	City Jet   	Ireland Republic of	WX
4409	WY	Oman Air	Oman	WY
4410	WZ	West African Airlines	Benin	WZ
4411	WZO	Western Air Freight	USA	WZO
4412	WZZ	Wizz Air	Hungary	WZZ
4413	X2	China Xinhua Airlines	China	X2
4414	X3	TUIfly	Germany	X3
4415	X4	Air Excursions, LLC	USA	X4
4416	X5	Afrique Airlines	Benin	X5
4417	X6	Khors Air Company	Ukraine	X6
4418	X7	ExecAir	USA	X7
4419	X8	Icaro	Ecuador	X8
4420	X9	Avion Express	Lithuania	X9
4421	XAP	Northern Star Airlines     	USA	XAP
4422	XB	Forward Air	USA	XB
4423	XC	Corendon Airlines	Turkey	XC
4424	XCO	Air Caribbean	Netherlands Antilles	XCO
4425	XE	Expressjet Airlines, Inc.	USA	XE
4426	XF	Vladivostok Air	Russian Federation	XF
4427	XG	SunExpress Deutschland GmbH	Germany	XG
4428	XJ	Mesaba Airlines	USA	XJ
4429	XK	Air Corsica	France	XK
4430	XL	LanEcuador	Ecuador	XL
4431	XM	CAI First	Italy	XM
4432	XMO	Australian Air Express	Australia	XMO
4433	XN	Air Nepal International	Nepal	XN
4434	XO	Exec Direct Aviation	Jamaica	XO
4435	XP	Xtra Airways	USA	XP
4436	XPS	XP Express Parcels System     	Netherlands	XPS
4437	XQ	SunExpress	Turkey	XQ
4438	XR	Skywest Airlines	Australia	XR
4439	XT	Skystar Airways	Thailand	XT
4440	XT1	Dutch Eagle Express dba BonairExel   	Netherlands Antilles	XT1
4441	XT2	Granda Exel   	Italy	XT2
4442	XT3	Alsace Exel   	France	XT3
4443	XU	African Express Airways	Kenya	XU
4444	XV	BVI Airways	Virgin Islands, British	XV
4446	XY	NAS AIR - National Air Services	Saudi Arabia	XY
4447	XZ	South African Express Airways	South Africa	XZ
4448	XZ1	Congo Express	Congo Democratic Republic of	XZ1
4449	Y0	Yellow Air Taxi	USA	Y0
4450	Y2	flyglobespan	United Kingdom	Y2
4451	Y21	Alliance Express     	Rwanda	Y21
4452	Y22	Alliance Express Uganda     	Uganda	Y22
4453	Y4	Volaris	Mexico	Y4
4454	Y5	Golden Myanmar Airlines	Myanmar	Y5
4455	Y6	Batavia Air	Indonesia	Y6
4456	Y7	Airline Tajmyr	Russian Federation	Y7
4457	Y8	Yangtze River Express Airlines	China	Y8
4458	Y9	Kish Air	Iran Islamic Republic of	Y9
4459	YB	SA Express   	South Africa	YB
4460	YC	Yamal Airlines	Russian Federation	YC
4461	YD	Mauritania Airways	Mauritania	YD
4462	YE	Yanair	Ukraine	YE
4463	YG	South Airlines	Ukraine	YG
4464	YH	Yangon Airways	Myanmar	YH
4465	YI	Air Sunshine	USA	YI
4466	YJ	Asian Wings Airways	Myanmar	YJ
4467	YK	Avia Traffic Company	Kyrgyzstan	YK
4468	YL	Air Bissau International	Guinea-Bissau	YL
4469	YM	Montenegro Airlines	Montenegro	YM
4470	YN	Air Creebec (1994) Inc.	Canada	YN
4471	YO	Heli Air Monaco	Monaco	YO
4472	YP	Aero Lloyd	Germany	YP
4473	YQ	Aircompany Polet	Russian Federation	YQ
4474	YR	Scenic Airlines	USA	YR
4475	YRG	Air Yugoslavia   	Serbia and Montenegro	YRG
4476	YS	HOP! Regional	France	YS
4477	YSS	Yestours   	Portugal	YSS
4478	YT	Yeti Airlines	Nepal	YT
4479	YU	Euroatlantic Airways	Portugal	YU
4480	YV	Mesa Airlines	USA	YV
4481	YV1	Mesa Air Group   	USA	YV1
4482	YV2	go!   	USA	YV2
4483	YV3	Mokulele Airlines	USA	YV3
4484	YW	Air Nostrum   	Spain	YW
4485	YX	Republic Airline Inc	USA	YX
4486	YXS	Skyway Airlines     	USA	YXS
4487	YZ	Zimbabwe Airlink	Zimbabwe	YZ
4488	Z2	Zestair	Philippines	Z2
4489	Z3	PM Air LLC	USA	Z3
4490	Z4	Puma Air	Brazil	Z4
4491	Z5	GMG Airlines	Bangladesh	Z5
4492	Z6	Dnieproavia Joint Stock Aviation Co	Ukraine	Z6
4493	Z7	Fresh Air	South Africa	Z7
4494	Z8	Amaszonas	Bolivia	Z8
4495	Z9	Bek Air	Kazakhstan	Z9
4496	ZA	Skywings Asia Airlines	Cambodia	ZA
4497	ZAN	Zantop International Airlines   	USA	ZAN
4498	ZB	Monarch Airlines	United Kingdom	ZB
4499	ZC	Korongo Airlines	Congo Democratic Republic of	ZC
4500	ZD	EWA Air	Mayotte	ZD
4501	ZE	Eastar Jet	Korea Republic of	ZE
4502	ZF	Athens Airways	Greece	ZF
4503	ZG	Viva Macau	Macao (sar) China	ZG
4504	ZH	Shenzhen Airlines	China	ZH
4505	ZI	Aigle Azur	France	ZI
4506	ZJ	Zambezi Airlines	Zambia	ZJ
4507	ZK	Great Lakes Airlines	USA	ZK
4508	ZK1	Air Cargo Masters   	USA	ZK1
4509	ZL	Regional Express	Australia	ZL
4510	ZLO	Affretair	Zimbabwe	ZLO
4511	ZM	Air Manas	Kyrgyzstan	ZM
4512	ZN	NAYSA	Spain	ZN
4513	ZO	Central Air Transport Services (CATS)	Zimbabwe	ZO
4514	ZP	Silk Way Airlines	Azerbaijan	ZP
4515	ZPO	Silk Way Airlines	Azerbaijan	ZPO
4516	ZQ	Air Azul	USA	ZQ
4517	ZQ1	Tranzair                               	New Zealand	ZQ1
4518	ZR	Aviacon Zitotrans	Russian Federation	ZR
4519	ZR1	Muk Air Ghana     	Ghana	ZR1
4520	ZS	Sol Air	Zimbabwe	ZS
4521	ZT	Titan Airways	United Kingdom	ZT
4522	ZT1	Zambezi Transfer Services   	Zimbabwe	ZT1
4523	ZT2	Snowjet	United Kingdom	ZT2
4524	ZU	Air Bashkortostan	Russian Federation	ZU
4525	ZUO	Aerovias Colombianas Ltda. ARCA	Colombia	ZUO
4526	ZV	Zagros Airlines	Iran Islamic Republic of	ZV
4527	ZW	Air Wisconsin	USA	ZW
4528	ZX	Air Georgian Ltd dba Air Alliance	Canada	ZX
4529	ZY	Sky Airlines	Turkey	ZY
4445	XW	NokScoot	Singapore	XW
\.


--
-- Data for Name: hosts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY hosts (id, brand_id, name, code, created_at, updated_at) FROM stdin;
2	1	NokScoot Navitaire	XW	2015-08-24 15:45:01.123549	2015-08-24 15:45:01.123549
5	1	Nok Navitaire	DD	2015-08-24 16:02:25.758282	2015-08-24 16:02:25.758282
7	2	Nok Navitaire	DD	2015-08-31 09:07:40.218443	2015-09-02 18:45:10.075155
9	2	NokScoot Navitaire	XW	2015-08-31 09:11:15.761392	2015-09-02 18:45:10.076616
10	1	Scoot Navitaire	TZ	2015-08-31 09:11:58.301918	2015-09-02 18:53:47.339998
1	2	Scoot Navitaire	TZ	2015-08-24 04:39:35.051448	2015-09-02 18:54:20.496365
\.


--
-- Data for Name: airlines_hosts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY airlines_hosts (id, airline_id, host_id) FROM stdin;
1	4183	1
2	4212	1
3	4445	2
5	3011	5
7	4290	1
8	3011	7
9	4445	9
10	4183	10
11	4212	10
12	4290	10
\.


--
-- Name: airlines_hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('airlines_hosts_id_seq', 12, true);


--
-- Name: airlines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('airlines_id_seq', 4530, true);


--
-- Data for Name: airport_currencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY airport_currencies (id, name, city, iata, icao, country, country_code, latitude, longitude, currency_code) FROM stdin;
2	Sheberghan Airport	Sheberghan	OAS		Afghanistan	AF	36.666668000000	65.916664000000	USD
3	Tozeur Airport	Tozeur	TOE		Tunisia	TN	33.916667000000	8.133333000000	TND
4	Trivandrum International Airport	Thiruvananthapuram	TRV		India	IN	8.476126000000	76.919070000000	INR
5	Jackson Hole Airport	Jackson	JAC		USA	US	43.602806000000	-110.736130000000	USD
6	Mtwara	Mtwara	MYW		Tanzania United Republic of	TZ	-10.339167000000	40.181667000000	TZS
7	Oban	Oban	OBN		United Kingdom	GB	56.466667000000	-5.400000000000	GBP
8	Antwerp Berchem Rail Stn	Antwerp Berchem Rail Stn	ZYZ		Belgium	BE	51.198889000000	4.433056000000	EUR
9	Nevatim	Nevatim	VTM		Israel	IL	31.208333000000	35.012222000000	ILS
10	Ondangwa	Ondangwa	OND		Namibia	NA	-17.880556000000	15.947222000000	NAD
11	Aumo	Aumo	AUV		Papua New Guinea	PG	-5.716667000000	148.433333000000	PGK
12	Espiritu Santo	Espiritu Santo	SON		Vanuatu	VU	-15.505000000000	167.219722000000	VUV
13	Akron	Akron	AKO		USA	US	40.166667000000	-103.216667000000	USD
14	Provo	Provo	PVU		USA	US	40.218889000000	-111.722500000000	USD
15	Postville	Postville	YSO		Canada	CA	54.910000000000	-59.786111000000	CAD
16	Belgrad Nikola Tesla Airport	Belgrade	BEG		Republic of Serbia	RS	44.819444000000	20.306944000000	EUR
17	Changchun Airport	Changchun	CGQ		China	CN	43.902836000000	125.217541000000	RMB
18	Syros Island Airport	Syros Island	JSY		Greece	GR	37.423610000000	24.950000000000	EUR
19	Arba Minch	Arba Minch	AMH		Ethiopia	ET	6.039444000000	37.590556000000	ETB
20	Lahr	Lahr	LHA		Germany	DE	48.369167000000	7.827778000000	EUR
21	Heimdal Rail Station	Heimdal Rail Station	XUE		Norway	NO	63.350833000000	10.357222000000	NOK
22	Aberdeen Rail Station	Aberdeen Rail Station	ZXA		United Kingdom	GB	57.166667000000	-2.066667000000	GBP
23	Porto Nacional	Porto Nacional	PNB		Brazil	BR	-10.716667000000	-48.400000000000	BRL
24	Ust-Ilimsk	Ust-Ilimsk	UIK		Russian Federation	RU	58.133333000000	102.550000000000	RUB
25	Mae Sot	Mae Sot	MAQ		Thailand	TH	16.699722000000	98.543611000000	THB
26	Kosrae Airport	Kosrae, Caroline Islands	KSA		Micronesia	FM	5.352478000000	162.956603000000	USD
27	Rochester International Airport	Rochester	RST		United States	US	43.910793000000	-92.489768000000	USD
28	Mo I Rana Airport	Mo I Rana	MQN		Norway	NO	66.364650000000	14.302748000000	NOK
29	University of Illinois Willard Airport	Savoy	CMI		United States	US	40.039665000000	-88.269050000000	USD
30	Kisumu	Kisumu	KIS		Kenya	KE	-0.085556000000	34.729722000000	KES
31	Grimsby	Grimsby	GSY		United Kingdom	GB	53.583333000000	-0.033333000000	GBP
32	London Kings Cross Rail Station	London Kings Cross Rail Station	QQK		United Kingdom	GB	51.533333000000	-0.116667000000	GBP
33	Odense Bus Station	Odense	ZIM		Denmark	DK	55.400000000000	10.366667000000	DKK
34	Dammam SABTCO Bus Station	Dammam SABTCO Bus Station	DMS		Saudi Arabia	SA	26.451389000000	50.106944000000	SAR
35	Namibe	Namibe	MSZ		Angola	AO	-15.208611000000	12.160833000000	AOA
36	Putussibau	Putussibau	PSU		Indonesia	ID	0.835556000000	112.937222000000	IDR
37	Munda	Munda	MUA		Solomon Islands	SB	-8.327222000000	157.261667000000	SBD
38	Yelimane	Yelimane	EYL		Mali	ML	15.133333000000	-10.566667000000	XOF
39	Macon Lewis B Wilson Apt	Macon	MCN		USA	US	32.696111000000	-83.648056000000	USD
40	Igloolik	Igloolik	YGT		Canada	CA	69.366389000000	-81.820556000000	CAD
41	Burnie	Burnie	BWT		Australia	AU	-40.997222000000	145.726667000000	AUD
42	Touho	Touho	TOU		New Caledonia	NC	-20.790000000000	165.259444000000	XPF
43	Brigham City	Brigham City	BMC		USA	US	41.533333000000	-112.050000000000	USD
44	Roosevelt	Roosevelt	ROL		USA	US	40.300000000000	-109.983333000000	USD
45	North Bay	North Bay	YYB		Canada	CA	46.363611000000	-79.422778000000	CAD
46	London City Airport	London	LCY		United Kingdom	GB	51.500000000000	0.050000000000	GBP
47	Saltillo Airport	Saltillo	SLW		Mexico	MX	25.550000000000	-100.916667000000	MXN
48	Saint Gatien Airport	Deauville	DOL		France	FR	49.362778000000	0.164167000000	EUR
49	San Pedro	San Pedro	SPR		Belize	BZ	17.916667000000	-87.966667000000	BZD
50	Farnborough	Farnborough	FAB		United Kingdom	GB	51.275833000000	-0.776389000000	GBP
51	Sala Rail Station	Sala Rail Station	XYX		Sweden	SE	59.925000000000	16.606667000000	SEK
52	Toledo	Toledo (BR)	TOW		Brazil	BR	-24.687500000000	-53.697500000000	BRL
53	Kume Jima	Kume Jima	UEO		Japan	JP	26.365278000000	126.716389000000	JPY
54	Lawas	Lawas	LWY		Malaysia	MY	4.849722000000	115.408056000000	MYR
55	Lihir Island	Lihir Island	LNV		Papua New Guinea	PG	-3.042500000000	152.627778000000	PGK
56	Tumaco	Tumaco	TCO		Colombia	CO	1.814444000000	-78.749167000000	COP
57	Moser Bay	Moser Bay	KMY		USA	US	57.000000000000	-154.166667000000	USD
58	Black Tickle	Black Tickle	YBI		Canada	CA	53.450000000000	-55.733333000000	CAD
59	Ciampino Airport	Rome	CIA		Italy	IT	41.799065000000	12.590987000000	EUR
60	Benina International Airport	Benghazi	BEN		Libyan Arab Jamahiriya	LY	32.085423000000	20.264891000000	LYD
61	Raja Sansi Airport	Amritsar	ATQ		India	IN	31.706742000000	74.807294000000	INR
62	Dallas Love Field	Dallas	DAL		United States	US	32.843910000000	-96.850000000000	USD
63	Tum	Tum	TUJ		Ethiopia	ET	6.250000000000	35.466667000000	ETB
64	Darlington Rail Station	Darlington Rail Station	XVG		United Kingdom	GB	54.516667000000	-1.566667000000	GBP
65	Belaya Gora	Belaya Gora	BGN		Russian Federation	RU	68.556944000000	146.231111000000	RUB
66	Bouarfa	Bouarfa	UAR		Morocco	MA	32.514167000000	-1.981667000000	MAD
67	Dehra Dun	Dehra Dun	DED		India	IN	30.189722000000	78.180278000000	INR
68	Butaritari	Butaritari	BBG		Kiribati	KI	3.083333000000	172.816667000000	AUD
69	Warraber Island	Warraber Island	SYU		Australia	AU	-10.207222000000	142.823611000000	AUD
70	Denver Arapahoe County Apt	Denver	APA		USA	US	39.571944000000	-104.851111000000	USD
71	Qassiarsuk Heliport	Qassiarsuk Heliport	QFT		Greenland	GL	61.143611000000	-45.513333000000	DKK
72	Tasiujuaq	Tasiujuaq	YTQ		Canada	CA	58.667500000000	-69.955833000000	CAD
73	Puerto del Rosario Airport	Puerto del Rosario	FUE		Spain and Canary Islands	ES	28.450605000000	-13.869893000000	EUR
74	Poretta Airport	Bastia	BIA		France	FR	42.547616000000	9.480124000000	EUR
75	La Romana Airport	La Romana	LRM		Dominican Republic	DO	18.416667000000	-68.900000000000	DOP
76	Subic Bay International Airport	Subic Bay	SFS		Philippines	PH	14.785556000000	120.267222000000	PHP
77	Central Nebraska Regional Airport	Grand Island	GRI		United States	US	40.967220000000	-98.306660000000	USD
78	St-Pierre	St-Pierre	ZSE		Reunion	RE	-21.320833000000	55.425000000000	EUR
79	Oban	Oban	OBN		United Kingdom	GB	56.466667000000	-5.400000000000	GBP
80	Petrozavodsk	Petrozavodsk	PES		Russian Federation	RU	61.885278000000	34.154722000000	RUB
81	Port Said	Port Said	PSD		Egypt	EG	31.283333000000	32.233333000000	EGP
82	Hyderabad Begumpet Airport	Hyderabad (IN)	BPM		India	IN	17.453333000000	78.463611000000	INR
83	Chatham Island	Chatham Island	CHT		New Zealand	NZ	-43.811944000000	-176.465000000000	NZD
84	Guam Anderson AFB	Guam	UAM		Guam	GU	13.583333000000	144.916667000000	USD
85	Blakely Island	Blakely Island	BYW		USA	US	48.583333000000	-122.833333000000	USD
86	Phoenix Scottsdale Municipal Apt	Phoenix	SCF		USA	US	33.500000000000	-111.933333000000	USD
87	Salluit	Salluit	YZG		Canada	CA	62.179167000000	-75.666944000000	CAD
88	Malatya Airport	Malatya	MLX		Turkey	TR	38.354444000000	38.253611000000	USD
89	Calicut Airport	Kozhikode	CCJ		India	IN	11.140250000000	75.950587000000	INR
90	Twin Falls City County Airport	Twin Falls	TWF		United States	US	42.481945000000	-114.486664000000	USD
91	Antsalova	Antsalova	WAQ		Madagascar	MG	-18.700000000000	44.616667000000	MGA
92	London St Pancras Intl Rail Station	London (GB)	QQS		United Kingdom	GB	51.531667000000	-0.126389000000	GBP
93	Borlange Rail Station	Borlange Rail Station	XYB		Sweden	SE	60.483056000000	15.426389000000	SEK
94	Aberdeen Rail Station	Aberdeen Rail Station	ZXA		United Kingdom	GB	57.166667000000	-2.066667000000	GBP
95	Tucurui	Tucurui	TUR		Brazil	BR	-3.786111000000	-49.720278000000	BRL
96	Alexander Bay	Alexander Bay	ALJ		South Africa	ZA	-28.566667000000	16.533333000000	ZAR
97	Mosnov Airport	Ostrava	OSR		Czech Republic	CZ	49.695517000000	18.121285000000	CZK
98	Kosrae Airport	Kosrae, Caroline Islands	KSA		Micronesia	FM	5.352478000000	162.956603000000	USD
99	Porto Seguro Airport	Porto Seguro	BPS		Brazil	BR	-16.441158000000	-39.081095000000	BRL
100	Sumburgh Airport	Shetland Islands	LSI		United Kingdom	GB	59.877888000000	-1.287111000000	GBP
101	Sloulin Field International Airport	Williston	ISN		United States	US	48.176700000000	-103.631000000000	USD
102	Tsaratanana	Tsaratanana	TTS		Madagascar	MG	-16.733333000000	47.616667000000	MGA
103	Grimsby	Grimsby	GSY		United Kingdom	GB	53.583333000000	-0.033333000000	GBP
104	London Kings Cross Rail Station	London Kings Cross Rail Station	QQK		United Kingdom	GB	51.533333000000	-0.116667000000	GBP
105	Fauske Rail Station	Fauske Rail Station	ZXO		Norway	NO	67.283333000000	15.416667000000	NOK
106	Sur	Sur	SUH		Oman	OM	22.550000000000	59.500000000000	OMR
107	Bhubaneswar	Bhubaneswar	BBI		India	IN	20.244444000000	85.817778000000	INR
108	Tana Toraja	Tana Toraja	TTR		Indonesia	ID	-3.045833000000	119.823611000000	IDR
109	Paama	Paama	PBJ		Vanuatu	VU	-16.431944000000	168.235833000000	VUV
110	Minvoul	Minvoul	MVX		Gabon	GA	2.150000000000	12.133333000000	XAF
111	Nulato	Nulato	NUL		USA	US	64.729444000000	-158.074167000000	USD
112	Wemindji	Wemindji	YNC		Canada	CA	53.010556000000	-78.831111000000	CAD
113	Eia	Eia	EIA		Papua New Guinea	PG	-8.200000000000	147.850000000000	PGK
114	Windorah	Windorah	WNR		Australia	AU	-25.410556000000	142.669167000000	AUD
115	Douglas Lake	Douglas Lake	DGF		Canada	CA	50.166667000000	-120.183333000000	CAD
116	Sidney (US) NY	Sidney (US) NY	SXY		USA	US	42.316667000000	-75.400000000000	USD
117	Schenectady Rail Station	Schenectady Rail Station	ZTD		USA	US	42.815278000000	-73.943333000000	USD
118	London City Airport	London	LCY		United Kingdom	GB	51.500000000000	0.050000000000	GBP
119	Great Falls International Airport	Great Falls	GTF		United States	US	47.481889000000	-111.356360000000	USD
120	Lann Bihoue Airport	Lorient	LRT		France	FR	47.753740000000	-3.436394000000	EUR
121	Goba	Goba	GOB		Ethiopia	ET	7.116667000000	40.033333000000	ETB
122	Jaen Rail Station	Jaen Rail Station	JEA		Spain	ES	37.780000000000	-3.790833000000	EUR
123	Solingen-Ohligs Rail Station	Solingen-Ohligs Rail Station	ZIO		Germany	DE	51.160833000000	7.003889000000	EUR
124	Dawadmi	Dawadmi	DWD		Saudi Arabia	SA	24.450000000000	44.121111000000	SAR
125	Zhenjiang Rail Station	Zhenjiang Rail Station	ZUJ		China	CN	32.198889000000	119.427500000000	RMB
126	Phuquoc	Phuquoc	PQC		Viet Nam	VN	10.226944000000	103.967222000000	VND
127	Makin Island	Makin Island	MTK		Kiribati	KI	3.116667000000	172.800000000000	AUD
128	Katsina	Katsina	DKA		Nigeria	NG	13.005278000000	7.658611000000	NGN
129	Tampa Mac Dill AFB	Tampa	MCF		USA	US	27.969444000000	-82.536111000000	USD
130	Gaspe	Gaspe	YGP		Canada	CA	48.775278000000	-64.478611000000	CAD
131	Moscow Domodedovo Airport	Moscow	DME		Russian Federation	RU	55.414566000000	37.899494000000	RUB
132	Lungi International Airport	Freetown	FNA		Sierra Leone	SL	8.617500000000	-13.196944000000	SLL
133	Kota Kinabalu Airport	Kota Kinabalu	BKI		Malaysia	MY	5.923961000000	116.050753000000	MYR
134	Pocatello Regional Airport	Pocatello	PIH		United States	US	42.913334000000	-112.594444000000	USD
135	Bursa	Bursa	BTZ		Turkey	TR	40.233333000000	29.016667000000	USD
136	Darlington Rail Station	Darlington Rail Station	XVG		United Kingdom	GB	54.516667000000	-1.566667000000	GBP
137	Ruse	Ruse	ROU		Bulgaria	BG	43.694722000000	26.056667000000	EUR
138	Erenhot Shi	Erenhot Shi	ERL		China	CN	43.423333000000	112.091111000000	RMB
139	Kaadedhdhoo	Kaadedhdhoo	KDM		Maldives	MV	0.488333000000	72.996111000000	MVR
140	Coober Pedy	Coober Pedy	CPD		Australia	AU	-29.040278000000	134.720000000000	AUD
141	Kiunga	Kiunga	UNG		Papua New Guinea	PG	-6.125000000000	141.285556000000	PGK
142	Cortez	Cortez	CEZ		USA	US	37.303056000000	-108.628611000000	USD
143	Shishmaref	Shishmaref	SHH		USA	US	66.249444000000	-166.089444000000	USD
144	Faro (CA)	Faro (CA)	ZFA		Canada	CA	62.166667000000	-133.666667000000	CAD
145	Kilimanjaro Airport	Kilimanjaro	JRO		United Republic of Tanzania	TZ	-3.424123000000	37.065343000000	TZS
146	Felix Eboue Airport	Cayenne	CAY		French Guiana	GF	4.816667000000	-52.366667000000	EUR
147	North Bay Airport	Barra	BRR		United Kingdom	GB	57.023335000000	-7.440278000000	GBP
148	Chisholm Hibbing Airport	Hibbing	HIB		United States	US	47.388610000000	-92.838610000000	USD
149	Agri	Agri	AJI		Turkey	TR	39.653889000000	43.026389000000	USD
150	Torsby	Torsby	TYF		Sweden	SE	60.157500000000	12.991389000000	SEK
151	Esquel	Esquel	EQS		Argentina	AR	-42.903889000000	-71.135556000000	ARS
152	Liuzhou	Liuzhou	LZH		China	CN	24.207778000000	109.391389000000	RMB
153	Bintulu	Bintulu	BTU		Malaysia	MY	3.124167000000	113.019722000000	MYR
154	Hayfields	Hayfields	HYF		Papua New Guinea	PG	-3.633333000000	143.050000000000	PGK
155	Santa Rosa (EC)	Santa Rosa (EC)	ETR		Ecuador	EC	-3.435278000000	-79.978056000000	USD
156	Harrisburg Skyport Apt	Harrisburg	HAR		USA	US	40.266667000000	-76.866667000000	USD
157	Bearskin Lake	Bearskin Lake	XBE		Canada	CA	53.964722000000	-91.031111000000	CAD
158	Bordeaux St-jean Rail Station	Bordeaux	ZFQ		France	FR	44.817778000000	-0.561667000000	EUR
159	Prince Said Ibrahim In Airport	Moroni	HAH		Comoros	KM	-11.537275000000	43.274922000000	USD
160	Guiyang Airport	Guiyang	KWE		China	CN	26.544217000000	106.795980000000	RMB
161	Ust-Kamenogorsk Airport	Ust-Kamenogorsk	UKK		Kazakhstan	KZ	50.025723000000	82.505600000000	KZT
162	Mekele	Mekele	MQX		Ethiopia	ET	13.467500000000	39.533333000000	ETB
163	Dusseldorf Moenchengladbach	Duesseldorf	MGL		Germany	DE	51.230278000000	6.504444000000	EUR
164	Hague Holland Spoor Rail Station	Hague Holland Spoor Rail Station	ZYH		Netherlands	NL	52.100000000000	4.300000000000	EUR
165	Gaza	Gaza	GZA		Israel	IL	31.246389000000	34.276111000000	ILS
166	Plettenberg Bay	Plettenberg Bay	PBZ		South Africa	ZA	-34.083333000000	23.316667000000	ZAR
167	Stuttgart Airport	Stuttgart	STR		Germany	DE	48.690732000000	9.193624000000	EUR
168	Meadows Field	Bakersfield	BFL		United States	US	35.429625000000	-119.045328000000	USD
169	Will Rogers World Airport	Oklahoma City	OKC		United States	US	35.395630000000	-97.596090000000	USD
170	Albert J Ellis Airport	Richlands	OAJ		United States	US	34.830700000000	-77.605300000000	USD
171	Beja	Beja	BYJ		Portugal	PT	38.078889000000	-7.932500000000	EUR
172	Bath Rail Station	Bath Rail Station	QQX		United Kingdom	GB	51.383333000000	-2.366667000000	GBP
173	Olenek	Olenek	ONK		Russian Federation	RU	68.514722000000	112.480000000000	RUB
174	Dongguan	Dongguan	DGM		China	CN	23.033889000000	113.718889000000	RMB
175	Port Blair	Port Blair	IXZ		India	IN	11.641111000000	92.729722000000	INR
176	Aneityum	Aneityum	AUY		Vanuatu	VU	-20.249444000000	169.770833000000	VUV
177	Pumani	Pumani	PMN		Papua New Guinea	PG	-9.816667000000	149.466667000000	PGK
178	Gemena	Gemena	GMA		Congo Democratic Republic of	CD	3.235278000000	19.771389000000	CDF
179	Sacramento Mather AFB	Sacramento	MHR		USA	US	38.555000000000	-121.296389000000	USD
180	Hearst	Hearst	YHF		Canada	CA	49.683333000000	-83.666667000000	CAD
181	Craig Cove	Craig Cove	CCV		Vanuatu	VU	-16.264444000000	167.924167000000	VUV
182	Taveuni	Taveuni	TVU		Fiji	FJ	-16.700000000000	179.883333000000	FJD
183	Beatty	Beatty	BTY		USA	US	36.852778000000	-116.783333000000	USD
184	Santa Fe (US)	Santa Fe (US)	SAF		USA	US	35.616667000000	-106.083333000000	USD
185	Kapuskasing	Kapuskasing	YYU		Canada	CA	49.414444000000	-82.471111000000	CAD
186	St Mawgan Airport	Newquay	NQY		United Kingdom	GB	50.437450000000	-4.997922000000	GBP
187	Torreon Airport	Torreon	TRC		Mexico	MX	25.563066000000	-103.398741000000	MXN
188	Ercan Airport	Tymvou	ECN		Cyprus	CY	35.158120000000	33.503070000000	EUR
189	La Desirade	La Desirade	DSD		Guadeloupe	GP	16.333333000000	-61.016667000000	EUR
190	Foula	Foula	FOA		United Kingdom	GB	60.122222000000	-2.053611000000	GBP
191	Penzance	Penzance	PZE		United Kingdom	GB	50.128056000000	-5.518611000000	GBP
192	Westray	Westray	WRY		United Kingdom	GB	59.350278000000	-2.950000000000	GBP
193	Peterborough Rail Station	Peterborough Rail Station	XVH		United Kingdom	GB	52.583333000000	-1.250000000000	GBP
194	Caxias do Sul	Caxias do Sul	CXJ		Brazil	BR	-29.196944000000	-51.187500000000	BRL
195	Yinchuan	Yinchuan	INC		China	CN	38.493333000000	106.011944000000	RMB
196	Colombo Ratmalana Apt	Colombo	RML		Sri Lanka	LK	6.821111000000	79.885556000000	LKR
197	Coffs Harbour	Coffs Harbour	CFS		Australia	AU	-30.320556000000	153.116389000000	AUD
198	Snake Bay	Snake Bay	SNB		Australia	AU	-11.333333000000	130.750000000000	AUD
199	Akiak	Akiak	AKI		USA	US	60.901667000000	-161.232222000000	USD
200	Platinum	Platinum	PTU		USA	US	59.016389000000	-161.823889000000	USD
201	Fort Smith (CA)	Fort Smith (CA)	YSM		Canada	CA	60.020278000000	-111.961944000000	CAD
202	Queenstown Airport	Queenstown	ZQN		New Zealand	NZ	-45.022039000000	168.739104000000	NZD
203	Haneda Airport	Tokyo	HND		Japan	JP	35.549069000000	139.784524000000	JPY
204	 University Park Airport	State College, PA	SCE		United States	US	40.853720000000	-77.848230000000	USD
205	Zacatecas	Zacatecas	ZCL		Mexico	MX	22.897222000000	-102.686944000000	MXN
206	Shetland Islands Lerwick/Tingwall Apt	Shetland Islands	LWK		United Kingdom	GB	60.192222000000	-1.243611000000	GBP
207	Drammen Rail Station	Drammen Rail Station	XND		Norway	NO	59.740278000000	10.202778000000	NOK
208	Gobernador Gregores	Gobernador Gregores	GGS		Argentina	AR	-48.781944000000	-70.155556000000	ARS
209	Salekhard	Salekhard	SLY		Russian Federation	RU	66.590833000000	66.611111000000	RUB
210	Sihanoukville	Sihanoukville	KOS		Cambodia	KH	10.579722000000	103.636944000000	KHR
211	Kitava	Kitava	KVE		Papua New Guinea	PG	-8.666667000000	151.333333000000	PGK
212	Puerto Ordaz	Puerto Ordaz	PZO		Venezuela	VE	8.288611000000	-62.760278000000	VEB
213	Lafayette	Lafayette (US) IN	LAF		USA	US	40.416667000000	-86.933333000000	USD
214	Deer Lake (CA) NL	Deer Lake (CA) NL	YDF		Canada	CA	49.210833000000	-57.391389000000	CAD
215	Keflavik International Airport	Reykjavik	KEF		Iceland	IS	63.997765000000	-22.624283000000	ISK
216	San Juan Del Cesar Airport	San Juan Del Cesar	SJH		Colombia	CO	10.766667000000	-73.016670000000	COP
217	Antananarivo Airport	Antananarivo	TNR		Madagascar	MG	-18.799632000000	47.475028000000	MGA
218	Jinan Airport	Jinan	TNA		China	CN	36.857689000000	117.206881000000	RMB
219	North Bay Airport	Barra	BRR		United Kingdom	GB	57.023335000000	-7.440278000000	GBP
220	King Salmon Airport	King Salmon	AKN		United States	US	58.682740000000	-156.669020000000	USD
221	Reus Rail Station	Reus Rail Station	EER		Spain	ES	41.160556000000	1.100278000000	EUR
222	Grong Rail Station	Grong Rail Station	XKG		Norway	NO	64.458333000000	12.336944000000	NOK
223	Matupa	Matupa	MBK		Brazil	BR	-10.241667000000	-54.954167000000	BRL
224	Bayannur	Bayannur	RLK		China	CN	40.926389000000	107.738889000000	RMB
225	Kepi	Kepi	KEI		Indonesia	ID	-6.666667000000	139.383333000000	IDR
226	Karumba	Karumba	KRB		Australia	AU	-17.458333000000	140.833333000000	AUD
227	Puerto Inirida	Puerto Inirida	PDA		Colombia	CO	3.853611000000	-67.906111000000	COP
228	Fort Mackay (CA) AB	Fort Mackay (CA) AB	JHL		Canada	CA	57.227778000000	-111.419444000000	CAD
229	Quebec Rail Station	Quebec	XLJ		Canada	CA	46.833333000000	-71.333333000000	CAD
230	Olive Branch Airport	Olive Branch	OLV		USA	US	34.978306000000	-89.788450000000	USD
231	Carthage Airport	Tunis	TUN		Tunisia	TN	36.847621000000	10.217090000000	TND
232	Vishakhapatnam Airport	Vishakhapatnam	VTZ		India	IN	17.728152000000	83.226757000000	INR
233	Santa Barbara Municipal Airport	Santa Barbara	SBA		United States	US	34.432835000000	-119.836480000000	USD
234	Mananara Avaratra	Mananara Avaratra	WMR		Madagascar	MG	-16.166667000000	49.766667000000	MGA
235	Ulm Rail Station	Ulm Rail Station	QUL		Germany	DE	48.400000000000	10.000000000000	EUR
236	Hague Holland Spoor Rail Station	Hague Holland Spoor Rail Station	ZYH		Netherlands	NL	52.100000000000	4.300000000000	EUR
237	Wadi al Dawaser	Wadi al Dawaser	WAE		Saudi Arabia	SA	20.504167000000	45.199444000000	SAR
238	Bost	Bost	BST		Afghanistan	AF	31.550000000000	64.366667000000	USD
239	Pristina International Airport	Pristina	PRN		Republic of Serbia	RS	42.573611000000	21.035556000000	EUR
240	Keahole Airport	Kona	KOA		United States	US	19.736174000000	-156.041077000000	USD
241	Halmstad Airport	Halmstad	HAD		Sweden	SE	56.680935000000	12.815005000000	SEK
242	Kingston Tinson Apt	Kingston (JM)	KTP		Jamaica	JM	18.016667000000	-76.816667000000	JMD
243	Beja	Beja	BYJ		Portugal	PT	38.078889000000	-7.932500000000	EUR
244	Turin Porta Nuova Rail Station	Turin Porta Nuova Rail Station	TPY		Italy	IT	45.062222000000	7.678889000000	EUR
245	Zhigansk	Zhigansk	ZIX		Russian Federation	RU	66.793889000000	123.364444000000	RUB
246	Tiksi	Tiksi	IKS		Russian Federation	RU	71.697222000000	128.902222000000	RUB
247	Rajahmundry	Rajahmundry	RJA		India	IN	17.110000000000	81.819444000000	INR
248	Choiseul Bay	Choiseul Bay	CHY		Solomon Islands	SB	-6.711944000000	156.396111000000	SBD
249	Sopu	Sopu	SPH		Papua New Guinea	PG	-9.000000000000	147.766667000000	PGK
250	Nkayi	Nkayi	NKY		Congo	CG	-4.116667000000	14.266667000000	XAF
251	Norfolk	Norfolk (US) NE	OFK		USA	US	41.983333000000	-97.433333000000	USD
252	Ekati	Ekati	YOA		Canada	CA	64.700000000000	-110.616667000000	CAD
253	Esperance	Esperance	EPR		Australia	AU	-33.682222000000	121.822500000000	AUD
254	Airlie Beach/Shute Hbr	Airlie Beach/Shute Hbr	WSY		Australia	AU	-20.292222000000	148.783889000000	AUD
255	Chicago du Page County Apt	Chicago	DPA		USA	US	41.906944000000	-88.254167000000	USD
256	Tetlin	Tetlin	TEH		USA	US	63.133333000000	-142.516667000000	USD
257	Sturtevant Rail Station	Sturtevant Rail Station	ZTV		USA	US	42.699444000000	-87.914444000000	USD
258	St Mawgan Airport	Newquay	NQY		United Kingdom	GB	50.437450000000	-4.997922000000	GBP
259	Houlton International Airport	Houlton	HUL		United States	US	46.133333000000	-67.800000000000	USD
260	Mirecourt Airport	Epinal	EPL		France	FR	48.325832000000	6.069444000000	EUR
261	La Desirade	La Desirade	DSD		Guadeloupe	GP	16.333333000000	-61.016667000000	EUR
262	Foula	Foula	FOA		United Kingdom	GB	60.122222000000	-2.053611000000	GBP
263	Penzance	Penzance	PZE		United Kingdom	GB	50.128056000000	-5.518611000000	GBP
264	Newport Rail Station	Newport Rail Station	XNE		United Kingdom	GB	51.583333000000	-3.000000000000	GBP
265	Peterborough Rail Station	Peterborough Rail Station	XVH		United Kingdom	GB	52.583333000000	-1.250000000000	GBP
266	Labrea	Labrea	LBR		Brazil	BR	-7.278889000000	-64.769722000000	BRL
267	Libo City	Libo City	LLB		China	CN	25.452778000000	107.961944000000	RMB
268	Belaga	Belaga	BLG		Malaysia	MY	2.650000000000	113.766667000000	MYR
269	Esa'ala	Esa'ala	ESA		Papua New Guinea	PG	-9.883333000000	150.950000000000	PGK
270	Mount Cook Pukaki/Twizel Apt	Mount Cook	TWZ		New Zealand	NZ	-44.233333000000	170.116667000000	NZD
271	Bowling Green	Bowling Green	BWG		USA	US	36.966667000000	-86.416667000000	USD
272	Salina (US) UT	Salina (US) UT	SBO		USA	US	39.029167000000	-111.837500000000	USD
273	Gore Bay	Gore Bay	YZE		Canada	CA	45.916667000000	-82.466667000000	CAD
274	Les Angades Airport	Oujda	OUD		Morocco	MA	34.783333000000	-1.933333000000	MAD
275	Dabolim Airport	Goa	GOI		India	IN	15.384534000000	73.839825000000	INR
276	Mwanza Airport	Mwanza	MWZ		Tanzania	TZ	-2.441221000000	32.923225000000	TZS
277	Lokichogio	Lokichogio	LKG		Kenya	KE	4.204167000000	34.347222000000	KES
278	Shetland Islands Lerwick/Tingwall Apt	Shetland Islands	LWK		United Kingdom	GB	60.192222000000	-1.243611000000	GBP
279	Vejle Rail Station	Vejle	XVX		Denmark	DK	55.700000000000	9.533333000000	DKK
280	Minacu	Minacu	MQH		Brazil	BR	-13.548333000000	-48.195000000000	BRL
281	Xilinhot	Xilinhot	XIL		China	CN	43.915556000000	115.963333000000	RMB
282	Bandanaira	Bandanaira	NDA		Indonesia	ID	-4.533333000000	129.900000000000	IDR
283	Milingimbi Island	Milingimbi Island	MGT		Australia	AU	-12.094444000000	134.893611000000	AUD
284	Kananga	Kananga	KGA		Congo Democratic Republic of	CD	-5.900000000000	22.469167000000	CDF
285	Smyrna	Smyrna	MQY		USA	US	35.983333000000	-86.516667000000	USD
286	Stephenville	Stephenville	YJT		Canada	CA	48.544167000000	-58.550000000000	CAD
287	Vienna International Airport	Vienna	VIE		Austria	AT	48.119720000000	16.563583000000	EUR
288	Bournemouth Airport	Bournemouth	BOH		United Kingdom	GB	50.778269000000	-1.832476000000	GBP
289	Islas Malvinas Airport	Ushuaia	USH		Argentina	AR	-54.839347000000	-68.312449000000	ARS
290	Porto Santo Airport	Porto Santo	PXO		Portugal	PT	33.070023000000	-16.345015000000	EUR
291	The Bight	The Bight	TBI		Bahamas	BS	24.315556000000	-75.453611000000	BSD
292	Eday	Eday	EOI		United Kingdom	GB	59.190556000000	-2.772222000000	GBP
293	Portsmouth	Portsmouth	PME		United Kingdom	GB	50.833333000000	-1.050000000000	GBP
294	Ingolstadt Rail Station	Ingolstadt Rail Station	ZNQ		Germany	DE	48.744444000000	11.436944000000	EUR
295	El Arish	El Arish	AAC		Egypt	EG	31.073333000000	33.835833000000	EGP
296	Kuito	Kuito	SVP		Angola	AO	-12.400000000000	16.950000000000	AOA
297	Wasior	Wasior	WSR		Indonesia	ID	-2.766667000000	134.500000000000	IDR
298	Nuku Hiva	Nuku Hiva	NHV		French Polynesia	PF	-8.795556000000	-140.228889000000	XPF
299	N'djole	N'djole	KDJ		Gabon	GA	-0.250000000000	10.750000000000	XAF
300	Menominee	Menominee	MNM		USA	US	45.283333000000	-87.633333000000	USD
301	Pond Inlet	Pond Inlet	YIO		Canada	CA	72.690278000000	-77.968333000000	CAD
302	Ohrid Airport	Ohrid	OHD		Macedonia (FYROM)	MK	41.185000000000	20.743056000000	EUR
303	St. Petersburg-Clearwater International Airport	Saint Petersburg	PIE		United States	US	27.912005000000	-82.695109000000	USD
304	Taif Airport	Taif	TIF		Saudi Arabia	SA	21.480364000000	40.552685000000	SAR
305	Taldy Kurgan	Taldy Kurgan	TDK		Kazakhstan	KZ	45.150000000000	78.433333000000	KZT
306	Berlin Zoo Rail Station	Berlin	QWC		Germany	DE	52.508056000000	13.331389000000	EUR
307	Crewe Rail Station	Crewe Rail Station	XVC		United Kingdom	GB	53.083333000000	-2.450000000000	GBP
308	London Brit Rail Terminal	London Brit Rail Terminal	ZLX		United Kingdom	GB	12.944444000000	23.563333000000	GBP
309	Pato Branco	Pato Branco	PTO		Brazil	BR	-26.216667000000	-52.666667000000	BRL
310	Yulin	Yulin	UYN		China	CN	38.270000000000	109.730556000000	RMB
311	St. Augustine Airport	Saint Augustine	UST		USA	US	29.959324000000	-81.337850000000	USD
312	Chileka Airport	Blantyre	BLZ		Malawi	MW	-15.674722000000	34.970833000000	MWK
313	Islamabad International Airport	Islamabad	ISB		Pakistan	PK	33.609706000000	73.105104000000	PKR
314	Kirkenes NO	Kirkenes	KKN		Norway	NO	69.723500000000	29.891184000000	NOK
315	Flagstaff Pulliam Airport	Flagstaff	FLG		USA	US	35.137780000000	-111.671670000000	USD
316	Nicosia	Nicosia	NIC		Cyprus	CY	35.150000000000	33.266667000000	EUR
317	Lillestrom Rail Station	Lillestrom Rail Station	XKI		Norway	NO	59.952500000000	11.044444000000	NOK
318	Maues	Maues	MBZ		Brazil	BR	-3.416667000000	-57.666667000000	BRL
319	Taichung	Taichung	RMQ		Chinese Taipei	TW	24.265000000000	120.620833000000	TWD
320	Kebar	Kebar	KEQ		Indonesia	ID	-0.633333000000	133.116667000000	IDR
321	Ha'apai	Ha'apai	HPA		Tonga	TO	-19.778056000000	-174.341389000000	TOP
322	Wiluna	Wiluna	WUN		Australia	AU	-26.629167000000	120.220556000000	AUD
323	Devils Lake	Devils Lake	DVL		USA	US	48.115556000000	-98.908056000000	USD
324	Tok	Tok	TKJ		USA	US	63.329722000000	-142.954444000000	USD
325	Newport News Williamsburg Rail Station	Newport News Williamsburg Rail Station	ZWB		USA	US	37.280000000000	-76.693333000000	USD
326	Mcarthur River Mine	Mcarthur River Mine	MCV		Australia	AU	-16.442222000000	136.083056000000	AUD
327	Puerto Maldonado	Puerto Maldonado	PEM		Peru	PE	-12.616389000000	-69.229167000000	PEN
328	Teller Mission	Teller Mission	KTS		USA	US	65.332222000000	-166.467500000000	USD
329	Charlo	Charlo	YCL		Canada	CA	47.991389000000	-66.331389000000	CAD
330	Hamburg Airport	Hamburg	HAM		Germany	DE	53.631279000000	10.006414000000	EUR
331	Yap Airport	Yap, Caroline Islands	YAP		Micronesia	FM	9.497715000000	138.086730000000	USD
332	Niigata Airport	Niigata	KIJ		Japan	JP	37.951993000000	139.113250000000	JPY
333	Andizhan Airport	Andizhan	AZN		Uzbekistan	UZ	40.733334000000	72.300000000000	UZS
334	Morafenobe	Morafenobe	TVA		Madagascar	MG	-17.850000000000	44.916667000000	MGA
335	Eskilstuna C Rail Station	Eskilstuna C Rail Station	XFJ		Sweden	SE	59.369444000000	16.506389000000	SEK
336	Apucarana	Apucarana	APU		Brazil	BR	-23.550000000000	-51.483333000000	BRL
337	Iwo Jima	Iwo Jima	IWO		Japan	JP	24.783333000000	141.316667000000	JPY
338	Shillong	Shillong	SHL		India	IN	25.703611000000	91.977500000000	INR
339	Fangatau	Fangatau	FGU		French Polynesia	PF	-15.820000000000	-140.885833000000	XPF
340	Jaluit Island	Jaluit Island	UIT		Marshall Islands	MH	5.833333000000	169.616667000000	USD
341	Crane	Crane	CCG		USA	US	31.400000000000	-102.350000000000	USD
342	Sidney	Sidney	SDY		USA	US	47.705000000000	-104.196389000000	USD
343	Trail	Trail	YZZ		Canada	CA	49.055556000000	-117.609167000000	CAD
344	Habib Bourguiba International Airport	Monastir	MIR		Tunisia	TN	35.761083000000	10.753155000000	TND
345	Laoag Airport	Laoag	LAO		Philippines	PH	18.182408000000	120.534123000000	PHP
346	Orlando Sanford International Airport	Orlando	SFB		United States	US	28.775118000000	-81.243200000000	USD
347	Kulyab	Kulyab	TJU		Tajikistan	TJ	37.988333000000	69.805278000000	TJS
348	Amasya	Amasya	MZH		Turkey	TR	40.828611000000	35.520278000000	USD
349	Madrid Atocha Rail Station	Madrid	XOC		Spain	ES	40.405833000000	-3.690833000000	EUR
350	Governador Valadares	Governador Valadares	GVR		Brazil	BR	-18.895278000000	-41.982222000000	BRL
351	Beijing Nanyuan Apt	Beijing	NAY		China	CN	39.786389000000	116.386389000000	RMB
352	Jayapura	Jayapura	DJJ		Indonesia	ID	-2.576944000000	140.516389000000	IDR
353	Jabot	Jabot	JAT		Marshall Islands	MH	7.000000000000	168.983333000000	USD
354	La Chorrera	La Chorrera	LCR		Colombia	CO	-0.733333000000	-73.016667000000	COP
355	Hastings	Hastings	HSI		USA	US	40.600000000000	-98.433333000000	USD
356	Winnipeg Rail Station	Winnipeg	XEF		Canada	CA	49.889167000000	-97.134444000000	CAD
357	Valence Tgv Rail Station	Valence Tgv Rail Station	XHK		France	FR	44.991667000000	4.978611000000	EUR
358	East Midlands Airport	Leicestershire	EMA		United Kingdom	GB	52.825872000000	-1.330595000000	GBP
359	Lyon Saint-Exupery International Airport	Lyon	LYS		France	FR	45.721426000000	5.080334000000	EUR
360	Bournemouth Airport	Bournemouth	BOH		United Kingdom	GB	50.778269000000	-1.832476000000	GBP
361	Carrasco Airport	Montevideo	MVD		Uruguay	UY	-34.841154000000	-56.026466000000	UYU
362	Porto Santo Airport	Porto Santo	PXO		Portugal	PT	33.070023000000	-16.345015000000	EUR
363	Caye Chapel	Caye Chapel	CYC		Belize	BZ	17.683611000000	-88.045000000000	BZD
364	Eday	Eday	EOI		United Kingdom	GB	59.190556000000	-2.772222000000	GBP
365	Amersfoort Rail Station	Amersfoort Rail Station	QYM		Netherlands	NL	52.150000000000	5.400000000000	EUR
366	Dikson	Dikson	DKS		Russian Federation	RU	73.517222000000	80.376667000000	RUB
367	Illizi	Illizi	VVZ		Algeria	DZ	26.723611000000	8.622778000000	DZD
368	Dibrugarh	Dibrugarh	DIB		India	IN	27.483333000000	95.016667000000	INR
369	Bundaberg	Bundaberg	BDB		Australia	AU	-24.902500000000	152.320833000000	AUD
370	Penrhyn Island	Penrhyn Island	PYE		Cook Islands	CK	-9.006667000000	-158.036667000000	NZD
371	Podor	Podor	POD		Senegal	SN	16.666667000000	-14.966667000000	XOF
372	Oxnard/Ventura	Oxnard/Ventura	OXR		USA	US	34.200000000000	-119.200000000000	USD
373	Aupaluk	Aupaluk	YPJ		Canada	CA	59.295278000000	-69.600556000000	CAD
374	Barca Airport	Kosice	KSC		Slovakia	SK	48.666667000000	21.250000000000	EUR
375	Palo Negro Airport	Bucaramanga	BGA		Colombia	CO	7.128045000000	-73.181394000000	COP
376	Crotone Airport	Crotone	CRV		Italy	IT	38.996304000000	17.080778000000	EUR
377	Monterrey del Norte Apt	Monterrey	NTR		Mexico	MX	25.669444000000	-100.316667000000	MXN
378	Unst	Unst	UNT		United Kingdom	GB	60.750000000000	-0.850000000000	GBP
379	Crewe Rail Station	Crewe Rail Station	XVC		United Kingdom	GB	53.083333000000	-2.450000000000	GBP
380	London Brit Rail Terminal	London Brit Rail Terminal	ZLX		United Kingdom	GB	12.944444000000	23.563333000000	GBP
381	Uruguaiana	Uruguaiana	URG		Brazil	BR	-29.782222000000	-57.037500000000	BRL
382	Bazaruto Island	Bazaruto Island	BZB		Mozambique	MZ	-21.534722000000	35.491667000000	MZM
383	Chambery Airport	Chambery	CMF		France	FR	45.637994000000	5.884370000000	EUR
384	Norman Manley Airport	Kingston	KIN		Jamaica	JM	17.937750000000	-76.778158000000	JMD
385	Utapao Airport	Utapao	UTP		Thailand	TH	12.683333000000	101.016667000000	THB
386	Paros Airport	Paros	PAS		Greece	GR	37.066666000000	25.100000000000	EUR
387	Nassau Paradise Island	Nassau	PID		Bahamas	BS	25.033333000000	-77.466667000000	BSD
388	Best Bus Station	Best Bus Station	QWZ		Netherlands	NL	51.513333000000	5.396111000000	EUR
389	Ustaoset Rail Station	Ustaoset Rail Station	XUX		Norway	NO	60.496111000000	8.045000000000	NOK
390	Ribeirao Preto	Ribeirao Preto	RAO		Brazil	BR	-21.134167000000	-47.774167000000	BRL
391	Won-ju	Won-ju	WJU		Korea Republic of	KR	37.438056000000	127.960278000000	KRW
392	Marudi	Marudi	MUR		Malaysia	MY	4.179444000000	114.327500000000	MYR
393	Kununurra	Kununurra	KNX		Australia	AU	-15.778056000000	128.707500000000	AUD
394	Barrancabermeja	Barrancabermeja	EJA		Colombia	CO	7.024444000000	-73.806667000000	COP
395	Gordonsville	Gordonsville	GVE		USA	US	38.150000000000	-78.166667000000	USD
396	Churchill Rail Station	Churchill	XAD		Canada	CA	58.766944000000	-94.172500000000	CAD
397	Calais/Dunkerque Calais-Frethum Rr Stn	Calais/Dunkerque Calais-Frethum Rr Stn	XFF		France	FR	50.901667000000	1.811389000000	EUR
398	Napuka Island	Napuka Island	NAU		French Polynesia	PF	-14.176944000000	-141.267222000000	XPF
399	Valledupar	Valledupar	VUP		Colombia	CO	10.435000000000	-73.249444000000	COP
400	Milford	Milford	MLF		USA	US	38.433333000000	-113.016667000000	USD
401	Chevery	Chevery	YHR		Canada	CA	50.468889000000	-59.636667000000	CAD
402	Birgi Airport	Trapani	TPS		Italy	IT	37.901385000000	12.495865000000	EUR
403	Sebha Airport	Sebha	SEB		Libyan Arab Jamahiriya	LY	27.016667000000	14.462500000000	LYD
404	Bengaluru International Airport	Bangalore	BLR		India	IN	13.198889000000	77.705556000000	INR
405	Southeast Texas Regional Airport	Beaumont	BPT		United States	US	29.950832000000	-94.020000000000	USD
406	Berlevag	Berlevag	BVG		Norway	NO	70.871111000000	29.028889000000	NOK
407	Oppdal Rail Station	Oppdal Rail Station	XOD		Norway	NO	62.592500000000	9.693611000000	NOK
408	Encarnacion	Encarnacion	ENO		Paraguay	PY	-27.300000000000	-55.916667000000	PYG
409	Lianyungang	Lianyungang	LYG		China	CN	34.571944000000	118.873889000000	RMB
410	Kendari	Kendari	KDI		Indonesia	ID	-4.081667000000	122.418333000000	IDR
411	Huahine	Huahine	HUH		French Polynesia	PF	-16.687222000000	-151.021667000000	XPF
412	West Wyalong	West Wyalong	WWY		Australia	AU	-33.937222000000	147.191389000000	AUD
413	Kearney	Kearney	EAR		USA	US	40.726667000000	-99.009167000000	USD
414	Tatalina	Tatalina	TLJ		USA	US	62.895556000000	-155.977778000000	USD
415	Wollaston Lake	Wollaston Lake	ZWL		Canada	CA	58.116667000000	-103.158333000000	CAD
416	Victoria International Airport	Victoria	YYJ		Canada	CA	48.640267000000	-123.430963000000	CAD
417	Abu Dhabi International Airport	Abu Dhabi	AUH		United Arab Emirates	AE	24.426912000000	54.645974000000	AED
418	M. A. Grottag Airport	Taranto	TAR		Italy	IT	40.517776000000	17.401943000000	EUR
419	Nueva Guinea	Nueva Guinea	NVG		Nicaragua	NI	11.666667000000	-84.450000000000	NIO
420	York Rail Station	York Rail Station	QQY		United Kingdom	GB	53.966667000000	-1.083333000000	GBP
421	Madrid Atocha Rail Station	Madrid	XOC		Spain	ES	40.405833000000	-3.690833000000	EUR
422	Cacoal	Cacoal	OAL		Brazil	BR	-11.433056000000	-61.477778000000	BRL
423	Tengchong	Tengchong	TCZ		China	CN	24.937778000000	98.485556000000	RMB
424	Pulau Layang-Layang	Pulau Layang-Layang	LAC		Malaysia	MY	7.400000000000	113.850000000000	MYR
425	Yalumet	Yalumet	KYX		Papua New Guinea	PG	-6.133333000000	146.600000000000	PGK
426	Saravena	Saravena	RVE		Colombia	CO	6.951944000000	-71.857222000000	COP
427	Chignik Bay Apt	Chignik	KBW		USA	US	56.283333000000	-158.383333000000	USD
428	Casselman Rail Station	Casselman Rail Station	XZB		Canada	CA	45.316667000000	-75.083333000000	CAD
429	Gomel Airport	Gomel	GME		Belarus	BY	52.416667000000	31.000000000000	BYR
430	Rejon Airport	Merida	MID		Mexico	MX	20.933822000000	-89.663748000000	MXN
431	Bonriki Airport	Tarawa	TRW		Kiribati	KI	1.358333000000	172.941667000000	AUD
432	Ciudad Victoria	Ciudad Victoria	CVM		Mexico	MX	23.703333000000	-98.956389000000	MXN
433	Tarragona/Camp Rail Station	Tarragona/Camp Rail Station	QGN		Spain	ES	41.191944000000	1.272778000000	EUR
434	Newark Northgate Rail Station	Newark Northgate Rail Station	XNK		United Kingdom	GB	53.083333000000	-0.013611000000	GBP
435	Batagay	Batagay	BQJ		Russian Federation	RU	67.647778000000	134.693333000000	RUB
436	Anadyr	Anadyr	DYR		Russian Federation	RU	64.735000000000	177.741389000000	RUB
437	Jaisalmer	Jaisalmer	JSA		India	IN	26.888611000000	70.865000000000	INR
438	Cootamundra	Cootamundra	CMD		Australia	AU	-34.633333000000	148.050000000000	AUD
439	Swan Hill	Swan Hill	SWH		Australia	AU	-35.383333000000	143.550000000000	AUD
440	Anniston Municipal Apt	Anniston	ANB		USA	US	33.588333000000	-85.858333000000	USD
441	Copper Mountain Van Station	Copper Mountain Van Station	QCE		USA	US	39.772222000000	-104.883333000000	USD
442	Thicket Portage	Thicket Portage	YTD		Canada	CA	55.318889000000	-97.707222000000	CAD
443	Guernsey Airport	Guernsey	GCI		United Kingdom	GB	49.432756000000	-2.595044000000	GBP
444	Sangster International Airport	Montego Bay	MBJ		Jamaica	JM	18.498464000000	-77.916632000000	JMD
445	Hat Yai Airport	Hat Yai	HDY		Thailand	TH	6.936764000000	100.393566000000	THB
446	Araxos Airport	Patras	GPA		Greece	GR	38.250000000000	21.733334000000	EUR
447	Bonanza	Bonanza	BZA		Nicaragua	NI	13.950000000000	-84.600000000000	NIO
448	Soria Rail Station	Soria Rail Station	RII		Spain	ES	41.755000000000	-2.476667000000	EUR
449	London Victoria Rail Station	London Victoria Rail Station	ZEP		United Kingdom	GB	51.495000000000	-0.144722000000	GBP
450	Santa Terezinha	Santa Terezinha	STZ		Brazil	BR	-10.464444000000	-50.052778000000	BRL
451	Malange	Malange	MEG		Angola	AO	-9.533333000000	16.333333000000	AOA
452	Tembagapura	Tembagapura	TIM		Indonesia	ID	-4.528333000000	136.887500000000	IDR
453	Ofu	Ofu	OFU		American Samoa	AS	-14.183333000000	-169.700000000000	USD
454	Saposoa	Saposoa	SQU		Peru	PE	-6.950000000000	-76.750000000000	PEN
455	Kullorsuaq	Kullorsuaq	KHQ		Greenland	GL	74.579444000000	-57.235556000000	DKK
456	Maple Bay	Maple Bay	YAQ		Canada	CA	48.816667000000	-123.616667000000	CAD
457	Khost Airport	Khost	KHT		Afghanistan	AF	33.336575000000	69.960070000000	USD
458	Jomo Kenyatta International Airport	Nairobi	NBO		Kenya	KE	-1.319167000000	36.925781000000	KES
459	Hangzhou Xiaoshan International Airport	Hangzhou	HGH		China	CN	30.236934000000	120.432356000000	RMB
460	Tiree Airport	Tiree	TRE		United Kingdom	GB	56.500557000000	-6.871389000000	GBP
461	Ryan Airport	Baton Rouge	BTR		USA	US	30.532537000000	-91.156906000000	USD
462	Tambohorano	Tambohorano	WTA		Madagascar	MG	-17.483333000000	43.966667000000	MGA
463	Durham Rail Station	Durham Rail Station	XVU		United Kingdom	GB	54.783333000000	-1.566667000000	GBP
464	Bryansk	Bryansk	BZK		Russian Federation	RU	53.269722000000	34.336667000000	RUB
465	Delma Island	Delma Island	ZDY		United Arab Emirates	AE	24.471667000000	54.376111000000	AED
466	Springbok	Springbok	SBU		South Africa	ZA	-29.683333000000	17.950000000000	ZAR
467	Cloncurry	Cloncurry	CNJ		Australia	AU	-20.668611000000	140.504444000000	AUD
468	Quilpie	Quilpie	ULP		Australia	AU	-26.609444000000	144.258056000000	AUD
469	Caldwell	Caldwell	CDW		USA	US	40.875278000000	-74.280833000000	USD
470	Skagway	Skagway	SGY		USA	US	59.460556000000	-135.316389000000	USD
471	Bella Bella	Bella Bella	ZEL		Canada	CA	52.184722000000	-128.156667000000	CAD
472	Exeter Airport	Exeter	EXT		United Kingdom	GB	50.731109000000	-3.410968000000	GBP
473	Benito Juarez International Airport	Mexico City	MEX		Mexico	MX	19.435278000000	-99.072778000000	MXN
474	Norfolk Island Airport	Norfolk Island	NLK		Norfolk Island	NF	-29.042500000000	167.939444000000	AUD
475	Chico Municipal Airport	Chico	CIC		United States	US	39.798700000000	-121.854000000000	USD
476	Oslo Fornebu Apt	Oslo	FBU		Norway	NO	59.900000000000	10.616667000000	NOK
477	Burgos	Burgos	RGS		Spain	ES	42.357500000000	-3.620833000000	EUR
478	Wakefield Westgate Rail Station	Wakefield Westgate Rail Station	XWD		United Kingdom	GB	53.700000000000	-1.483333000000	GBP
479	Taganrog	Taganrog	TGK		Russian Federation	RU	47.195000000000	38.855000000000	RUB
480	Golmud	Golmud	GOQ		China	CN	36.400556000000	94.788333000000	RMB
481	Lamidanda	Lamidanda	LDN		Nepal	NP	27.252778000000	86.671944000000	NPR
482	Cape Vogel	Cape Vogel	CVL		Papua New Guinea	PG	-9.700000000000	150.050000000000	PGK
483	Barakoma	Barakoma	VEV		Solomon Islands	SB	-7.916667000000	156.700000000000	SBD
484	Crane Island	Crane Island	CKR		USA	US	48.598056000000	-122.998056000000	USD
485	St Michael	St Michael	SMK		USA	US	63.481111000000	-162.030833000000	USD
486	Jenpeg	Jenpeg	ZJG		Canada	CA	54.600000000000	-97.666667000000	CAD
487	Asturias Airport	Asturias	OVD		Spain and Canary Islands	ES	43.558910000000	-6.032094000000	EUR
488	Wilkes-Barre International Airport	Wilkes-Barre	AVP		United States	US	41.336698000000	-75.730643000000	USD
489	Kidlington Airport	Oxford	OXF		United Kingdom	GB	51.766666000000	-1.250000000000	GBP
490	Trenton Mercer Airport	Township	TTN		United States	US	40.278057000000	-74.812500000000	USD
491	Edremit	Edremit	EDO		Turkey	TR	39.554722000000	27.013889000000	USD
492	Wolverhampton Rail Station	Wolverhampton Rail Station	XVW		United Kingdom	GB	52.600000000000	-2.133333000000	GBP
493	Szeged Bus Station	Szeged Bus Station	QZD		Hungary	HU	46.250000000000	20.166667000000	HUF
494	Tan Tan	Tan Tan	TTA		Morocco	MA	28.448333000000	-11.161389000000	MAD
495	Dadu	Dadu	DDU		Pakistan	PK	26.738056000000	67.667222000000	PKR
496	Marseille Airport	Marseille	MRS		France	FR	43.441780000000	5.222137000000	EUR
497	Bristol Airport	Bristol	BRS		United Kingdom	GB	51.386756000000	-2.710659000000	GBP
498	Punta Del Este Airport	Punta Del Este	PDP		Uruguay	UY	-34.914444000000	-54.919167000000	UYU
499	Volgograd Airport	Volgograd	VOG		Russian Federation	RU	48.792000000000	44.354805000000	RUB
500	Minsk International 2 Airport	Minsk	MSQ		Belarus	BY	53.889725000000	28.032442000000	BYR
501	Exeter Airport	Exeter	EXT		United Kingdom	GB	50.731109000000	-3.410968000000	GBP
502	Fort Lauderdale-Hollywood International Airport	Fort Lauderdale	FLL		United States	US	26.071492000000	-80.144908000000	USD
503	Anfa Airport	Casablanca	CAS		Morocco	MA	33.559723000000	-7.663056000000	MAD
504	Culebra	Culebra	CPX		Puerto Rico	PR	18.312500000000	-65.303056000000	USD
505	Landskrona	Landskrona	JLD		Sweden	SE	55.950000000000	12.866667000000	SEK
506	Vitoria Rail Station	Vitoria Rail Station	VIO		Spain	ES	42.841389000000	-2.672500000000	EUR
507	Wakefield Westgate Rail Station	Wakefield Westgate Rail Station	XWD		United Kingdom	GB	53.700000000000	-1.483333000000	GBP
508	Vilhena	Vilhena	BVH		Brazil	BR	-12.694444000000	-60.098333000000	BRL
509	Jiaxing Rail Station	Jiaxing Rail Station	JXS		China	CN	30.692778000000	120.795833000000	RMB
510	Tumlingtar	Tumlingtar	TMI		Nepal	NP	27.316667000000	87.193333000000	NPR
511	Geraldton (AU)	Geraldton (AU)	GET		Australia	AU	-28.796667000000	114.706389000000	AUD
512	Biloela	Biloela	ZBL		Australia	AU	-24.400000000000	150.500000000000	AUD
513	Eastsound	Eastsound	ESD		USA	US	48.707500000000	-122.910833000000	USD
514	Upernavik Kujalleq Heliport	Upernavik Kujalleq Heliport	UPK		Greenland	GL	72.152778000000	-55.531111000000	DKK
515	Rijeka Airport	Rijeka	RJK		Croatia	HR	45.215830000000	14.568333000000	EUR
516	Krivoy Rog Airport	Krivoy Rog	KWG		Ukraine	UA	48.050000000000	33.216667000000	UAH
517	Jose Joaquin de Olmedo Airport	Guayaquil	GYE		Ecuador	EC	-2.142654000000	-79.880321000000	USD
518	Kidlington Airport	Oxford	OXF		United Kingdom	GB	51.766666000000	-1.250000000000	GBP
519	Grand Canyon West Airport	Peach Springs	GCW		United States	US	35.988804000000	-113.815674000000	USD
520	Isafjordur	Isafjordur	IFJ		Iceland	IS	66.058056000000	-23.135278000000	ISK
521	Wolverhampton Rail Station	Wolverhampton Rail Station	XVW		United Kingdom	GB	52.600000000000	-2.133333000000	GBP
522	Altamira	Altamira	ATM		Brazil	BR	-3.253889000000	-52.253889000000	BRL
523	Yerbogachen	Yerbogachen	ERG		Russian Federation	RU	61.275000000000	108.030000000000	RUB
524	Khuzdar	Khuzdar	KDD		Pakistan	PK	27.783333000000	66.633333000000	PKR
525	Dublin Airport	Dublin	DUB		Ireland	IE	53.427280000000	-6.243570000000	EUR
526	Bristol Airport	Bristol	BRS		United Kingdom	GB	51.386756000000	-2.710659000000	GBP
527	Shanghai Pudong International Airport	Shanghai	PVG		China	CN	31.151824000000	121.799808000000	RMB
528	Santa Cruz Airport	Flores Island	FLW		Portugal	PT	39.466667000000	-31.150000000000	EUR
529	Cananea	Cananea	CNA		Mexico	MX	30.983333000000	-110.266667000000	MXN
530	Hamburg Bus Station	Hamburg Bus Station	OBZ		Germany	DE	53.920000000000	10.019722000000	EUR
531	Deputatsky	Deputatsky	DPT		Russian Federation	RU	69.392500000000	139.890278000000	RUB
532	Fuyang	Fuyang	FUG		China	CN	32.880833000000	115.733611000000	RMB
533	Katugastota	Katugastota	KDZ		Sri Lanka	LK	7.326667000000	80.641667000000	LKR
534	Fane	Fane	FNE		Papua New Guinea	PG	-8.600000000000	147.233333000000	PGK
535	Darwin Rail Station	Darwin	XJG		Australia	AU	-12.384722000000	130.736111000000	AUD
536	Eagle River	Eagle River	EGV		USA	US	45.933333000000	-89.266667000000	USD
537	Tasiussaq Heliport	Tasiussaq Heliport	TQA		Greenland	GL	73.373056000000	-56.060278000000	DKK
538	Hartford Rail Station	Hartford Rail Station	ZZA		USA	US	36.750000000000	4.400000000000	USD
539	Meselia	Meselia	MFZ		Papua New Guinea	PG	-6.133333000000	149.116667000000	PGK
540	Agadez	Agadez	AJY		Niger	NE	16.962500000000	7.990278000000	XOF
541	Kwethluk	Kwethluk	KWT		USA	US	60.793611000000	-161.441944000000	USD
542	Clyde River	Clyde River	YCY		Canada	CA	70.486111000000	-68.516667000000	CAD
543	Kaunas Airport	Kaunas	KUN		Lithuania	LT	54.900000000000	23.916667000000	LTL
544	Laredo International Airport	Laredo	LRD		United States	US	27.543667000000	-99.455122000000	USD
545	HarstadNarvik Airport, Evenes	Harstad-Narvik	EVE		Norway	NO	68.496666000000	16.679722000000	NOK
546	Terre-de-Haut	Terre-de-Haut	LSS		Guadeloupe	GP	15.864444000000	-61.580556000000	EUR
547	Bayreuth	Bayreuth	BYU		Germany	DE	49.984444000000	11.638611000000	EUR
548	Siena	Siena	SAY		Italy	IT	43.258611000000	11.255000000000	EUR
549	St Petersburg Rzhevka	St. Petersburg	RVH		Russian Federation	RU	59.983333000000	30.600000000000	RUB
550	Beloyarsky	Beloyarsky	EYK		Russian Federation	RU	63.690556000000	66.699722000000	RUB
551	Kadhdhoo	Kadhdhoo	KDO		Maldives	MV	1.858333000000	73.519722000000	MVR
552	Fera Island	Fera Island	FRE		Solomon Islands	SB	-8.107500000000	159.577222000000	SBD
553	Useless Loop	Useless Loop	USL		Australia	AU	-25.966667000000	113.116667000000	AUD
554	Coffee Point	Coffee Point	CFA		USA	US	58.230556000000	-157.500000000000	USD
555	Sheridan	Sheridan	SHR		USA	US	44.769167000000	-106.980278000000	USD
556	Fond du Lac	Fond du Lac	ZFD		Canada	CA	59.316667000000	-107.166667000000	CAD
557	Barcelona-El Prat Airport	Barcelona	BCN		Spain and Canary Islands	ES	41.303027000000	2.075930000000	EUR
558	Wilmington International Airport	Wilmington	ILM		United States	US	34.267052000000	-77.910627000000	USD
559	Karlstad Airport	Karlstad	KSD		Sweden	SE	59.360283000000	13.472059000000	SEK
560	Bimini North SPB	Bimini	NSB		Bahamas	BS	25.775000000000	-79.250000000000	BSD
561	Coventry	Coventry	CVT		United Kingdom	GB	52.369722000000	-1.479722000000	GBP
562	Holstebro Bus Station	Holstebro Bus Station	QWO		Denmark	DK	56.350000000000	8.633333000000	DKK
563	Cabo Frio	Cabo Frio	CFB		Brazil	BR	-22.925000000000	-42.078611000000	BRL
564	Kikaiga Shima	Kikaiga Shima	KKX		Japan	JP	28.316667000000	129.933333000000	JPY
565	Zaranj	Zaranj	ZAJ		Afghanistan	AF	30.971389000000	61.866389000000	USD
566	Dillons Bay	Dillons Bay	DLY		Vanuatu	VU	-18.770556000000	169.003889000000	VUV
567	Walgett	Walgett	WGE		Australia	AU	-30.033333000000	148.133333000000	AUD
568	Tshikapa	Tshikapa	TSH		Congo Democratic Republic of	CD	-6.441667000000	20.796389000000	CDF
569	Parkersburg/Marietta	Parkersburg/Marietta	PKB		USA	US	39.345000000000	-81.439167000000	USD
570	Bloomfield Airport	Bloomfield	BFC		Australia	AU	-15.871359000000	145.326770000000	AUD
571	V.C. Bird International Airport	Antigua	ANU		Antigua and Barbuda	AG	17.108333000000	-61.763889000000	XCD
572	Kuching Airport	Kuching	KCH		Malaysia	MY	1.484167000000	110.340833000000	MYR
573	Kjaerstad Airport	Mosjoen	MJF		Norway	NO	65.784390000000	13.218328000000	NOK
574	Roberts Field	Redmond	RDM		United States	US	44.254272000000	-121.162895000000	USD
575	Ambatondrazaka	Ambatondrazaka	WAM		Madagascar	MG	-17.800000000000	48.433333000000	MGA
576	Logrono Rail Station	Logrono Rail Station	LGV		Spain	ES	42.457500000000	-2.442222000000	EUR
577	Derby Rail Station	Nottingham	XQH		United Kingdom	GB	52.916667000000	-1.500000000000	GBP
578	Juiz de Fora	Juiz de Fora	JDF		Brazil	BR	-21.791389000000	-43.386667000000	BRL
579	Yonaguni Jima	Yonaguni Jima	OGN		Japan	JP	24.466944000000	122.977778000000	JPY
580	Genting	Genting	GTB		Malaysia	MY	3.416667000000	101.800000000000	MYR
581	Cloudbreak	Cloudbreak	KFE		Australia	AU	-22.291111000000	119.438333000000	AUD
582	Magangue	Magangue	MGN		Colombia	CO	9.266667000000	-74.883333000000	COP
583	Ilford	Ilford	ILF		Canada	CA	56.051667000000	-95.620278000000	CAD
584	Quebec Ste Foy Rail Station	Quebec	XFY		Canada	CA	46.783333000000	-71.283333000000	CAD
585	Turany Airport	Brno	BRQ		Czech Republic	CZ	49.150000000000	16.700000000000	CZK
586	Corn Island Airport	Corn Island	RNI		Nicaragua	NI	12.150000000000	-83.066667000000	NIO
587	Alta Airport	Alta	ALF		Norway	NO	69.977165000000	23.355808000000	NOK
588	Balhash	Balhash	BXH		Kazakstan	KZ	46.883333000000	75.016667000000	KZT
589	Fort William Heliport	Fort William Heliport	FWM		United Kingdom	GB	56.816667000000	-5.116667000000	GBP
590	Stronsay	Stronsay	SOY		United Kingdom	GB	59.155278000000	-2.641944000000	GBP
591	Lancaster Rail Station (GB)	Lancaster Rail Station (GB)	XQL		United Kingdom	GB	54.050000000000	-2.800000000000	GBP
592	Oiapoque	Oiapoque	OYK		Brazil	BR	3.866667000000	-51.800000000000	BRL
593	Tainan	Tainan	TNN		Chinese Taipei	TW	22.950278000000	120.205833000000	TWD
594	Larantuka	Larantuka	LKA		Indonesia	ID	-8.350000000000	122.983333000000	IDR
595	Leigh Creek	Leigh Creek	LGH		Australia	AU	-30.583333000000	138.416667000000	AUD
596	Sogamoso	Sogamoso	SOX		Colombia	CO	5.683333000000	-72.950000000000	COP
597	Grayling	Grayling	KGX		USA	US	62.897778000000	-160.067222000000	USD
598	Sault Ste Marie	Sault Ste Marie (CA)	YAM		Canada	CA	46.485000000000	-84.509444000000	CAD
599	Marcillac Airport	Rodez	RDZ		France	FR	44.410594000000	2.483866000000	EUR
600	Leeds/Bradford Airport	Leeds	LBA		United Kingdom	GB	53.869339000000	-1.659985000000	GBP
601	Cyril E. King Airport	Saint Thomas	STT		U.S. Virgin Islands	VI	18.337500000000	-64.969444000000	USD
602	Hasanudin Airport	Ujung Pandang	UPG		Indonesia	ID	-5.058312000000	119.545889000000	IDR
603	Montgomery Regional (Dannelly Field) Airport	Montgomery	MGM		United States	US	32.305042000000	-86.390290000000	USD
604	Bury St Edmunds	Bury St Edmunds	BEQ		United Kingdom	GB	52.350000000000	0.766667000000	GBP
605	Vojens Airport	Vojens	SKS		Denmark	DK	55.225556000000	9.263889000000	DKK
606	Guetersloh Rail Station	Guetersloh Rail Station	ZEX		Germany	DE	51.900000000000	8.383333000000	EUR
607	Ataq	Ataq	AXK		Yemen	YE	14.552222000000	46.825556000000	YER
608	Lichinga	Lichinga	VXC		Mozambique	MZ	-13.273889000000	35.266389000000	MZM
609	Wanigela	Wanigela	AGL		Papua New Guinea	PG	-9.333333000000	149.150000000000	PGK
610	Rongelap Island	Rongelap Island	RNP		Marshall Islands	MH	11.150000000000	166.883333000000	USD
611	Matadi	Matadi	MAT		Congo Democratic Republic of	CD	-5.800000000000	13.433333000000	CDF
612	San Diego Montgomery Field	San Diego	MYF		USA	US	32.800000000000	-117.133333000000	USD
613	Lansdowne House	Lansdowne House	YLH		Canada	CA	52.195556000000	-87.933333000000	CAD
614	Tromso/Langnes Airport	Tromso	TOS		Norway	NO	69.679835000000	18.907343000000	NOK
615	Massawa Airport	Massawa	MSW		Eritrea	ER	15.603333000000	39.441111000000	ERN
616	Qingdao Airport	Qingdao	TAO		China	CN	36.265884000000	120.382361000000	RMB
617	Petropavlovsk-Kamchatsky Airport	Petropavlovsk-Kamchatsky	PKC		Russia	RU	53.016666000000	158.650000000000	RUB
618	Ciudad Juarez	Ciudad Juarez	CJS		Mexico	MX	31.636111000000	-106.428611000000	MXN
619	Ingolstadt	Ingolstadt	IGS		Germany	DE	48.715556000000	11.533889000000	EUR
620	Isles of Scilly Tresco Heliport	Isles of Scilly	TSO		United Kingdom	GB	49.945556000000	-6.331389000000	GBP
621	Chesterfield Bus Station	Chesterfield Bus Station	ZFI		United Kingdom	GB	53.250000000000	-1.416667000000	GBP
622	Ovalle	Ovalle	OVL		Chile	CL	-30.400000000000	-71.200000000000	CLP
623	Nagoya Komaki Airport	Nagoya	NKM		Japan	JP	35.255000000000	136.924444000000	JPY
624	El Nido	El Nido	ENI		Philippines	PH	11.205556000000	119.412778000000	PHP
625	Kalbarri	Kalbarri	KAX		Australia	AU	-27.692778000000	114.259167000000	AUD
626	Puerto Leguizamo	Puerto Leguizamo	LQM		Colombia	CO	-0.182222000000	-74.770833000000	COP
627	Hollis	Hollis	HYL		USA	US	55.480833000000	-132.651944000000	USD
628	Stratford Rail Station	Stratford Rail Station	XFD		Canada	CA	43.364722000000	-80.976667000000	CAD
629	Thalerhof Airport	Graz	GRZ		Austria	AT	46.994124000000	15.444928000000	EUR
630	Liverpool John Lennon Airport	Liverpool	LPL		United Kingdom	GB	53.337616000000	-2.854905000000	GBP
631	Henry E. Rohlsen Airport	Saint Croix	STX		U.S. Virgin Islands	VI	17.701944000000	-64.798611000000	USD
632	Kaohsiung International Airport	Kaohsiung	KHH		Republic of China Taiwan	TW	22.572500000000	120.345278000000	TWD
633	Dothan Regional Airport	Dothan	DHN		United States	US	31.320000000000	-85.448330000000	USD
634	Benson	Benson	BEX		United Kingdom	GB	51.616667000000	-1.083333000000	GBP
635	Puerto De Santa Maria Rail Station	Puerto De Santa Maria Rail Station	PXS		Spain	ES	36.600000000000	-6.233333000000	EUR
636	Rygge Rail Station	Rygge Rail Station	ZXU		Norway	NO	59.380833000000	10.749722000000	NOK
637	Kenitra	Kenitra	NNA		Morocco	MA	34.250000000000	-6.616667000000	MAD
638	Bentota River	Bentota River	BJT		Sri Lanka	LK	6.416667000000	79.983333000000	LKR
639	Ceduna	Ceduna	CED		Australia	AU	-32.130556000000	133.709722000000	AUD
640	Sofia Airport	Sofia	SOF		Bulgaria	BG	42.688342000000	23.414431000000	EUR
641	London Heathrow Airport	London	LHR		United Kingdom	GB	51.469603000000	-0.453566000000	GBP
642	Eduardo Gomes Airport	Ilheus	IOS		Brazil	BR	-14.813889000000	-39.030000000000	BRL
643	Sao Jorge Island Airport	Sao Jorge Island	SJZ		Portugal	PT	38.664616000000	-28.168430000000	EUR
644	Isla Mujeres	Isla Mujeres	ISJ		Mexico	MX	21.266667000000	-86.750000000000	MXN
645	London Biggin Hill Apt	London (GB)	BQH		United Kingdom	GB	51.330833000000	0.032222000000	GBP
646	Sorrento	Sorrento	RRO		Italy	IT	40.630000000000	14.376944000000	EUR
647	Hassleholm Rail Station	Hassleholm Rail Station	XWP		Sweden	SE	56.157778000000	13.763611000000	SEK
648	Sao Jose Dos Campos	Sao Jose Dos Campos	SJK		Brazil	BR	-23.228056000000	-45.862778000000	BRL
649	Kleinzee	Kleinzee	KLZ		South Africa	ZA	-29.683333000000	17.066667000000	ZAR
650	Bamaga	Bamaga	ABM		Australia	AU	-10.950833000000	142.459444000000	AUD
651	Renmark	Renmark	RMK		Australia	AU	-34.200000000000	140.683333000000	AUD
652	Tidjikja	Tidjikja	TIY		Mauritania	MR	18.550000000000	-11.433333000000	MRO
653	Pine Mountain	Pine Mountain	PIM		USA	US	32.833333000000	-84.850000000000	USD
654	Yarmouth	Yarmouth	YQI		Canada	CA	43.833333000000	-66.083333000000	CAD
655	Ibiza Airport	Ibiza	IBZ		Spain and Canary Islands	ES	38.876595000000	1.367803000000	EUR
656	Maputo International Airport	Maputo	MPM		Mozambique	MZ	-25.924388000000	32.574290000000	MZM
657	Multan Airport	Multan	MUX		Pakistan	PK	30.199507000000	71.414978000000	PKR
658	Kokkola-Pietarsaari Airport	Kokkola	KOK		Finland	FI	63.718838000000	23.133068000000	EUR
659	Petersburg James A Johnson Airport	Petersburg	PSG		United States	US	56.804170000000	-132.942500000000	USD
660	Milan Porta Garibaldi Rail Stn	Milan Porta Garibaldi Rail Stn	IPR		Italy	IT	45.484722000000	9.187778000000	EUR
661	Bryne Rail Station	Bryne Rail Station	XOB		Norway	NO	58.734167000000	5.648611000000	NOK
662	Montes Claros	Montes Claros	MOC		Brazil	BR	-16.706944000000	-43.818889000000	BRL
663	Mokpo	Mokpo	MPK		Korea Republic of	KR	34.758889000000	126.380000000000	KRW
664	Catarman	Catarman	CRM		Philippines	PH	12.502500000000	124.635833000000	PHP
665	Sevilla Airport	Sevilla	SVQ		Spain and Canary Islands	ES	37.423476000000	-5.900136000000	EUR
666	Ouagadougou Airport	Ouagadougou	OUA		Burkina Faso	BF	12.355019000000	-1.514283000000	XOF
667	Husein Sastranegara Airport	Bandung	BDO		Indonesia	ID	-6.904648000000	107.581779000000	IDR
668	Roma Airport	Roma	RMA		Australia	AU	-26.543552000000	148.779430000000	AUD
669	Celaya	Celaya	CYW		Mexico	MX	20.546111000000	-100.886667000000	MXN
670	Bembridge	Bembridge	BBP		United Kingdom	GB	50.678056000000	-1.109167000000	GBP
671	Rorvik	Rorvik	RVK		Norway	NO	64.834167000000	11.135556000000	NOK
672	Santander Rail Station	Santander Rail Station	YJL		Spain	ES	43.457778000000	-3.812222000000	EUR
673	Rio Mayo	Rio Mayo	ROY		Argentina	AR	-45.704722000000	-70.258611000000	ARS
674	Shonai	Shonai	SYO		Japan	JP	38.812222000000	139.787222000000	JPY
675	Ketapang	Ketapang	KTG		Indonesia	ID	-1.816667000000	109.963611000000	IDR
676	Mili Island	Mili Island	MIJ		Marshall Islands	MH	6.083333000000	171.750000000000	USD
677	Riberalta	Riberalta	RIB		Bolivia	BO	-11.010556000000	-66.073611000000	BOB
678	Jackson (US) MI	Jackson (US) MI	JXN		USA	US	42.259444000000	-84.461667000000	USD
679	Tadoule Lake	Tadoule Lake	XTL		Canada	CA	58.701389000000	-98.502222000000	CAD
680	Beru	Beru	BEZ		Kiribati	KI	-1.333333000000	176.000000000000	AUD
681	Tabiteuea North	Tabiteuea North	TBF		Kiribati	KI	-1.233333000000	174.783333000000	AUD
682	Astoria	Astoria	AST		USA	US	46.166667000000	-123.883333000000	USD
683	Breckenridge Van Station	Breckenridge Van Station	QKB		USA	US	39.769444000000	-104.883333000000	USD
684	Hall Beach	Hall Beach	YUX		Canada	CA	68.776111000000	-81.243611000000	CAD
685	Brnik Airport	Ljubljana	LJU		Slovenia	SI	46.231020000000	14.454972000000	EUR
686	Express Airport	Toledo	TOL		United States	US	41.592497000000	-83.806898000000	USD
687	St. Mary's Airport	Isles Of Scilly	ISC		United Kingdom	GB	49.913334000000	-6.291667000000	GBP
688	Bismarck Municipal Airport	Bismarck	BIS		United States	US	46.774480000000	-100.758210000000	USD
689	Canakkale	Canakkale	CKZ		Turkey	TR	40.137778000000	26.426667000000	USD
690	Segrate Off-Line Point	Segrate Off-Line Point	SWK		Italy	IT	44.822222000000	10.295278000000	EUR
691	Fredericia Rail Station	Fredericia Rail Station	ZBJ		Denmark	DK	55.583333000000	9.766667000000	DKK
692	Pucon	Pucon	ZPC		Chile	CL	-39.291389000000	-71.920833000000	CLP
693	Hong Kong Ferry Port	Hong Kong Ferry Port	XJH		Hong Kong (sar) China	HK	22.307222000000	114.129444000000	HKD
694	Sam Neua	Sam Neua	NEU		Lao People's Democratic Republic	LA	20.416667000000	104.066667000000	LAK
695	Margaret River	Margaret River	MGV		Australia	AU	-18.616667000000	126.866667000000	AUD
696	Yamoussoukro	Yamoussoukro	ASK		Cote D'Ivoire	CI	6.900000000000	-5.366667000000	XOF
697	Aklavik	Aklavik	LAK		Canada	CA	68.223333000000	-135.005833000000	CAD
698	Davis Inlet	Davis Inlet	YDI		Canada	CA	55.933333000000	-60.950000000000	CAD
699	Sarmellek/Balaton Airport	Sarmellek	SOB		Hungary	HU	46.713472000000	17.240444000000	HUF
700	Belfast International Airport	Belfast	BFS		United Kingdom	GB	54.662397000000	-6.217616000000	GBP
701	Ningbo Airport	Ningbo	NGB		China	CN	29.820416000000	121.462397000000	RMB
702	Plymouth Airport	Plymouth	PLH		United Kingdom	GB	50.422337000000	-4.110009000000	GBP
703	Mid-Continent Airport	Wichita	ICT		USA	US	37.653046000000	-97.428955000000	USD
704	St Andrews	St Andrews	ADX		United Kingdom	GB	56.366667000000	-2.866667000000	GBP
705	Northampton	Northampton	ORM		United Kingdom	GB	52.305278000000	-0.792778000000	GBP
706	Hagen Rail Station	Hagen Rail Station	ZEY		Germany	DE	51.363056000000	7.460833000000	EUR
707	Guelmime	Guelmime	GLN		Morocco	MA	29.026667000000	-10.050278000000	MAD
708	Anuradhapura	Anuradhapura	ACJ		Sri Lanka	LK	8.300000000000	80.426667000000	LKR
709	Auki	Auki	AKS		Solomon Islands	SB	-8.702500000000	160.681944000000	SBD
710	Rairua	Rairua	RVV		French Polynesia	PF	-23.885278000000	-147.661944000000	XPF
711	Billund Airport	Billund	BLL		Denmark	DK	55.747382000000	9.147874000000	DKK
712	Halifax Stanfield International Airport	Halifax	YHZ		Canada	CA	44.884960000000	-63.514253000000	CAD
713	Kuwait International Airport	Kuwait	KWI		Kuwait	KW	29.240116000000	47.971251000000	KWD
714	Stornoway Airport	Stornoway	SYY		United Kingdom	GB	58.213627000000	-6.321995000000	GBP
715	Eglin Air Force Base	Eglin Village	VPS		United States	US	30.495913000000	-86.549460000000	USD
716	Brize Norton	Brize Norton	BZZ		United Kingdom	GB	51.750000000000	-1.583333000000	GBP
717	Logrono Rail Station	Logrono Rail Station	LGV		Spain	ES	42.457500000000	-2.442222000000	EUR
718	Derby Rail Station	Nottingham	XQH		United Kingdom	GB	52.916667000000	-1.500000000000	GBP
719	Parnaiba	Parnaiba	PHB		Brazil	BR	-2.893333000000	-41.731111000000	BRL
720	Tangshan	Tangshan	TVS		China	CN	39.719444000000	117.993333000000	RMB
721	Long Semado	Long Semado	LSM		Malaysia	MY	4.216667000000	115.600000000000	MYR
722	Lae Island	Lae Island	LML		Marshall Islands	MH	8.916667000000	166.250000000000	USD
723	Santa Barbara Zulia	Santa Barbara Zulia	STB		Venezuela	VE	8.983333000000	-71.941667000000	VEB
724	Akiachak	Akiachak	KKI		USA	US	60.905278000000	-161.423889000000	USD
725	Tofino	Tofino	YAZ		Canada	CA	49.082222000000	-125.772500000000	CAD
726	Dortmund Airport	Dortmund	DTM		Germany	DE	51.514826000000	7.613139000000	EUR
727	Indianapolis International Airport	Indianapolis	IND		United States	US	39.730513000000	-86.272812000000	USD
728	Fagernes Airport	Fagernes	VDB		Norway	NO	61.015556000000	9.288056000000	NOK
729	Ixtepec	Ixtepec	IZT		Mexico	MX	16.566667000000	-95.100000000000	MXN
730	Fort William Heliport	Fort William Heliport	FWM		United Kingdom	GB	56.816667000000	-5.116667000000	GBP
731	Stronsay	Stronsay	SOY		United Kingdom	GB	59.155278000000	-2.641944000000	GBP
732	Bo Rail Station	Bo Rail Station	XXC		Norway	NO	59.408889000000	9.069167000000	NOK
733	Salto	Salto	STY		Uruguay	UY	-31.433333000000	-57.983333000000	UYU
734	Yangzhou	Yangzhou	YTY		China	CN	32.563056000000	119.718889000000	RMB
735	Pagadian	Pagadian	PAG		Philippines	PH	7.830000000000	123.461111000000	PHP
736	Maiana	Maiana	MNK		Kiribati	KI	0.033333000000	173.000000000000	AUD
737	Bata	Bata	BSG		Equatorial Guinea	GQ	1.905556000000	9.805556000000	XAF
738	Phoenix Luke AFB	Phoenix	LUF		USA	US	33.433333000000	-112.016667000000	USD
739	Flin Flon	Flin Flon	YFO		Canada	CA	54.678056000000	-101.681667000000	CAD
740	Papola Casale Airport	Brindisi	BDS		Italy	IT	40.657995000000	17.939053000000	EUR
741	Leeds/Bradford Airport	Leeds	LBA		United Kingdom	GB	53.869339000000	-1.659985000000	GBP
742	Cyril E. King Airport	Saint Thomas	STT		U.S. Virgin Islands	VI	18.337500000000	-64.969444000000	USD
743	Kutaisi Airport	Kutaisi	KUT		Georgia	GE	42.250000000000	42.700000000000	GEL
744	Cap Haitien	Cap Haitien	CAP		Haiti	HT	19.733056000000	-72.194722000000	HTG
745	Bury St Edmunds	Bury St Edmunds	BEQ		United Kingdom	GB	52.350000000000	0.766667000000	GBP
746	Aix la Chapelle Rail Station	Aix la Chapelle Rail Station	XHJ		Germany	DE	50.770833000000	6.105278000000	EUR
747	Salzburg German Rail Station	Salzburg German Rail Station	ZSB		Austria	AT	47.800000000000	13.033333000000	EUR
748	Bengbu	Bengbu	BFU		China	CN	32.950000000000	117.333333000000	RMB
749	Hingurakgoda	Hingurakgoda	HIM		Sri Lanka	LK	8.050278000000	80.982222000000	LKR
750	Boang	Boang	BOV		Papua New Guinea	PG	-3.366667000000	153.333333000000	PGK
751	Tikehau Atoll	Tikehau Atoll	TIH		French Polynesia	PF	-15.119722000000	-148.230833000000	XPF
752	Touba	Touba	TOZ		Cote D'Ivoire	CI	8.283333000000	-7.683333000000	XOF
753	Napaskiak	Napaskiak	PKA		USA	US	60.706667000000	-161.773611000000	USD
754	Nakina	Nakina	YQN		Canada	CA	50.182778000000	-86.696389000000	CAD
755	La Palma Airport	Santa Cruz De La Palma	SPC		Spain and Canary Islands	ES	28.626389000000	-17.755556000000	EUR
756	Cape Town International Airport	Cape Town	CPT		South Africa	ZA	-33.968906000000	18.596489000000	ZAR
757	Quetta Airport	Quetta	UET		Pakistan	PK	30.249266000000	66.949036000000	PKR
758	Tompkins County Airport	Ithaca	ITH		USA	US	42.490340000000	-76.463590000000	USD
759	Palmar	Palmar	PMZ		Costa Rica	CR	8.950833000000	-83.468611000000	CRC
760	Sigonella	Sigonella	NSY		Italy	IT	37.401667000000	14.922222000000	EUR
761	Soria Bus Station	Soria Bus Station	XJO		Spain	ES	41.766944000000	-2.479444000000	EUR
762	Chesterfield Bus Station	Chesterfield Bus Station	ZFI		United Kingdom	GB	53.250000000000	-1.416667000000	GBP
763	Santa Rosa (BR)	Santa Rosa (BR)	SRA		Brazil	BR	-27.906667000000	-54.520556000000	BRL
764	Plastun	Plastun	TLY		Russian Federation	RU	44.814722000000	136.291667000000	RUB
765	Legaspi	Legaspi	LGP		Philippines	PH	13.157222000000	123.734444000000	PHP
766	Leinster	Leinster	LER		Australia	AU	-27.843333000000	120.703333000000	AUD
767	San Felipe	San Felipe	SNF		Venezuela	VE	10.280278000000	-68.753889000000	VEB
768	False Pass	False Pass	KFP		USA	US	54.848056000000	-163.406389000000	USD
769	Fort Frances	Fort Frances	YAG		Canada	CA	48.654167000000	-93.439722000000	CAD
770	Boutheon Airport	Saint Etienne	EBU		France	FR	45.541389000000	4.296944000000	EUR
771	Liverpool John Lennon Airport	Liverpool	LPL		United Kingdom	GB	53.337616000000	-2.854905000000	GBP
772	Henry E. Rohlsen Airport	Saint Croix	STX		U.S. Virgin Islands	VI	17.701944000000	-64.798611000000	USD
773	Samratulangi Airport	Manado	MDC		Indonesia	ID	1.543533000000	124.922029000000	IDR
774	Cat Island	Cat Island	CAT		Bahamas	BS	24.450000000000	-75.500000000000	BSD
775	Benson	Benson	BEX		United Kingdom	GB	51.616667000000	-1.083333000000	GBP
776	Puerto De Santa Maria Rail Station	Puerto De Santa Maria Rail Station	PXS		Spain	ES	36.600000000000	-6.233333000000	EUR
777	Podolsk	Podolsk	OSF		Russian Federation	RU	55.507500000000	37.504167000000	RUB
778	Diqing	Diqing	DIG		China	CN	27.791667000000	99.678056000000	RMB
779	Jalalabad	Jalalabad	JAA		Afghanistan	AF	34.400000000000	70.500000000000	USD
780	Erave	Erave	ERE		Papua New Guinea	PG	-6.616667000000	143.900000000000	PGK
781	Toowoomba	Toowoomba	TWB		Australia	AU	-27.542778000000	151.917222000000	AUD
782	Sania Ramel Airport	Tetuan	TTU		Morocco	MA	35.583333000000	-5.316667000000	MAD
783	Netaji Subhas Chandra Bose Airport	Kolkata	CCU		India	IN	22.645310000000	88.439306000000	INR
784	Erzurum Airport	Erzurum	ERZ		Turkey	TR	39.955555000000	41.173610000000	USD
785	Axum	Axum	AXU		Ethiopia	ET	14.146667000000	38.772778000000	ETB
786	Ramsgate Rail Station	Ramsgate Rail Station	QQR		United Kingdom	GB	51.333333000000	1.416667000000	GBP
787	Gjovik Rail Station	Gjovik Rail Station	ZYG		Norway	NO	60.797222000000	10.694444000000	NOK
788	Taizz	Taizz	TAI		Yemen	YE	13.685833000000	44.139167000000	YER
789	Rundu	Rundu	NDU		Namibia	NA	-17.956111000000	19.722778000000	NAD
790	Atoifi	Atoifi	ATD		Solomon Islands	SB	-8.873333000000	161.011389000000	SBD
791	Ontong Java	Ontong Java	OTV		Solomon Islands	SB	-5.507500000000	159.525833000000	SBD
792	Maroua	Maroua	MVR		Cameroon	CM	10.451389000000	14.257500000000	XAF
793	Nuiqsut	Nuiqsut	NUI		USA	US	70.210000000000	-151.005556000000	USD
794	Natashquan	Natashquan	YNA		Canada	CA	50.190000000000	-61.789167000000	CAD
795	Venice Marco Polo Airport	Venice	VCE		Italy	IT	45.502285000000	12.337947000000	EUR
796	Kansas City International Airport	Kansas City	MCI		United States	US	39.293807000000	-94.719925000000	USD
797	Goose Bay Airport	Goose Bay	YYR		Canada	CA	53.313534000000	-60.412400000000	CAD
877	Nakhon Phanom	Nakhon Phanom	KOP		Thailand	TH	17.385278000000	104.641944000000	THB
798	Santo Domingo Herrera Apt	Santo Domingo (DO)	HEX		Dominican Republic	DO	18.469444000000	-69.902778000000	DOP
799	San Sebastian/Gomera	San Sebastian/Gomera	GMZ		Spain	ES	28.029722000000	-17.214722000000	EUR
800	Arna Rail Station	Arna Rail Station	XHT		Norway	NO	60.419444000000	5.463889000000	NOK
801	Brumunddal Rail Station	Brumunddal Rail Station	ZVB		Norway	NO	60.882500000000	10.936389000000	NOK
802	In Amenas	In Amenas	IAM		Algeria	DZ	28.051667000000	9.642778000000	DZD
803	Agatti Island	Agatti Island	AGX		India	IN	10.823611000000	72.176111000000	INR
804	Naples Airport	Naples	NAP		Italy	IT	40.886111000000	14.291667000000	EUR
805	El Nohza Airport	Alexandria	ALY		Egypt	EG	31.192545000000	29.953059000000	EGP
806	Juanda Airport	Surabaya	SUB		Indonesia	ID	-7.383870000000	112.777234000000	IDR
807	Durango la Plata County Airport	Durango	DRO		United States	US	37.159500000000	-107.751000000000	USD
808	Lidkoping	Lidkoping	LDK		Sweden	SE	58.466667000000	13.168611000000	SEK
809	Thirsk Rail Station	Thirsk Rail Station	XTK		United Kingdom	GB	54.233333000000	-1.333333000000	GBP
810	Porto Alegre do Norte	Porto Alegre do Norte	PBX		Brazil	BR	-10.860833000000	-51.684444000000	BRL
811	Tarko-Sale	Tarko-Sale	TQL		Russian Federation	RU	64.916667000000	77.783333000000	RUB
812	Phongsaly	Phongsaly	PCQ		Lao People's Democratic Republic	LA	21.645833000000	101.905833000000	LAK
813	Lake Murray	Lake Murray	LMY		Papua New Guinea	PG	-6.850000000000	141.416667000000	PGK
814	Santo Domingo	Santo Domingo (VE)	STD		Venezuela	VE	7.565000000000	-72.035000000000	VEB
815	Ekuk	Ekuk	KKU		USA	US	58.811111000000	-158.561667000000	USD
816	Banff	Banff	YBA		Canada	CA	51.166667000000	-115.566667000000	CAD
817	Bathurst Island	Bathurst Island	BRT		Australia	AU	-11.766667000000	130.633333000000	AUD
818	Takaroa	Takaroa	TKX		French Polynesia	PF	-14.455833000000	-145.024444000000	XPF
819	Ambler	Ambler	ABL		USA	US	67.107222000000	-157.853333000000	USD
820	Ponca City	Ponca City	PNC		USA	US	36.733333000000	-97.100000000000	USD
821	Dean River	Dean River	YRD		Canada	CA	52.816667000000	-126.966667000000	CAD
822	Reus Airport	Reus	REU		Spain and Canary Islands	ES	41.146102000000	1.153319000000	EUR
823	Victoria Falls Airport	Victoria Falls	VFA		Zimbabwe	ZW	-18.093056000000	25.840278000000	ZWD
824	Comoro Airport	Dili	DIL		East Timor	TL	-8.549616000000	125.525003000000	USD
825	LeipzigHalle Airport	LeipzigHalle	LEJ		Germany	DE	51.420260000000	12.221202000000	EUR
826	St Croix SPB	St Croix Island	SSB		Virgin Islands, US	VI	17.747778000000	-64.705556000000	USD
827	Avila Bus Station	Avila Bus Station	AVJ		Spain	ES	40.658056000000	-4.689722000000	EUR
828	Struer Bus Station	Struer Bus Station	QWQ		Denmark	DK	56.483333000000	8.616667000000	DKK
829	Veliky Ustyug	Veliky Ustyug	VUS		Russian Federation	RU	60.784722000000	46.256389000000	RUB
830	Hsinchu	Hsinchu	HSZ		Taiwan Province of China	TW	24.816667000000	120.933333000000	TWD
831	Para Chinar	Para Chinar	PAJ		Pakistan	PK	33.913889000000	70.083333000000	PKR
832	Kwajalein Atoll	Kwajalein Atoll	EAL		Marshall Islands	MH	9.333056000000	166.834722000000	USD
833	Wakunai	Wakunai	WKN		Papua New Guinea	PG	-5.866667000000	155.233333000000	PGK
834	Chefornak	Chefornak	CYF		USA	US	60.159722000000	-164.274722000000	USD
835	Savannah Hunter Aaf	Savannah	SVN		USA	US	32.116667000000	-81.200000000000	USD
836	Washington New Carrolton Rail Station	Washington	ZRZ		USA	US	38.947222000000	-76.869722000000	USD
837	Newcastle Airport	Newcastle	NCL		United Kingdom	GB	55.037062000000	-1.710629000000	GBP
838	Sara	Sara	SSR		Vanuatu	VU	-15.470833000000	168.152500000000	VUV
839	Dundee Airport	Dundee	DND		United Kingdom	GB	56.454090000000	-3.014531000000	GBP
840	Kent International Airport	Manston	MSE		United Kingdom	GB	51.350000000000	1.350000000000	GBP
841	Pangborn Memorial Airport	East Wenatchee	EAT		United States	US	47.404800000000	-120.210000000000	USD
842	Neubrandenburg	Neubrandenburg	FNB		Germany	DE	53.602222000000	13.306111000000	EUR
843	Procida	Procida	ZJJ		Italy	IT	40.766667000000	14.033333000000	EUR
844	Hodeidah	Hodeidah	HOD		Yemen	YE	14.753056000000	42.976389000000	YER
845	Bumi Hills	Bumi Hills	BZH		Zimbabwe	ZW	-16.816667000000	28.350000000000	ZWD
846	Sangir	Sangir	SAE		Indonesia	ID	70.808611000000	-51.626667000000	IDR
847	Marakei	Marakei	MZK		Kiribati	KI	1.983333000000	173.666667000000	AUD
848	Goundam	Goundam	GUD		Mali	ML	16.350000000000	-3.600000000000	XOF
849	Toms River Rail Station	Toms River Rail Station	MJX		USA	US	39.966667000000	-74.200000000000	USD
850	Gjoa Haven	Gjoa Haven	YHK		Canada	CA	68.635556000000	-95.849722000000	CAD
851	Kos Airport	Kos	KGS		Greece	GR	36.793056000000	27.095278000000	EUR
852	Rogue Valley International-Medford Airport	Medford	MFR		United States	US	42.369025000000	-122.873120000000	USD
853	Blagnac Airport	Toulouse	TLS		France	FR	43.630071000000	1.374321000000	EUR
854	London Heathrow Airport	London	LHR		United Kingdom	GB	51.469603000000	-0.453566000000	GBP
855	Khudzhand Airport	Khudzhand	LBD		Tajikistan	TJ	40.219887000000	69.696500000000	TJS
856	Sao Jorge Island Airport	Sao Jorge Island	SJZ		Portugal	PT	38.664616000000	-28.168430000000	EUR
857	San Vito	San Vito	TOO		Costa Rica	CR	8.833333000000	-82.966667000000	CRC
858	Forres	Forres	FSS		United Kingdom	GB	57.650000000000	-3.566667000000	GBP
859	Braintree	Braintree	WXF		United Kingdom	GB	51.966667000000	0.516667000000	GBP
860	Kolding Rail Station	Kolding Rail Station	ZBT		Denmark	DK	55.516667000000	9.483333000000	DKK
861	Masada	Masada	MTZ		Israel	IL	31.333333000000	35.383333000000	ILS
862	Vilankulos	Vilankulos	VNX		Mozambique	MZ	-22.018333000000	35.313333000000	MZM
863	Bundi	Bundi	BNT		Papua New Guinea	PG	-5.750000000000	145.233333000000	PGK
864	Tiga	Tiga	TGJ		New Caledonia	NC	-21.096111000000	167.803889000000	XPF
865	Benson	Benson	BBB		USA	US	45.332778000000	-95.651389000000	USD
866	Longmont Bus Station	Longmont Bus Station	QWM		USA	US	40.166667000000	-105.100000000000	USD
867	Deline	Deline	YWJ		Canada	CA	65.211111000000	-123.435278000000	CAD
868	Ibiza Airport	Ibiza	IBZ		Spain and Canary Islands	ES	38.876595000000	1.367803000000	EUR
869	Bramble Airport	Montserrat	MNI		Montserrat	MS	16.750000000000	-62.233333000000	XCD
870	Phuket International Airport	Phuket	HKT		Thailand	TH	8.107619000000	98.306436000000	THB
871	Pico Island Airport	Pico Island (Azores)	PIX		Portugal	PT	38.466667000000	-28.300000000000	EUR
872	Don Muang Intl	Bangkok	DMK		Thailand	TH	13.912500000000	100.606670000000	THB
873	Papa Stour	Papa Stour	PSV		United Kingdom	GB	60.321944000000	-1.693333000000	GBP
874	Karlskrona Rail Station	Karlskrona Rail Station	XWK		Sweden	SE	56.167500000000	15.585556000000	SEK
875	Santa Maria (BR)	Santa Maria (BR)	RIA		Brazil	BR	-29.711389000000	-53.688056000000	BRL
876	Shijiazhuang	Shijiazhuang	SJW		China	CN	38.280556000000	114.697222000000	RMB
878	Sevilla Airport	Sevilla	SVQ		Spain and Canary Islands	ES	37.423476000000	-5.900136000000	EUR
879	Piarco Airport	Port Of Spain	POS		Trinidad and Tobago	TT	10.602089000000	-61.339414000000	TTD
880	Gyandzha Airport	Gyandzha	KVD		Azerbaijan	AZ	40.733333000000	46.316667000000	AZM
881	Craiova Airport	Craiova	CRA		Romania	RO	44.318890000000	23.886389000000	ROL
882	Rio Sidra	Rio Sidra	RSI		Panama	PA	9.316667000000	-79.283333000000	PAB
883	Shoreham By Sea	Shoreham By Sea	ESH		United Kingdom	GB	50.835556000000	-0.297222000000	GBP
884	Stockholm Flemingsberg Rail Station	Stockholm Flemingsberg Rail Station	XEW		Sweden	SE	59.216667000000	17.950000000000	SEK
885	Santander Rail Station	Santander Rail Station	YJL		Spain	ES	43.457778000000	-3.812222000000	EUR
886	Al Baha	Al Baha	ABT		Saudi Arabia	SA	20.296111000000	41.634167000000	SAR
887	Xuzhou	Xuzhou	XUZ		China	CN	34.229444000000	117.245833000000	RMB
888	Svay Rieng	Svay Rieng	SVR		Cambodia	KH	76.019167000000	-65.118056000000	KHR
889	Napier-Hastings	Napier-Hastings	NPE		New Zealand	NZ	-39.464444000000	176.867778000000	NZD
890	Bondoukou	Bondoukou	BDK		Cote D'Ivoire	CI	8.016667000000	-2.750000000000	XOF
891	North Platte	North Platte	LBF		USA	US	41.131111000000	-100.693056000000	USD
892	Dolbeau	Dolbeau	YDO		Canada	CA	48.883333000000	-72.233333000000	CAD
893	Coen	Coen	CUQ		Australia	AU	-13.762778000000	143.116944000000	AUD
894	Suavanao	Suavanao	VAO		Solomon Islands	SB	-7.585278000000	158.730833000000	SBD
895	Circle Hot Springs	Circle Hot Springs	CHP		USA	US	65.466667000000	-144.583333000000	USD
896	Saranac Lake	Saranac Lake	SLK		USA	US	44.385278000000	-74.206111000000	USD
897	Gods River	Gods River	ZGI		Canada	CA	54.834444000000	-94.067778000000	CAD
898	Kiev/Kyiv - Borispol Airport	Kiev/Kyiv	KBP		Ukraine	UA	50.341244000000	30.895207000000	UAH
899	Rafael Nunez Airport	Cartagena	CTG		Colombia	CO	10.445704000000	-75.516585000000	COP
900	St. Mary's Airport	Isles Of Scilly	ISC		United Kingdom	GB	49.913334000000	-6.291667000000	GBP
901	Redding Municipal Airport	Redding	RDD		United States	US	40.505768000000	-122.299910000000	USD
902	Hornafjordur	Hornafjordur	HFN		Iceland	IS	64.295556000000	-15.227222000000	ISK
903	Nelaug Rail Station	Nelaug Rail Station	XHL		Norway	NO	58.657500000000	8.629444000000	NOK
904	Oberhausen Rail Station	Oberhausen Rail Station	ZOY		Germany	DE	51.466667000000	6.850000000000	EUR
905	King Khalid Mil. City	King Khalid Mil. City	KMC		Saudi Arabia	SA	27.900833000000	45.528333000000	SAR
906	Johannesburg Lanseria International Apt	Johannesburg	HLA		South Africa	ZA	-25.938611000000	27.926111000000	ZAR
907	Soroako	Soroako	SQR		Indonesia	ID	-2.566667000000	120.750000000000	IDR
908	Santa Ana Island	Santa Ana Island	NNB		Solomon Islands	SB	-10.848333000000	162.454167000000	SBD
909	Kedougou	Kedougou	KGG		Senegal	SN	12.566667000000	-12.500000000000	XOF
910	Martinsburg	Martinsburg	MRB		USA	US	39.400000000000	-77.983333000000	USD
911	Kamloops	Kamloops	YKA		Canada	CA	50.702222000000	-120.444444000000	CAD
912	Sola Airport	Stavanger	SVG		Norway	NO	58.882149000000	5.629197000000	NOK
913	Assab Airport	Assab	ASA		Eritrea	ER	13.070000000000	42.638333000000	ERN
914	Peshawar Airport	Peshawar	PEW		Pakistan	PK	33.989083000000	71.519252000000	PKR
915	Plymouth Airport	Plymouth	PLH		United Kingdom	GB	50.422337000000	-4.110009000000	GBP
916	San Andros	San Andros	SAQ		Bahamas	BS	25.053889000000	-78.048889000000	BSD
917	St Andrews	St Andrews	ADX		United Kingdom	GB	56.366667000000	-2.866667000000	GBP
918	Northampton	Northampton	ORM		United Kingdom	GB	52.305278000000	-0.792778000000	GBP
919	Stendal Rail Station	Stendal Rail Station	ZSN		Germany	DE	52.595278000000	11.854722000000	EUR
920	Changde	Changde	CGD		China	CN	28.918611000000	111.640833000000	RMB
921	Bagdogra	Bagdogra	IXB		India	IN	26.681111000000	88.328611000000	INR
922	Buka	Buka	BUA		Papua New Guinea	PG	-5.422222000000	154.672778000000	PGK
923	Rairua	Rairua	RVV		French Polynesia	PF	-23.885278000000	-147.661944000000	XPF
924	Southampton Airport	Southampton	SOU		United Kingdom	GB	50.950725000000	-1.361318000000	GBP
925	Quad-City Airport	Moline	MLI		United States	US	41.453897000000	-90.506111000000	USD
926	Metz-Nancy-Lorraine Airport	Metz/Nancy	ETZ		France	FR	48.981650000000	6.243003000000	EUR
927	Kokshetau	Kokshetau	KOV		Kazakhstan	KZ	53.329167000000	69.594722000000	KZT
928	Cologne Deutz Rail Station	Cologne/Bonn	QKU		Germany	DE	50.916667000000	6.950000000000	EUR
929	Penrith Rail Station	Penrith Rail Station	XPF		United Kingdom	GB	54.666667000000	-2.733333000000	GBP
930	Verkhnevilyuysk	Verkhnevilyuysk	VHV		Russian Federation	RU	63.458889000000	120.268611000000	RUB
931	Hailar	Hailar	HLD		China	CN	49.208611000000	119.816667000000	RMB
932	Manang	Manang	NGX		Nepal	NP	28.633333000000	84.000000000000	NPR
933	Kings Canyon	Kings Canyon	KBJ		Australia	AU	-24.266667000000	131.494444000000	AUD
934	Bellavista	Bellavista	BLP		Peru	PE	-12.025000000000	-77.133333000000	PEN
935	Franklin	Franklin (US) VA	FKN		USA	US	36.683333000000	-76.916667000000	USD
936	Wales	Wales	WAA		USA	US	65.623333000000	-168.095000000000	USD
937	Reims Champagne-ardenne Tgv Rail Stn	Reims Champagne-ardenne Tgv Rail Stn	XIZ		France	FR	49.000000000000	3.000000000000	EUR
938	London Luton Airport	London	LTN		United Kingdom	GB	51.879768000000	-0.376232000000	GBP
939	St Clair County International Airport	Port Huron	PHN		United States	US	42.913056000000	-82.526111000000	USD
940	San Sebastian Airport	San Sebastian	EAS		Spain and Canary Islands	ES	43.356400000000	-1.793538000000	EUR
941	Santiago	Santiago (PA)	SYP		Panama	PA	8.100000000000	-80.983333000000	PAB
942	Salamanca Rail Station	Salamanca Rail Station	SEJ		Spain	ES	40.971667000000	-5.648333000000	EUR
943	Criciuma	Criciuma	CCM		Brazil	BR	-28.725833000000	-49.424722000000	BRL
944	Kharkhorin	Kharkhorin	KHR		Mongolia	MN	46.783333000000	102.850000000000	MNT
945	Varanasi	Varanasi	VNS		India	IN	25.452222000000	82.859444000000	INR
946	Lawica Airport	Poznan	POZ		Poland	PL	52.414327000000	16.828845000000	PLN
947	Ndola Airport	Ndola	NLA		Zambia	ZM	-12.993449000000	28.665024000000	ZMK
948	Valencia Airport	Valencia	VLN		Venezuela	VE	10.154290000000	-67.922479000000	VEB
949	Ramstein Airport	Ramstein	RMS		Germany	DE	49.450000000000	7.550000000000	EUR
950	El Porvenir	El Porvenir	PVE		Panama	PA	9.558889000000	-78.947500000000	PAB
951	Salamanca Bus Station	Salamanca Bus Station	SAJ		Spain	ES	40.970278000000	-5.675278000000	EUR
952	Carauari	Carauari	CAF		Brazil	BR	-4.900000000000	-66.916667000000	BRL
953	Kirensk	Kirensk	KCK		Russian Federation	RU	57.772778000000	108.058611000000	RUB
954	Udaipur	Udaipur	UDR		India	IN	24.617778000000	73.896111000000	INR
955	Derim	Derim	DER		Papua New Guinea	PG	-6.100000000000	146.816667000000	PGK
956	Rimatara	Rimatara	RMT		French Polynesia	PF	-22.637500000000	-152.805278000000	XPF
957	Takoradi	Takoradi	TKD		Ghana	GH	4.895556000000	-1.774722000000	GHC
958	Pilot Point Airport	Pilot Point	PIP		USA	US	57.580278000000	-157.571944000000	USD
959	Quadra Island	Quadra Island	YQJ		Canada	CA	50.065000000000	-125.234722000000	CAD
960	Katiu	Katiu	KXU		French Polynesia	PF	-16.339444000000	-144.403056000000	XPF
961	Tureia	Tureia	ZTA		French Polynesia	PF	-20.780556000000	-138.567500000000	XPF
962	Wildman Lake	Wildman Lake	EWD		USA	US	56.456389000000	-159.762222000000	USD
963	Chevak	Chevak	VAK		USA	US	61.540000000000	-165.601944000000	USD
964	Cherbourg	Cherbourg	CER		France	FR	49.650833000000	-1.475278000000	EUR
965	Lugansk Airport	Lugansk	VSG		Ukraine	UA	48.566667000000	39.333333000000	UAH
966	Tulcan Airport	Tulcan	TUA		Ecuador	EC	0.800000000000	-77.716667000000	USD
967	Vaernes Airport	Trondheim	TRD		Norway	NO	63.454285000000	10.917863000000	NOK
968	North Sound	North Sound	NSX		Virgin Islands, British	VG	18.500000000000	-64.366667000000	USD
969	Corvo Island	Corvo Island	CVU		Portugal	PT	39.671389000000	-31.113611000000	EUR
970	Birmingham New Street Rail Station	Birmingham (GB)	QQN		United Kingdom	GB	52.466667000000	-1.916667000000	GBP
971	Rome Termini Rail Station	Rome Termini Rail Station	XRJ		Italy	IT	41.901111000000	12.501944000000	EUR
972	Ivanovo	Ivanovo	IWA		Russian Federation	RU	57.058333000000	40.980000000000	RUB
973	Amami O Shima	Amami O Shima	ASJ		Japan	JP	28.430556000000	129.712500000000	JPY
974	Gorakhpur	Gorakhpur	GOP		India	IN	26.741111000000	83.450000000000	INR
975	Belep Island	Belep Island	BMY		New Caledonia	NC	-19.720556000000	163.661111000000	XPF
976	Aratika	Aratika	RKA		French Polynesia	PF	-15.485278000000	-145.467778000000	XPF
977	Tchibanga	Tchibanga	TCH		Gabon	GA	-2.805000000000	10.955278000000	XAF
978	Pagosa Springs	Pagosa Springs	PGO		USA	US	37.266667000000	-107.050000000000	USD
979	Red Deer	Red Deer	YQF		Canada	CA	52.182222000000	-113.894444000000	CAD
980	Ronaldsway Airport	Isle Of Man	IOM		United Kingdom	GB	54.086769000000	-4.634730000000	GBP
981	Durham Tees Valley Airport	Durham Tees Valley	MME		United Kingdom	GB	54.512226000000	-1.434013000000	GBP
982	Fairbanks International Airport	Fairbanks	FAI		United States	US	64.818214000000	-147.866805000000	USD
983	Cambridge Airport	Cambridge	CBG		United Kingdom	GB	52.200000000000	0.183333000000	GBP
984	Wick Airport	Wick	WIC		United Kingdom	GB	58.456944000000	-3.086667000000	GBP
985	Spring Point	Spring Point	AXP		Bahamas	BS	22.441944000000	-73.970833000000	BSD
986	Praslin Island	Praslin Island	PRI		Seychelles	SC	-4.319167000000	55.691389000000	SCR
987	Ponferrada Bus Station	Ponferrada Bus Station	PFE		Spain	ES	42.552778000000	-6.601111000000	EUR
988	Novgorod	Novgorod	NVR		Russian Federation	RU	58.623056000000	31.375833000000	RUB
989	Khovd	Khovd	HVD		Mongolia	MN	47.954167000000	91.628056000000	MNT
990	Phaplu	Phaplu	PPL		Nepal	NP	27.517222000000	86.585000000000	NPR
991	Mili Atoll	Mili Atoll	EJT		Marshall Islands	MH	6.083333000000	171.950000000000	USD
992	Wanuma	Wanuma	WNU		Papua New Guinea	PG	-4.900000000000	145.316667000000	PGK
993	Deer Harbor	Deer Harbor	DHB		USA	US	48.620833000000	-123.003056000000	USD
994	Seal Bay	Seal Bay	SYB		USA	US	58.366944000000	-152.207222000000	USD
995	Cork Airport	Cork	ORK		Ireland	IE	51.846645000000	-8.489140000000	EUR
996	Sim	Sim	SMJ		Papua New Guinea	PG	-7.666667000000	146.833333000000	PGK
997	Akron, Fulton International	Akron/Canton	AKC		USA	US	41.040000000000	-81.467778000000	USD
998	Port Armstrong	Port Armstrong	PTL		USA	US	56.297222000000	-134.662500000000	USD
999	St Leonard	St Leonard	YSL		Canada	CA	47.183333000000	-67.900000000000	CAD
1000	Yakutsk Airport	Yakutsk	YKS		Russian Federation	RU	62.085607000000	129.750067000000	RUB
1001	Billings Airport	Billings	BIL		United States	US	45.803419000000	-108.537229000000	USD
1002	Hasvik Airport	Hasvik	HAA		Norway	NO	70.466670000000	22.150000000000	NOK
1003	Little Cayman	Little Cayman	LYB		Cayman Islands	KY	19.666667000000	-80.083333000000	KYD
1004	Doncaster	Doncaster	DCS		United Kingdom	GB	53.466667000000	-1.000000000000	GBP
1005	Rugby Rail Station	Rugby Rail Station	XRU		United Kingdom	GB	52.383333000000	-1.250000000000	GBP
1006	Keperveyem	Keperveyem	KPW		Russian Federation	RU	67.845000000000	166.139722000000	RUB
1007	Boao Rail Station	Boao Rail Station	BPO		China	CN	19.138056000000	110.482778000000	RMB
1008	Indore	Indore	IDR		India	IN	22.721667000000	75.801111000000	INR
1009	Batuna	Batuna	BPF		Solomon Islands	SB	-8.563056000000	158.119167000000	SBD
1010	Raroia	Raroia	RRR		French Polynesia	PF	-16.045000000000	-142.476944000000	XPF
1011	St Louis	St Louis (SN)	XLS		Senegal	SN	16.050833000000	-16.463056000000	XOF
1012	Branson/Point Lookout	Branson/Point Lookout	PLK		USA	US	36.616667000000	-93.216667000000	USD
1013	Grande Prairie	Grande Prairie	YQU		Canada	CA	55.179722000000	-118.885000000000	CAD
1014	Geneve-Cointrin Airport	Geneva	GVA		Switzerland	CH	46.229634000000	6.105774000000	CHF
1015	Hiroshima International Airport	Hiroshima	HIJ		Japan	JP	34.436111000000	132.919444000000	JPY
1016	Aktyubinsk Airport	Aktyubinsk	AKX		Kazakhstan	KZ	50.249336000000	57.211403000000	KZT
1017	Njombe	Njombe	JOM		Tanzania United Republic of	TZ	-9.357500000000	34.775000000000	TZS
1018	Filton	Filton	FZO		United Kingdom	GB	51.519444000000	-2.590278000000	GBP
1019	Sheffield	Sheffield	SZD		United Kingdom	GB	53.394167000000	-1.388333000000	GBP
1020	Balakovo	Balakovo	BWO		Russian Federation	RU	51.866667000000	47.750000000000	RUB
1021	Shakhtersk	Shakhtersk	EKS		Russian Federation	RU	49.000000000000	142.000000000000	RUB
1022	Kadanwari	Kadanwari	KCF		Pakistan	PK	27.200833000000	69.153333000000	PKR
1023	Falls Creek	Falls Creek	FLC		Australia	AU	-34.983333000000	150.600000000000	AUD
1024	Alice Springs Rail Station	Alice Springs	XHW		Australia	AU	-23.702778000000	133.869444000000	AUD
1025	Keene	Keene	EEN		USA	US	42.900000000000	-72.266667000000	USD
1026	Togiak	Togiak	TOG		USA	US	59.052500000000	-160.399167000000	USD
1027	New York Penn Rail Station	New York	ZYP		USA	US	40.750556000000	-73.993611000000	USD
1028	Stansted Airport	London	STN		United Kingdom	GB	51.889267000000	0.262703000000	GBP
1029	Valley International Airport	Harlingen	HRL		United States	US	26.223483000000	-97.662253000000	USD
1030	Magadan Airport	Magadan	GDX		Russian Federation	RU	59.916668000000	150.716660000000	RUB
1031	Golfito	Golfito	GLF		Costa Rica	CR	8.653333000000	-83.181389000000	CRC
1032	Lleida Rail Station	Lleida Rail Station	QLQ		Spain	ES	41.620833000000	0.633056000000	EUR
1033	Hannover HBF Rail Station	Hannover	ZVR		Germany	DE	52.366944000000	9.716667000000	EUR
1034	Rosh Pina	Rosh Pina	RPN		Israel	IL	32.983333000000	35.566667000000	ILS
1035	Mfuwe	Mfuwe	MFU		Zambia	ZM	-13.259722000000	31.933889000000	ZMK
1036	Atiu Island	Atiu Island	AIU		Cook Islands	CK	-19.966667000000	-158.125000000000	NZD
1037	Marau Island	Marau Island	RUS		Solomon Islands	SB	-9.861667000000	160.825556000000	SBD
1038	Maiduguri	Maiduguri	MIU		Nigeria	NG	11.855278000000	13.080833000000	NGN
1039	Norfolk Nas Chambers	Norfolk	NGU		USA	US	36.896389000000	-76.198333000000	USD
1040	Langley	Langley	YLY		Canada	CA	50.244722000000	-121.568333000000	CAD
1041	St Austell Railway Station	St Austell	USX		United Kingdom	GB	50.339700000000	-4.790280000000	GBP
1042	Ivalo Airport	Ivalo	IVL		Finland	FI	68.611115000000	27.415556000000	EUR
1043	Traverse City Airport	Traverse City	TVC		USA	US	44.744083000000	-85.580350000000	USD
1044	Rome Tiburtina Rail Stn	Rome Tiburtina Rail Stn	IRT		Italy	IT	41.910556000000	12.530556000000	EUR
1045	Ronneby Rail Station	Ronneby Rail Station	XXY		Sweden	SE	56.207222000000	15.283056000000	SEK
1046	Telemaco Borba	Telemaco Borba	TEC		Brazil	BR	-24.316667000000	-50.652778000000	BRL
1047	Zhongwei	Zhongwei	ZHY		China	CN	37.377222000000	105.154444000000	RMB
1048	Tolitoli	Tolitoli	TLI		Indonesia	ID	1.033333000000	120.816667000000	IDR
1049	Moorea	Moorea	MOZ		French Polynesia	PF	-17.490000000000	-149.761944000000	XPF
1050	Bouake	Bouake	BYK		Cote D'Ivoire	CI	7.733333000000	-5.066667000000	XOF
1051	Lawrence	Lawrence	LWM		USA	US	42.716667000000	-71.116667000000	USD
1052	Gorge Harbor	Gorge Harbor	YGE		Canada	CA	50.096389000000	-124.982500000000	CAD
1053	Verona Airport	Verona	VRN		Italy	IT	45.402330000000	10.906796000000	EUR
1054	Key West International Airport	Key West	EYW		United States	US	24.553574000000	-81.755010000000	USD
1055	Graciosa Island Airport	Graciosa Island (Azores)	GRW		Portugal	PT	39.090954000000	-28.027958000000	EUR
1056	Hilo International Airport	Hilo	ITO		United States	US	19.714565000000	-155.039630000000	USD
1057	Breiddalsvik	Breiddalsvik	BXV		Iceland	IS	64.790000000000	-14.022778000000	ISK
1058	Puertollano Rail Station	Puertollano Rail Station	UER		Spain	ES	38.691389000000	-4.111944000000	EUR
1059	Malaga Rail Station	Malaga Rail Station	YJM		Spain	ES	36.711389000000	-4.432778000000	EUR
1060	Rio Grande (AR)	Rio Grande (AR)	RGA		Argentina	AR	-53.777500000000	-67.750000000000	ARS
1061	Wanxian	Wanxian	WXN		China	CN	30.836944000000	108.406111000000	RMB
1062	Narathiwat	Narathiwat	NAW		Thailand	TH	6.523333000000	101.744722000000	THB
1063	Mount Gambier	Mount Gambier	MGB		Australia	AU	-37.745556000000	140.785278000000	AUD
1064	Portoviejo	Portoviejo	PVO		Ecuador	EC	-1.033333000000	-80.466667000000	USD
1065	Arsuk	Arsuk	JRK		Greenland	GL	61.176944000000	-48.420000000000	DKK
1066	Pukatawagan	Pukatawagan	XPK		Canada	CA	55.800000000000	-101.416667000000	CAD
1067	Paphos International Airport	Paphos	PFO		Cyprus	CY	34.711552000000	32.489104000000	EUR
1068	Southampton Airport	Southampton	SOU		United Kingdom	GB	50.950725000000	-1.361318000000	GBP
1069	Augusto Severo Airport	Natal	NAT		Brazil	BR	-5.916787000000	-35.250246000000	BRL
1070	Skien Airport	Skien	SKE		Norway	NO	59.182777000000	9.562500000000	NOK
1071	Los Chiles	Los Chiles	LSL		Costa Rica	CR	11.000000000000	-84.833333000000	CRC
1072	Shetland Islands Scatsta Apt	Shetland Islands	SCS		United Kingdom	GB	60.433333000000	-1.283333000000	GBP
1073	Penrith Rail Station	Penrith Rail Station	XPF		United Kingdom	GB	54.666667000000	-2.733333000000	GBP
1074	Concepcion (PY)	Concepcion (PY)	CIO		Paraguay	PY	-23.434444000000	-57.418333000000	PYG
1075	Kinmen	Kinmen	KNH		Chinese Taipei	TW	24.429722000000	118.361667000000	TWD
1076	Quincy	Quincy	UIN		USA	US	39.940833000000	-91.194444000000	USD
1077	Lake Gregory	Lake Gregory	LGE		Australia	AU	-20.133333000000	127.566667000000	AUD
1078	Las Piedras	Las Piedras	LSP		Venezuela	VE	11.780833000000	-70.151389000000	VEB
1079	Fort Mackay (CA) AB	Fort Mackay (CA) AB	HZP		Canada	CA	57.366667000000	-111.700000000000	CAD
1080	Perce Rail Station	Perce Rail Station	XFG		Canada	CA	48.466667000000	-64.316667000000	CAD
1081	Varna Airport	Varna	VAR		Bulgaria	BG	43.237258000000	27.829096000000	EUR
1082	London Luton Airport	London	LTN		United Kingdom	GB	51.879768000000	-0.376232000000	GBP
1083	Castro Pinto Airport	Joao Pessoa	JPA		Brazil	BR	-7.145357000000	-34.948159000000	BRL
1084	San Sebastian Airport	San Sebastian	EAS		Spain and Canary Islands	ES	43.356400000000	-1.793538000000	EUR
1085	Gisenyi	Gisenyi	GYI		Rwanda	RW	-1.700000000000	29.250000000000	RWF
1086	Tierp Rail Station	Tierp Rail Station	XFU		Sweden	SE	60.333333000000	17.500000000000	SEK
1087	Humaita	Humaita	HUW		Brazil	BR	-7.535556000000	-63.071111000000	BRL
1088	Nefteyugansk	Nefteyugansk	NFG		Russian Federation	RU	61.133333000000	73.050000000000	RUB
1089	Dabra	Dabra	DRH		Indonesia	ID	-3.250000000000	138.566667000000	IDR
1090	San Javier Airport	Murcia	MJV		Spain and Canary Islands	ES	37.775213000000	-0.819040000000	EUR
1091	St. Barthelemy Airport	Saint Barthelemy	SBH		Guadeloupe	GP	17.900000000000	-62.850000000000	EUR
1092	Tianjin Airport	Tianjin	TSN		China	CN	39.122627000000	117.339894000000	RMB
1093	Whitehorse Airport	Whitehorse	YXY		Canada	CA	60.716667000000	-135.066670000000	CAD
1094	Eldoret	Eldoret	EDL		Kenya	KE	0.404722000000	35.238889000000	KES
1095	Arendal Rail Station	Arendal Rail Station	XGD		Norway	NO	58.465000000000	8.770556000000	NOK
1096	Guarapari	Guarapari	GUZ		Brazil	BR	-20.650000000000	-40.516667000000	BRL
1097	Nanchong	Nanchong	NAO		China	CN	30.793889000000	106.159722000000	RMB
1098	Jambi	Jambi	DJB		Indonesia	ID	-1.638056000000	103.644444000000	IDR
1099	Gladstone	Gladstone	GLT		Australia	AU	-23.869722000000	151.222778000000	AUD
1100	Traralgon	Traralgon	TGN		Australia	AU	-38.200000000000	146.533333000000	AUD
1101	Bryce	Bryce	BCE		USA	US	37.700000000000	-112.150000000000	USD
1102	Albany Bus Station	Albany Bus Station	QWY		USA	US	44.502778000000	-123.283333000000	USD
1103	Wabush	Wabush	YWK		Canada	CA	52.921944000000	-66.864444000000	CAD
1104	Katiu	Katiu	KXU		French Polynesia	PF	-16.339444000000	-144.403056000000	XPF
1105	Tureia	Tureia	ZTA		French Polynesia	PF	-20.780556000000	-138.567500000000	XPF
1106	Las Vegas Henderson Sky Harbor Apt	Las Vegas	HSH		USA	US	35.968333000000	-115.119167000000	USD
1107	Lac Edouard Rail Station	Lac Edouard Rail Station	XEE		Canada	CA	47.650000000000	-72.266667000000	CAD
1108	Lakefront Airport	New Orleans	NEW		USA	US	30.039444000000	-90.026665000000	USD
1109	Seychelles International Airport	Mahe Island	SEZ		Seychelles	SC	-4.671275000000	55.511279000000	SCR
1110	Hong Kong International Airport	Hong Kong	HKG		Hong Kong	HK	22.315248000000	113.936490000000	HKD
1111	Nizhnevartovsk Airport	Nizhnevartovsk	NJC		Russia	RU	60.947600000000	76.491450000000	RUB
1112	Bluefields	Bluefields	BEF		Nicaragua	NI	11.990833000000	-83.774167000000	NIO
1113	Harrogate	Harrogate	HRT		United Kingdom	GB	54.050000000000	-1.250000000000	GBP
1114	Birmingham New Street Rail Station	Birmingham (GB)	QQN		United Kingdom	GB	52.466667000000	-1.916667000000	GBP
1115	Katrineholm Rail Station	Katrineholm Rail Station	XXK		Sweden	SE	58.996944000000	16.208333000000	SEK
1116	Uherske Hradiste	Uherske Hradiste	UHE		Czech Republic	CZ	49.029444000000	17.439722000000	CZK
1117	Bulgan Khovd	Bulgan Khovd	HBU		Mongolia	MN	48.856389000000	103.474167000000	MNT
1118	Muzaffarabad	Muzaffarabad	MFG		Pakistan	PK	34.333333000000	73.516667000000	PKR
1119	Derby	Derby	DCN		Australia	AU	-17.581389000000	123.828333000000	AUD
1120	Telefomin	Telefomin	TFM		Papua New Guinea	PG	-5.133333000000	141.650000000000	PGK
1121	Westfield	Westfield	BAF		USA	US	42.158611000000	-72.715556000000	USD
1122	Fort Collins Bus Station	Fort Collins/Loveland	QWF		USA	US	40.586111000000	-105.083333000000	USD
1123	Kangiqsujuaq	Kangiqsujuaq	YWB		Canada	CA	61.587778000000	-71.926667000000	CAD
1124	Ronaldsway Airport	Isle Of Man	IOM		United Kingdom	GB	54.086769000000	-4.634730000000	GBP
1125	Durham Tees Valley Airport	Durham Tees Valley	MME		United Kingdom	GB	54.512226000000	-1.434013000000	GBP
1126	LA/Ontario International Airport	Ontario	ONT		United States	US	34.060681000000	-117.597651000000	USD
1127	Cambridge Airport	Cambridge	CBG		United Kingdom	GB	52.200000000000	0.183333000000	GBP
1128	Wick Airport	Wick	WIC		United Kingdom	GB	58.456944000000	-3.086667000000	GBP
1129	St Thomas SPB	St Thomas Island	SPB		Virgin Islands, US	VI	18.337778000000	-64.939722000000	USD
1130	Aviano	Aviano	AVB		Italy	IT	46.031944000000	12.596389000000	EUR
1131	Ponferrada Bus Station	Ponferrada Bus Station	PFE		Spain	ES	42.552778000000	-6.601111000000	EUR
1132	Budapest Keleti Rail Station	Budapest Keleti Rail Station	XXQ		Hungary	HU	47.500278000000	19.083889000000	HUF
1133	Komsomolsk-Na-amure	Komsomolsk-Na-amure	KXK		Russian Federation	RU	50.407778000000	136.935833000000	RUB
1134	Battambang	Battambang	BBM		Cambodia	KH	13.095556000000	103.224444000000	KHR
1135	Long Island	Long Island	HAP		Australia	AU	-21.523056000000	148.963889000000	AUD
1136	Ciudad Guayana	Ciudad Guayana	CGU		Venezuela	VE	8.583333000000	-64.216667000000	VEB
1137	Puerto del Rosario Airport	Puerto del Rosario	FUE		Spain and Canary Islands	ES	28.450605000000	-13.869893000000	EUR
1138	Port Columbus International Airport	Columbus	CMH		United States	US	39.998181000000	-82.884966000000	USD
1139	KemiTornio Airport	KemiTornio	KEM		Finland	FI	65.780060000000	24.576770000000	EUR
1140	Fort McMurray Airport	Fort McMurray	YMM		Canada	CA	56.656590000000	-111.223950000000	CAD
1141	Enschede	Enschede	ENS		Netherlands	NL	52.275000000000	6.886389000000	EUR
1142	Norrkoping Rail Station	Norrkoping Rail Station	XYK		Sweden	SE	58.596667000000	16.183611000000	SEK
1143	Palmas	Palmas	PMW		Brazil	BR	-10.291389000000	-48.356944000000	BRL
1144	Bulgan	Bulgan	UGA		Mongolia	MN	48.800000000000	103.550000000000	MNT
1145	Luang Namtha	Luang Namtha	LXG		Lao People's Democratic Republic	LA	20.966667000000	101.400000000000	LAK
1146	Longana	Longana	LOD		Vanuatu	VU	-15.305833000000	167.967778000000	VUV
1147	Tacna	Tacna	TCQ		Peru	PE	-18.053333000000	-70.275833000000	PEN
1148	Kanab	Kanab	KNB		USA	US	37.250000000000	-112.833333000000	USD
1149	Baker Lake	Baker Lake	YBK		Canada	CA	64.298889000000	-96.077778000000	CAD
1150	Oulu Airport	Oulu	OUL		Finland	FI	64.930120000000	25.375425000000	EUR
1151	Louisville International Airport	Louisville	SDF		United States	US	38.186375000000	-85.741794000000	USD
1152	Horta Airport	Horta (Azores)	HOR		Portugal	PT	38.520000000000	-28.717222000000	EUR
1153	Sonoma County Airport	Windsor	STS		United States	US	38.511000000000	-122.805000000000	USD
1154	Cadiz Rail Station	Cadiz Rail Station	CDZ		Spain	ES	36.529444000000	-6.288611000000	EUR
1155	Vejle	Vejle	VEJ		Denmark	DK	55.700000000000	9.533333000000	DKK
1156	General Pico	General Pico	GPO		Argentina	AR	-35.700000000000	-63.750000000000	ARS
1157	Suzhou	Suzhou	SZV		China	CN	31.300000000000	120.633333000000	RMB
1158	Kudat	Kudat	KUD		Malaysia	MY	6.923333000000	116.837222000000	MYR
1159	Koro Island	Koro Island	KXF		Fiji	FJ	-17.345833000000	179.421944000000	FJD
1160	Juliaca	Juliaca	JUL		Peru	PE	-15.467222000000	-70.158056000000	PEN
1161	Kauai Island Princeville Apt	Kauai Island	HPV		USA	US	22.212500000000	-159.446667000000	USD
1162	Vancouver Rail Station	Vancouver	XEA		Canada	CA	49.271667000000	-123.098333000000	CAD
1163	Montpellier St-roch Rail Stn	Montpellier	XPJ		France	FR	43.604722000000	3.881111000000	EUR
1164	Samara Airport	Samara	KUF		Russian Federation	RU	53.507819000000	50.147420000000	RUB
1165	San Francisco International Airport	San Francisco	SFO		United States	US	37.615215000000	-122.389881000000	USD
1166	EuroAirport Basel-Mulhouse-Freiburg	Basel	MLH		Switzerland	CH	47.599323000000	7.532864000000	CHF
1167	Karshi	Karshi	KSQ		Uzbekistan	UZ	38.801944000000	65.774722000000	UZS
1168	Sinop (TR)	Sinop (TR)	NOP		Turkey	TR	42.021389000000	35.077500000000	USD
1169	Kongsberg Rail Station	Kongsberg Rail Station	XKB		Norway	NO	59.672222000000	9.650000000000	NOK
1170	Vina del Mar	Vina del Mar	KNA		Chile	CL	-33.033333000000	-71.566667000000	CLP
1171	Odate Noshiro	Odate Noshiro	ONJ		Japan	JP	40.191944000000	140.371389000000	JPY
1172	Del Carmen	Del Carmen	IAO		Philippines	PH	9.859167000000	126.015278000000	PHP
1173	Losuia	Losuia	LSA		Papua New Guinea	PG	-8.506389000000	151.081111000000	PGK
1174	Necocli	Necocli	NCI		Colombia	CO	8.450000000000	-76.783333000000	COP
1175	Kirksville	Kirksville	IRK		USA	US	40.093611000000	-92.544444000000	USD
1176	Opapamiska Lake	Opapamiska Lake	YBS		Canada	CA	52.606667000000	-90.376944000000	CAD
1177	Bournemouth Airport	Bournemouth	BOH		United Kingdom	GB	50.778269000000	-1.832476000000	GBP
1178	Newport News/Williamsburg International Airport	Newport News	PHF		United States	US	37.130328000000	-76.502825000000	USD
1179	Kvernberget Airport	Kristiansund	KSU		Norway	NO	63.114723000000	7.844444000000	NOK
1180	Bimini International Apt	Bimini	BIM		Bahamas	BS	25.700000000000	-79.264722000000	BSD
1181	Eday	Eday	EOI		United Kingdom	GB	59.190556000000	-2.772222000000	GBP
1182	Portsmouth	Portsmouth	PME		United Kingdom	GB	50.833333000000	-1.050000000000	GBP
1183	Bilbao Abando Rail Stn	Bilbao Abando Rail Stn	YJI		Spain	ES	43.260833000000	-2.927500000000	EUR
1184	Chaiten	Chaiten	WCH		Chile	CL	-42.933333000000	-72.716667000000	CLP
1185	Francistown	Francistown	FRW		Botswana	BW	-21.159722000000	27.474444000000	BWP
1186	Sakon Nakhon	Sakon Nakhon	SNO		Thailand	TH	17.195278000000	104.118611000000	THB
1187	Nuku Hiva	Nuku Hiva	NHV		French Polynesia	PF	-8.795556000000	-140.228889000000	XPF
1188	Aioun el Atrouss	Aioun el Atrouss	AEO		Mauritania	MR	16.700000000000	-9.650000000000	MRO
1189	West Point	West Point	KWP		USA	US	57.770000000000	-153.546111000000	USD
1190	Coronation	Coronation	YCT		Canada	CA	52.075278000000	-111.446389000000	CAD
1191	Karpathos Airport	Karpathos	AOK		Greece	GR	35.420683000000	27.146728000000	EUR
1192	Sawyer International Airport	Marquette	MQT		United States	US	46.353611000000	-87.395278000000	USD
1193	Orebro-Bofors Airport	Orebro	ORB		Sweden	SE	59.225758000000	15.047543000000	SEK
1194	Mustique	Mustique	MQS		St Vincent and the Grenadines	VC	12.888333000000	-61.179167000000	XCD
1195	Kopasker	Kopasker	OPA		Iceland	IS	66.310833000000	-16.466667000000	ISK
1196	Crewe Rail Station	Crewe Rail Station	XVC		United Kingdom	GB	53.083333000000	-2.450000000000	GBP
1197	London Brit Rail Terminal	London Brit Rail Terminal	ZLX		United Kingdom	GB	12.944444000000	23.563333000000	GBP
1198	Los Angeles	Los Angeles (CL)	LSQ		Chile	CL	-37.416667000000	-72.350000000000	CLP
1199	Gorno-altaysk	Gorno-altaysk	RGK		Russian Federation	RU	51.969167000000	85.836389000000	RUB
1200	Kotabaru	Kotabaru	KBU		Indonesia	ID	-3.296111000000	116.164722000000	IDR
1201	Kisauni Airport	Zanzibar	ZNZ		United Republic of Tanzania	TZ	-6.218466000000	39.221185000000	TZS
1202	Lhasa Airport	Lhasa	LXA		China	CN	29.293051000000	90.900511000000	RMB
1203	Benbecula Airport	Benbecula	BEB		United Kingdom	GB	57.473415000000	-7.376028000000	GBP
1204	Valdez Pioneer Field	Valdez	VDZ		United States	US	61.132500000000	-146.238890000000	USD
1205	Bologna Central Rail Stn	Bologna Central Rail Stn	IBT		Italy	IT	44.506111000000	11.343333000000	EUR
1206	Anglesey	Anglesey	VLY		United Kingdom	GB	53.248333000000	-4.535278000000	GBP
1207	O'Sullivan Army Air Field	San Luis Obispo	CSL		United States	US	35.236667000000	-120.639167000000	USD
1208	Bardufoss Airport	Bardufoss	BDU		Norway	NO	69.056114000000	18.540000000000	NOK
1209	Laughlin Bullhead International Airport	Bullhead City	IFP		United States	US	35.165634000000	-114.556950000000	USD
1210	Enschede	Enschede	ENS		Netherlands	NL	52.275000000000	6.886389000000	EUR
1211	Nesbyen Rail Station	Nesbyen Rail Station	XUL		Norway	NO	60.576667000000	9.113056000000	NOK
1212	Bauru	Bauru	JTC		Brazil	BR	-22.163611000000	-49.069167000000	BRL
1213	Sapporo Okadama Apt	Sapporo	OKD		Japan	JP	43.116111000000	141.380278000000	JPY
1214	Houeisay	Houeisay	HOE		Lao People's Democratic Republic	LA	20.258056000000	100.437222000000	LAK
1215	Kingaroy	Kingaroy	KGY		Australia	AU	-26.583333000000	151.850000000000	AUD
1216	Maracay	Maracay	MYC		Venezuela	VE	10.250000000000	-67.600000000000	VEB
1217	Isotoq	Isotoq	IOQ		Greenland	GL	65.548056000000	-38.976667000000	DKK
1218	Ottawa Bus Station	Ottawa	XHG		Canada	CA	45.866667000000	-75.716667000000	CAD
1219	Destin-Fort Walton Beach Airport	Destin	DSI		USA	US	30.399591000000	-86.470880000000	USD
1220	Logan International Airport	Boston	BOS		United States	US	42.366460000000	-71.020176000000	USD
1221	Horta Airport	Horta (Azores)	HOR		Portugal	PT	38.520000000000	-28.717222000000	EUR
1222	Pueblo Memorial Airport	Pueblo	PUB		United States	US	38.292778000000	-104.496110000000	USD
1223	Cadiz Rail Station	Cadiz Rail Station	CDZ		Spain	ES	36.529444000000	-6.288611000000	EUR
1224	London Euston Rail Station	London (GB)	QQU		United Kingdom	GB	51.533333000000	-0.133333000000	GBP
1225	Bonito	Bonito	BYO		Brazil	BR	-21.247222000000	-56.452500000000	BRL
1226	Matsuyama	Matsuyama	MYJ		Japan	JP	33.827222000000	132.699722000000	JPY
1227	Dumaguete	Dumaguete	DGT		Philippines	PH	9.334444000000	123.300000000000	PHP
1228	Inverway	Inverway	IVW		Australia	AU	-17.766667000000	129.233333000000	AUD
1229	Gaua	Gaua	ZGU		Vanuatu	VU	-14.219722000000	167.588333000000	VUV
1230	East Stroudsburg	East Stroudsburg	ESP		USA	US	41.000000000000	-75.183333000000	USD
1231	Tunica	Tunica	UTM		USA	US	34.680833000000	-90.346389000000	USD
1232	Dubrovnik Airport	Dubrovnik	DBV		Croatia	HR	42.560718000000	18.260617000000	EUR
1233	Jersey Airport	Jersey	JER		United Kingdom	GB	49.205297000000	-2.194344000000	GBP
1234	Ketchikan International Airport	Ketchikan	KTN		United States	US	55.356550000000	-131.708694000000	USD
1235	Baccarini Airport	Grosseto	GRS		Italy	IT	42.761944000000	11.070556000000	EUR
1236	Higuero	Higuero	JBQ		Dominican Republic	DO	18.572222000000	-69.985556000000	DOP
1237	Heide/Buesum	Heide/Buesum	HEI		Germany	DE	54.153333000000	8.901667000000	EUR
1238	Madrid Torrejon	Madrid	TOJ		Spain	ES	40.496667000000	-3.445833000000	EUR
1239	Catamarca	Catamarca	CTC		Argentina	AR	-28.593056000000	-65.751111000000	ARS
1240	Guanghua	Guanghua	LHK		China	CN	32.266667000000	111.633333000000	RMB
1241	Bajawa	Bajawa	BJW		Indonesia	ID	-8.783333000000	120.966667000000	IDR
1242	Kokoda	Kokoda	KKD		Papua New Guinea	PG	-8.883333000000	147.733333000000	PGK
1243	Condoto	Condoto	COG		Colombia	CO	5.100000000000	-76.616667000000	COP
1244	Galveston	Galveston	GLS		USA	US	29.266667000000	-94.866667000000	USD
1245	Guelph Rail Station	Guelph Rail Station	XIA		Canada	CA	43.550000000000	-80.250000000000	CAD
1246	Bournemouth Airport	Bournemouth	BOH		United Kingdom	GB	50.778269000000	-1.832476000000	GBP
1247	Detroit Metropolitan Wayne County Airport	Detroit	DTW		United States	US	42.207808000000	-83.356048000000	USD
1248	Braunschweig Airport	Braunschweig	BWE		Germany	DE	52.266666000000	10.533333000000	EUR
1249	Bethel Airport	Bethel	BET		United States	US	60.784443000000	-161.831390000000	USD
1250	Eday	Eday	EOI		United Kingdom	GB	59.190556000000	-2.772222000000	GBP
1251	Portsmouth	Portsmouth	PME		United Kingdom	GB	50.833333000000	-1.050000000000	GBP
1252	Bilbao Abando Rail Stn	Bilbao Abando Rail Stn	YJI		Spain	ES	43.260833000000	-2.927500000000	EUR
1253	Resistencia	Resistencia	RES		Argentina	AR	-27.450000000000	-59.056111000000	ARS
1254	Wuzhou	Wuzhou	WUZ		China	CN	23.456667000000	111.248056000000	RMB
1255	Naha	Naha	NAH		Indonesia	ID	3.683333000000	125.528056000000	IDR
1256	Manguna	Manguna	MFO		Papua New Guinea	PG	-5.566667000000	151.783333000000	PGK
1257	Puerto Asis	Puerto Asis	PUU		Colombia	CO	0.505278000000	-76.500833000000	COP
1258	Qaarsut	Qaarsut	JQA		Greenland	GL	70.733611000000	-52.692778000000	DKK
1259	Oakville Rail Station	Oakville Rail Station	XOK		Canada	CA	43.455278000000	-79.682778000000	CAD
1260	Tampere-Pirkkala Airport	Tampere	TMP		Finland	FI	61.420449000000	23.617564000000	EUR
1261	Buffalo Niagara International Airport	Buffalo	BUF		United States	US	42.933828000000	-78.731804000000	USD
1262	Ioannina Airport	Ioannina	IOA		Greece	GR	39.696667000000	20.825832000000	EUR
1263	Mustique	Mustique	MQS		St Vincent and the Grenadines	VC	12.888333000000	-61.179167000000	XCD
1264	Hemavan/Tarnaby	Hemavan/Tarnaby	HMV		Sweden	SE	65.806111000000	15.082778000000	SEK
1265	Moss Rail Station	Moss Rail Station	XKM		Norway	NO	59.431944000000	10.656944000000	NOK
1266	London Brit Rail Terminal	London Brit Rail Terminal	ZLX		United Kingdom	GB	12.944444000000	23.563333000000	GBP
1267	El Bolson	El Bolson	EHL		Argentina	AR	-41.966667000000	-71.516667000000	ARS
1268	Luxi	Luxi	LUM		China	CN	24.401389000000	98.532222000000	RMB
1269	Baler	Baler	BQA		Philippines	PH	15.766667000000	121.566667000000	PHP
1270	Odessa-Central Airport	Odessa	ODS		Ukraine	UA	46.441008000000	30.676718000000	UAH
1271	Cheddi Jagan International Airport	Georgetown	GEO		Guyana	GY	6.503833000000	-58.253078000000	GYD
1272	Benbecula Airport	Benbecula	BEB		United Kingdom	GB	57.473415000000	-7.376028000000	GBP
1273	Helena Regional Airport	Helena	HLN		United States	US	46.610520000000	-111.990180000000	USD
1274	Geilo	Geilo	DLD		Norway	NO	60.416667000000	8.516667000000	NOK
1275	Anglesey	Anglesey	VLY		United Kingdom	GB	53.248333000000	-4.535278000000	GBP
1276	Alto Rio Senguerr	Alto Rio Senguerr	ARR		Argentina	AR	-45.166667000000	-71.000000000000	ARS
1277	Jiagedaqi	Jiagedaqi	JGD		China	CN	50.378056000000	124.115556000000	RMB
1278	Erechim	Erechim	ERM		Brazil	BR	-27.663333000000	-52.271944000000	BRL
1279	Nangan	Nangan	LZN		Chinese Taipei	TW	26.159444000000	119.958333000000	TWD
1280	Bokondini	Bokondini	BUI		Indonesia	ID	-3.716667000000	138.650000000000	IDR
1281	Apia Fagali'i Apt	Apia	FGI		Samoa	WS	-13.849444000000	-171.739722000000	WST
1282	Queenstown (AU)	Queenstown (AU)	UEE		Australia	AU	-42.000000000000	145.508333000000	AUD
1283	Corner Bay	Corner Bay	CBA		USA	US	57.736111000000	-135.133056000000	USD
1284	San Diego Brown Municipal Apt	San Diego	SDM		USA	US	32.566667000000	-116.983333000000	USD
1285	Port Hardy	Port Hardy	YZT		Canada	CA	50.680556000000	-127.366667000000	CAD
1286	Kikori	Kikori	KRI		Papua New Guinea	PG	-7.416667000000	144.216667000000	PGK
1287	El Yopal	El Yopal	EYP		Colombia	CO	5.319167000000	-72.383889000000	COP
1288	Kapalua	Kapalua	JHM		USA	US	20.963056000000	-156.673056000000	USD
1289	Quebec Levis Rail Station	Levis Rail Station	XLK		Canada	CA	46.800000000000	-71.183333000000	CAD
1290	Aalborg Airport	Aalborg	AAL		Denmark	DK	57.086551000000	9.872241000000	DKK
1291	Yap Airport	Yap, Caroline Islands	YAP		Micronesia	FM	9.497715000000	138.086730000000	USD
1292	Guararapes International Airport	Recife	REC		Brazil	BR	-8.131507000000	-34.917921000000	BRL
1293	Sitia Airport	Sitia	JSH		Greece	GR	35.216667000000	26.116667000000	EUR
1294	Kamembe	Kamembe	KME		Rwanda	RW	-2.462222000000	28.908056000000	RWF
1295	Rota (ES)	Rota (ES)	ROZ		Spain	ES	36.645278000000	-6.349444000000	EUR
1296	Poltava	Poltava	PLV		Ukraine	UA	49.583333000000	34.533333000000	UAH
1297	Danyang Rail Station	Danyang Rail Station	DYN		China	CN	32.003611000000	119.586944000000	RMB
1298	Jorhat	Jorhat	JRH		India	IN	26.731667000000	94.175556000000	INR
1299	Fangatau	Fangatau	FGU		French Polynesia	PF	-15.820000000000	-140.885833000000	XPF
1300	Satwag	Satwag	SWG		Papua New Guinea	PG	-5.883333000000	147.950000000000	PGK
1301	Ames	Ames	AMW		USA	US	42.000000000000	-93.616667000000	USD
1302	Vail/Eagle Vail Van Station	Vail	QBF		USA	US	39.633333000000	-106.366667000000	USD
1303	Hartley Bay	Hartley Bay	YTB		Canada	CA	53.416667000000	-129.250000000000	CAD
1304	Santa Isabel Airport	Malabo	SSG		Equatorial Guinea	GQ	3.757791000000	8.716096000000	XAF
1305	Sonegaon Airport	Nagpur	NAG		India	IN	21.090037000000	79.056360000000	INR
1306	Glenegedale Airport	Islay	ILY		United Kingdom	GB	55.681946000000	-6.254167000000	GBP
1307	Mayaguana	Mayaguana	MYG		Bahamas	BS	22.379444000000	-73.013611000000	BSD
1308	Huelva Rail Station	Huelva Rail Station	HEV		Spain	ES	37.253056000000	-6.951111000000	EUR
1309	Vitoria Bus Station	Vitoria Bus Station	VTI		Spain	ES	42.849722000000	-2.665833000000	EUR
1310	Caruaru	Caruaru	CAU		Brazil	BR	-8.283333000000	-35.966667000000	BRL
1311	Kochi (JP)	Kochi (JP)	KCZ		Japan	JP	33.546111000000	133.669444000000	JPY
1312	Kunduz	Kunduz	UND		Afghanistan	AF	36.665278000000	68.910556000000	USD
1313	Gisborne	Gisborne	GIS		New Zealand	NZ	-38.663889000000	177.976944000000	NZD
1314	Araracuara	Araracuara	ACR		Colombia	CO	-0.600833000000	-72.396389000000	COP
1315	Excursion Inlet	Excursion Inlet	EXI		USA	US	58.419722000000	-135.448056000000	USD
1316	Blue Mountain	Blue Mountain	VBM		USA	US	57.857500000000	-157.086667000000	USD
1317	Zadar Airport	Zadar	ZAD		Croatia	HR	44.097778000000	15.356667000000	EUR
1318	East Midlands Airport	Leicestershire	EMA		United Kingdom	GB	52.825872000000	-1.330595000000	GBP
1319	Citta Di Torino Airport	Turin	TRN		Italy	IT	45.191455000000	7.643049000000	EUR
1320	Glacier Park International Airport	Kalispell	FCA		United States	US	48.307304000000	-114.253152000000	USD
1321	Gloucestershire Airport	Gloucester	GLO		United Kingdom	GB	51.883330000000	-2.233333000000	GBP
1322	Stornoway Airport	Stornoway	SYY		United Kingdom	GB	58.213627000000	-6.321995000000	GBP
1323	Mangrove Cay	Mangrove Cay	MAY		Bahamas	BS	24.216667000000	-77.666667000000	BSD
1324	Brize Norton	Brize Norton	BZZ		United Kingdom	GB	51.750000000000	-1.583333000000	GBP
1325	Sodankyla	Sodankyla	SOT		Finland	FI	67.383333000000	26.616667000000	EUR
1326	Nyborg Rail Station	Nyborg Rail Station	ZIB		Denmark	DK	55.316667000000	10.800000000000	DKK
1327	Dubai (AE) 00	Dubai (AE) 00	DCG		United Arab Emirates	AE	25.242222000000	55.331667000000	AED
1328	Mongu	Mongu	MNR		Zambia	ZM	-15.255278000000	23.156389000000	ZMK
1329	Tambolaka	Tambolaka	TMC		Indonesia	ID	-9.409722000000	119.244444000000	IDR
1330	Mornington Island	Mornington Island	ONG		Australia	AU	-16.661667000000	139.170556000000	AUD
1331	Makoua	Makoua	MKJ		Congo	CG	-0.016667000000	15.583333000000	XAF
1332	Naukiti	Naukiti	NKI		USA	US	55.855556000000	-133.183333000000	USD
1333	Murray Bay	Murray Bay	YML		Canada	CA	47.650000000000	-70.166667000000	CAD
1334	Kazan Airport	Kazan	KZN		Russian Federation	RU	55.608439000000	49.298240000000	RUB
1335	Passo Fundo Airport	Passo Fundo	PFB		Brazil	BR	-28.250000000000	-52.333333000000	BRL
1336	Savonlinna Airport	Savonlinna	SVL		Finland	FI	61.950000000000	28.950000000000	EUR
1337	Meru-Kinna	Meru-Kinna	JJM		Kenya	KE	0.228056000000	38.172222000000	KES
1338	Fort William Heliport	Fort William Heliport	FWM		United Kingdom	GB	56.816667000000	-5.116667000000	GBP
1339	Gjerstad Rail Station	Gjerstad Rail Station	XGS		Norway	NO	58.870000000000	9.016667000000	NOK
1340	Fiumicino	Fiumicino	ZRR		Italy	IT	41.737222000000	12.245556000000	EUR
1341	Gabes	Gabes	GAE		Tunisia	TN	33.732500000000	9.916111000000	TND
1342	Swakopmund Rail Station	Swakopmund	ZSZ		Namibia	NA	-22.669444000000	14.566667000000	NAD
1343	Arorae Island	Arorae Island	AIS		Kiribati	KI	-2.633333000000	176.816667000000	AUD
1344	Rottnest Island	Rottnest Island	RTS		Australia	AU	-32.000000000000	115.533333000000	AUD
1345	Yola	Yola	YOL		Nigeria	NG	9.257500000000	12.430556000000	NGN
1346	Palmdale	Palmdale	PMD		USA	US	34.629444000000	-118.084444000000	USD
1347	Rae Lakes	Rae Lakes	YRA		Canada	CA	64.115833000000	-117.309167000000	CAD
1348	Lisbon Portela Airport	Lisbon	LIS		Portugal	PT	38.770043000000	-9.128165000000	EUR
1349	Leeds/Bradford Airport	Leeds	LBA		United Kingdom	GB	53.869339000000	-1.659985000000	GBP
1350	East Midlands Airport	Leicestershire	EMA		United Kingdom	GB	52.825872000000	-1.330595000000	GBP
1351	Bishop Airport	Flint	FNT		United States	US	42.973812000000	-83.738904000000	USD
1352	Mandelieu Airport	Cannes	CEQ		France	FR	43.546390000000	6.954167000000	EUR
1353	Rosita	Rosita	RFS		Nicaragua	NI	13.883333000000	-84.400000000000	NIO
1354	Ronda Rail Station	Ronda Rail Station	RRA		Spain	ES	36.733333000000	-5.166667000000	EUR
1355	Stevenage Rail Station	Stevenage Rail Station	XVJ		United Kingdom	GB	51.916667000000	-0.233333000000	GBP
1356	Prerov	Prerov	PRV		Czech Republic	CZ	49.425833000000	17.404722000000	CZK
1357	Izumo	Izumo	IZO		Japan	JP	35.413611000000	132.890000000000	JPY
1358	Simara	Simara	SIF		Nepal	NP	27.159444000000	84.980000000000	NPR
1359	Fakahina	Fakahina	FHZ		French Polynesia	PF	-15.992222000000	-140.164722000000	XPF
1360	Ujae Island	Ujae Island	UJE		Marshall Islands	MH	9.083333000000	165.666667000000	USD
1361	Cold Bay	Cold Bay	CDB		USA	US	55.206111000000	-162.725556000000	USD
1362	Seymour	Seymour	SER		USA	US	38.950000000000	-85.883333000000	USD
1363	York Landing	York Landing	ZAC		Canada	CA	56.084444000000	-96.084722000000	CAD
1364	Guernsey Airport	Guernsey	GCI		United Kingdom	GB	49.432756000000	-2.595044000000	GBP
1365	Gen Fierro Villalobos Airport	Chihuahua	CUU		Mexico	MX	28.704048000000	-105.969523000000	MXN
1366	Perth Airport	Perth	PER		Australia	AU	-31.933604000000	115.960236000000	AUD
1367	Vardoe Airport	Vardoe	VAW		Norway	NO	70.354720000000	31.045555000000	NOK
1368	Puerto Jimenez	Puerto Jimenez	PJM		Costa Rica	CR	8.536111000000	-83.301389000000	CRC
1369	Soria Rail Station	Soria Rail Station	RII		Spain	ES	41.755000000000	-2.476667000000	EUR
1370	London Victoria Rail Station	London Victoria Rail Station	ZEP		United Kingdom	GB	51.495000000000	-0.144722000000	GBP
1371	Gafsa	Gafsa	GAF		Tunisia	TN	34.421944000000	8.822500000000	TND
1372	Windhoek Rail Station	Windhoek	ZWH		Namibia	NA	-22.569444000000	17.102778000000	NAD
1373	Aitutaki Island	Aitutaki Island	AIT		Cook Islands	CK	-18.831111000000	-159.764722000000	NZD
1374	Rurutu	Rurutu	RUR		French Polynesia	PF	-22.434167000000	-151.360556000000	XPF
1375	Basankusu	Basankusu	BSU		Congo Democratic Republic of	CD	1.216667000000	19.800000000000	CDF
1376	Cincinnati Municipal Apt	Cincinnati	LUK		USA	US	39.100000000000	-84.416667000000	USD
1377	Fort Resolution	Fort Resolution	YFR		Canada	CA	61.183333000000	-113.683333000000	CAD
1378	Beziers Vias Airport	Beziers	BZR		France	FR	43.324167000000	3.354444000000	EUR
1379	Hassan I Airport	Laayoune	EUN		Morocco	MA	27.133333000000	-13.216667000000	MAD
1380	Male International Airport	Male	MLE		Maldives	MV	4.201389000000	73.524444000000	MVR
1381	Tiree Airport	Tiree	TRE		United Kingdom	GB	56.500557000000	-6.871389000000	GBP
1382	Anegada	Anegada	NGD		Virgin Islands, British	VG	18.733333000000	-64.316667000000	USD
1383	Elba Island	Elba Island	EBA		Italy	IT	42.761667000000	10.239722000000	EUR
1384	Durham Rail Station	Durham Rail Station	XVU		United Kingdom	GB	54.783333000000	-1.566667000000	GBP
1385	Ploiesti Bus Station	Ploiesti Bus Station	QPL		Romania	RO	44.950000000000	26.016667000000	ROL
1386	Tobruk	Tobruk	TOB		Libya	LY	31.850000000000	23.916667000000	LYD
1387	Dambula	Dambula	DBU		Sri Lanka	LK	7.865833000000	80.627222000000	LKR
1388	Flinders Island	Flinders Island	FLS		Australia	AU	-40.094444000000	147.993889000000	AUD
1389	Adelaide Keswick Rail Station	Adelaide	XHX		Australia	AU	-34.933333000000	138.566667000000	AUD
1390	Houston Ellington Field	Houston	EFD		USA	US	29.602778000000	-95.152778000000	USD
1391	Temple	Temple	TPL		USA	US	31.150000000000	-97.400000000000	USD
1392	Syracuse Ny Railway Station	Syracuse Ny Railway Station	ZYQ		USA	US	43.071944000000	-76.075556000000	USD
1393	Comox	Comox	YQQ		Canada	CA	49.710833000000	-124.886667000000	CAD
1394	Nordela Airport	Ponta Delgada (Azores)	PDL		Portugal	PT	37.743847000000	-25.696469000000	EUR
1395	London Gatwick Airport	London	LGW		United Kingdom	GB	51.156807000000	-0.161863000000	GBP
1396	Dushanbe Airport	Dushanbe	DYU		Tajikistan	TJ	38.548940000000	68.817287000000	TJS
1397	North Central West Virginia Airport	Clarksburg	CKB		United States	US	39.295555000000	-80.229450000000	USD
1398	Gore	Gore	GOR		Ethiopia	ET	8.166667000000	35.550000000000	ETB
1399	Soderhamn	Soderhamn	SOO		Sweden	SE	61.266667000000	17.100000000000	SEK
1400	Rovno	Rovno	RWN		Ukraine	UA	50.600000000000	26.150000000000	UAH
1401	Qianjiang	Qianjiang	JIQ		China	CN	29.514722000000	108.831667000000	RMB
1402	Srinagar	Srinagar	SXR		India	IN	33.987222000000	74.774167000000	INR
1403	Imonda	Imonda	IMD		Papua New Guinea	PG	-3.350000000000	141.166667000000	PGK
1404	Guiria	Guiria	GUI		Venezuela	VE	10.566667000000	-62.300000000000	VEB
1405	Lake Havasu City	Lake Havasu City	HII		USA	US	34.568333000000	-114.355278000000	USD
1406	New York 39th St Ferry	New York 39th St Ferry	XNY		USA	US	40.750000000000	-74.000000000000	USD
1407	Mediterranee Airport	Montpellier	MPL		France	FR	43.578430000000	3.959174000000	EUR
1408	Cardiff-Wales Airport	Cardiff	CWL		United Kingdom	GB	51.398768000000	-3.339075000000	GBP
1409	Simon Bolivar Airport	Caracas	CCS		Venezuela	VE	10.596942000000	-67.005511000000	VEB
1410	Puente Genil Airport	Puente Genil	GEN		Spain and Canary Islands	ES	37.383330000000	-4.766667000000	EUR
1411	Chitre	Chitre	CTD		Panama	PA	7.987778000000	-80.409722000000	PAB
1412	Papa Westray	Papa Westray	PPW		United Kingdom	GB	59.351389000000	-2.900000000000	GBP
1413	Runcorn Rail Station	Runcorn Rail Station	XRC		United Kingdom	GB	53.333333000000	-2.733333000000	GBP
1414	Pardubice Rail Station	Pardubice Rail Station	XJP		Czech Republic	CZ	50.032500000000	15.756667000000	CZK
1415	Hateruma	Hateruma	HTR		Japan	JP	24.050000000000	123.783333000000	JPY
1416	Panjgur	Panjgur	PJG		Pakistan	PK	26.954444000000	64.132500000000	PKR
1417	Efogi	Efogi	EFG		Papua New Guinea	PG	-9.150000000000	147.666667000000	PGK
1418	Wallis Island	Wallis Island	WLS		Wallis and Futuna Islands	WF	-13.238333000000	-176.198889000000	XPF
1419	Decatur	Decatur	DEC		USA	US	39.834444000000	-88.865556000000	USD
1420	Sheldon Point	Sheldon Point	SXP		USA	US	62.521667000000	-164.846667000000	USD
1421	San Juan de la Maguana	San Juan de la Maguana	SJM		Dominican Republic	DO	18.833333000000	-71.233333000000	DOP
1422	Naples Central Rail Stn	Naples Central Rail Stn	INP		Italy	IT	40.852222000000	14.273056000000	EUR
1423	Raufoss Rail Station	Raufoss Rail Station	ZMQ		Norway	NO	60.723333000000	10.614444000000	NOK
1424	Abu Simbel	Abu Simbel	ABS		Egypt	EG	22.375833000000	31.611667000000	EGP
1425	Diu	Diu	DIU		India	IN	20.713889000000	70.921667000000	INR
1426	Coonabarabran	Coonabarabran	COJ		Australia	AU	-31.333333000000	149.266667000000	AUD
1427	Woomera	Woomera	UMR		Australia	AU	-31.166667000000	136.833333000000	AUD
1428	Central	Central	CEM		USA	US	65.573611000000	-144.779167000000	USD
1429	Shungnak	Shungnak	SHG		USA	US	66.888056000000	-157.162500000000	USD
1430	East Main	East Main	ZEM		Canada	CA	52.225833000000	-78.522500000000	CAD
1431	Kukundu	Kukundu	KUE		Solomon Islands	SB	-8.016667000000	156.950000000000	SBD
1432	Providencia	Providencia	PVA		Colombia	CO	13.358611000000	-81.358333000000	COP
1433	New York Downtown Manhattan H/P	New York	JRB		USA	US	40.701111000000	-74.008889000000	USD
1434	Parksville Rail Station	Parksville Rail Station	XPB		Canada	CA	49.307778000000	-124.324167000000	CAD
1435	North Front Airport	Gibraltar	GIB		Gibraltar	GI	36.153763000000	-5.349271000000	GIP
1436	Bellingham Airport	Bellingham	BLI		United States	US	48.795733000000	-122.532672000000	USD
1437	Koyukuk	Koyukuk	KYU		USA	US	64.876389000000	-157.724444000000	USD
1438	Pitt Greenville Airport	Greenville	PGV		United States	US	35.633600000000	-77.380800000000	USD
1439	Andriamena	Andriamena	WAD		Madagascar	MG	-17.450000000000	47.516667000000	MGA
1440	Karlsruhe Bus Service	Karlsruhe Bus Service	QKA		Germany	DE	-29.950833000000	-51.093889000000	EUR
1441	Chkalovsky	Chkalovsky	CKL		Russian Federation	RU	55.866667000000	38.051944000000	RUB
1442	Kharga	Kharga	UVL		Egypt	EG	25.483333000000	30.583333000000	EGP
1443	Dhangarhi	Dhangarhi	DHI		Nepal	NP	28.754722000000	80.582500000000	NPR
1444	Cape Orford	Cape Orford	CPI		Papua New Guinea	PG	-5.433333000000	152.083333000000	PGK
1445	Stewart Island	Stewart Island	SZS		New Zealand	NZ	-47.000000000000	167.866667000000	NZD
1446	Naples	Naples (US)	APF		USA	US	26.153333000000	-81.775278000000	USD
1447	Igaliku Heliport	Igaliku Heliport	QFX		Greenland	GL	60.991111000000	-45.421111000000	DKK
1448	Trenton	Trenton	YTR		Canada	CA	44.100000000000	-77.566667000000	CAD
1449	Barcelona-El Prat Airport	Barcelona	BCN		Spain and Canary Islands	ES	41.303027000000	2.075930000000	EUR
1450	Johnson-Bell Field	Missoula	MSO		United States	US	46.918965000000	-114.083216000000	USD
1451	Talaveral La Real Airport	Badajoz	BJZ		Spain and Canary Islands	ES	38.891666000000	-6.820000000000	EUR
1452	 Eugene Airport	Eugene	EUG		USA	US	44.119198000000	-123.211970000000	USD
1453	Coventry	Coventry	CVT		United Kingdom	GB	52.369722000000	-1.479722000000	GBP
1454	North Ronaldsay	North Ronaldsay	NRL		United Kingdom	GB	59.367500000000	-2.434444000000	GBP
1455	Ust Nera	Ust Nera	USR		Russian Federation	RU	64.549444000000	143.110833000000	RUB
1456	Jinju	Jinju	HIN		Korea Republic of	KR	35.088611000000	128.070278000000	KRW
1457	Muzaffarnagar	Muzaffarnagar	MZA		India	IN	29.483333000000	77.700000000000	INR
1458	Borroloola	Borroloola	BOX		Australia	AU	-16.083333000000	136.300000000000	AUD
1459	Thursday Island	Thursday Island	TIS		Australia	AU	-10.585833000000	142.221389000000	AUD
1460	M'bigou	M'bigou	MBC		Gabon	GA	-1.883333000000	11.933333000000	XAF
1461	Mccall	Mccall	MYL		USA	US	45.883333000000	-116.100000000000	USD
1462	Meadow Lake	Meadow Lake	YLJ		Canada	CA	54.125278000000	-108.522778000000	CAD
1463	Levaldigi Airport	Cuneo	CUF		Italy	IT	44.535278000000	7.617500000000	EUR
1464	Mikonos Airport	Mikonos	JMK		Greece	GR	37.436111000000	25.344444000000	EUR
1465	Ilulissat Airport	Ilulissat	JAV		Greenland	GL	69.234444000000	-51.051111000000	DKK
1466	Ra'sal-Khaymah Airport	Ra'sal-Khaymah	RKT		United Arab Emirates	AE	25.616198000000	55.943695000000	AED
1467	Wrangell Airport	Wrangell	WRG		United States	US	56.484444000000	-132.366670000000	USD
1468	Den Helder	Den Helder	DHR		Netherlands	NL	52.924444000000	4.780833000000	EUR
1469	Salerno	Salerno	QSR		Italy	IT	40.620000000000	14.912500000000	EUR
1470	Zonalnoye	Zonalnoye	ZZO		Russian Federation	RU	50.000000000000	142.000000000000	RUB
1471	Okinawa Kadena AFB	Okinawa	DNA		Japan	JP	26.350000000000	127.766667000000	JPY
1472	Jodhpur	Jodhpur	JDH		India	IN	26.251111000000	73.048889000000	INR
1473	Exmouth Gulf	Exmouth Gulf	EXM		Australia	AU	-22.383333000000	114.116667000000	AUD
1474	Woitape	Woitape	WTP		Papua New Guinea	PG	-8.545833000000	147.251944000000	PGK
1475	Dubois	Dubois	DUJ		USA	US	41.178333000000	-78.898611000000	USD
1476	Oklahoma City Tinker AFB	Oklahoma City	TIK		USA	US	35.422778000000	-97.384722000000	USD
1477	Churchill Falls	Churchill Falls	ZUM		Canada	CA	53.562778000000	-64.106111000000	CAD
1478	Kisangani Airport	Kisangani	FKI		The Democratic Republic of The Congo	CD	0.516667000000	25.200000000000	CDF
1479	Zamboanga Airport	Zamboanga	ZAM		Philippines	PH	6.919294000000	122.062259000000	PHP
1480	Southwest Oregon Regional Airport	North Bend	OTH		United States	US	43.418888000000	-124.240000000000	USD
1481	Carlisle	Carlisle	CAX		United Kingdom	GB	54.937500000000	-2.809167000000	GBP
1482	London St Pancras Intl Rail Station	London (GB)	QQS		United Kingdom	GB	51.531667000000	-0.126389000000	GBP
1483	Glasgow Central Rail Station	Glasgow (GB)	ZGG		United Kingdom	GB	55.850000000000	-4.250000000000	GBP
1484	Aberdeen Rail Station	Aberdeen Rail Station	ZXA		United Kingdom	GB	57.166667000000	-2.066667000000	GBP
1485	Gassim	Gassim	ELQ		Saudi Arabia	SA	26.302778000000	43.773889000000	SAR
1486	Nelspruit (ZA) 00	Nelspruit (ZA) 00	NLP		South Africa	ZA	-25.500000000000	30.916667000000	ZAR
1487	Frankfurt - Hahn Airport	Hahn	HHN		Germany	DE	49.948333000000	7.264167000000	EUR
1488	Kosrae Airport	Kosrae, Caroline Islands	KSA		Micronesia	FM	5.352478000000	162.956603000000	USD
1489	Nagasaki Airport	Nagasaki	NGS		Japan	JP	32.914398000000	129.922570000000	JPY
1490	Sumburgh Airport	Shetland Islands	LSI		United Kingdom	GB	59.877888000000	-1.287111000000	GBP
1491	Sukkur	Sukkur	SKZ		Pakistan	PK	27.721389000000	68.793056000000	PKR
1492	Croker Island	Croker Island	CKI		Australia	AU	-11.083333000000	132.500000000000	AUD
1493	Savusavu	Savusavu	SVU		Fiji	FJ	-16.799167000000	179.338889000000	FJD
1494	Alamogordo Municipal Apt	Alamogordo	ALM		USA	US	32.840000000000	-105.990556000000	USD
1495	Pinedale	Pinedale	PWY		USA	US	42.795278000000	-109.806944000000	USD
1496	Sachs Harbour	Sachs Harbour	YSY		Canada	CA	71.993889000000	-125.242500000000	CAD
1497	Iboki	Iboki	IBI		Papua New Guinea	PG	-5.552778000000	149.188889000000	PGK
1498	Biniguni	Biniguni	XBN		Papua New Guinea	PG	-9.633333000000	149.316667000000	PGK
1499	Hobart Bay	Hobart Bay	HBH		USA	US	57.408333000000	-133.466667000000	USD
1500	Brockville	Brockville	XBR		Canada	CA	44.639167000000	-75.750556000000	CAD
1501	Brac	Brac	BWK		Croatia	HR	43.285833000000	16.679722000000	EUR
1502	Yap Airport	Yap, Caroline Islands	YAP		Micronesia	FM	9.497715000000	138.086730000000	USD
1503	Sacramento International Airport	Sacramento	SMF		United States	US	38.692283000000	-121.593695000000	USD
1504	Mora Airport	Mora	MXX		Sweden	SE	60.958120000000	14.504529000000	SEK
1505	Belize City Municipal Apt	Belize City	TZA		Belize	BZ	17.516389000000	-88.195556000000	BZD
1506	Rota (ES)	Rota (ES)	ROZ		Spain	ES	36.645278000000	-6.349444000000	EUR
1507	Bogorodskoye	Bogorodskoye	BQG		Russian Federation	RU	52.378333000000	140.448333000000	RUB
1508	Tebessa	Tebessa	TEE		Algeria	DZ	35.431667000000	8.120833000000	DZD
1509	Chitral	Chitral	CJL		Pakistan	PK	35.886667000000	71.800556000000	PKR
1510	Cunnamulla	Cunnamulla	CMA		Australia	AU	-28.030000000000	145.622222000000	AUD
1511	Proserpine	Proserpine	PPP		Australia	AU	-20.494167000000	148.553056000000	AUD
1512	Ouango-Fitini	Ouango-Fitini	OFI		Cote D'Ivoire	CI	9.600000000000	-4.033333000000	XOF
1513	Olympia	Olympia	OLM		USA	US	46.966667000000	-122.900000000000	USD
1514	High Level	High Level	YOJ		Canada	CA	58.621389000000	-117.164722000000	CAD
1515	Zonguldak Airport	Zonguldak	ONQ		Turkey	TR	41.516667000000	32.100000000000	USD
1516	Dalian Airport	Dalian	DLC		China	CN	38.961020000000	121.539991000000	RMB
1517	Glenegedale Airport	Islay	ILY		United Kingdom	GB	55.681946000000	-6.254167000000	GBP
1518	Yakutat Airport	Yakutat	YAK		United States	US	59.510300000000	-139.668000000000	USD
1519	Huelva Rail Station	Huelva Rail Station	HEV		Spain	ES	37.253056000000	-6.951111000000	EUR
1520	Vitoria Bus Station	Vitoria Bus Station	VTI		Spain	ES	42.849722000000	-2.665833000000	EUR
1521	Uzhhorod	Uzhhorod	UDJ		Ukraine	UA	48.634167000000	22.263333000000	UAH
1522	Hachijo Jima	Hachijo Jima	HAC		Japan	JP	33.115000000000	139.785833000000	JPY
1523	Meghauli	Meghauli	MEY		Nepal	NP	27.577500000000	84.228889000000	NPR
1524	Debepare	Debepare	DBP		Papua New Guinea	PG	-6.283333000000	141.900000000000	PGK
1525	Baimuru	Baimuru	VMU		Papua New Guinea	PG	-7.500000000000	144.800000000000	PGK
1526	Carlsbad	Carlsbad	CNM		USA	US	32.337500000000	-104.263333000000	USD
1527	Seldovia	Seldovia	SOV		USA	US	59.443889000000	-151.705278000000	USD
1528	La Tabatiere	La Tabatiere	ZLT		Canada	CA	50.830833000000	-58.975278000000	CAD
1529	Santander Airport	Santander	SDR		Spain and Canary Islands	ES	43.423086000000	-3.824453000000	EUR
1530	E. T. Joshua	Saint Vincent	SVD		Saint Vincent and the Grenadines	VC	13.146040000000	-61.210380000000	XCD
1531	Blankensee Airport	Hamburg	LBC		Germany	DE	53.805273000000	10.701162000000	EUR
1532	Ted Stevens Anchorage International Airport	Anchorage	ANC		United States	US	61.174444000000	-149.996389000000	USD
1533	Heringsdorf Airport	Heringsdorf	HDF		Germany	DE	53.878250000000	14.138242000000	EUR
1534	Stornoway Airport	Stornoway	SYY		United Kingdom	GB	58.213627000000	-6.321995000000	GBP
1535	Knox County Regional Airport	Owls Head	RKD		United States	US	44.061200000000	-69.094300000000	USD
1536	Brize Norton	Brize Norton	BZZ		United Kingdom	GB	51.750000000000	-1.583333000000	GBP
1537	Padova Central Rail Station	Padova Central Rail Station	QPA		Italy	IT	45.417500000000	11.880278000000	EUR
1538	Mjolby Rail Station	Mjolby Rail Station	XXM		Sweden	SE	58.323056000000	15.131944000000	SEK
1539	Tefe	Tefe	TFF		Brazil	BR	-3.383333000000	-64.724167000000	BRL
1540	Lianhuashan	Lianhuashan	ZIY		China	CN	22.966667000000	113.500000000000	RMB
1541	Pangkor	Pangkor	PKG		Malaysia	MY	4.244722000000	100.553333000000	MYR
1542	Mapua	Mapua	MPU		Papua New Guinea	PG	-2.916667000000	151.416667000000	PGK
1543	Calabar	Calabar	CBQ		Nigeria	NG	4.976111000000	8.347222000000	NGN
1544	Lewistown	Lewistown	LWT		USA	US	47.048611000000	-109.471944000000	USD
1545	Ganges Harbor	Ganges Harbor	YGG		Canada	CA	48.850000000000	-123.500000000000	CAD
1546	Abruzzo Airport	Pescara	PSR		Italy	IT	42.437222000000	14.187222000000	EUR
1547	Raleigh/Durham Airport	Raleigh/Durham	RDU		United States	US	35.873592000000	-78.790862000000	USD
1548	Middlemount Airport	Middlemount	MMM		Australia	AU	-22.802500000000	148.704730000000	AUD
1549	Tepic	Tepic	TPQ		Mexico	MX	21.419444000000	-104.842500000000	MXN
1550	Fort William Heliport	Fort William Heliport	FWM		United Kingdom	GB	56.816667000000	-5.116667000000	GBP
1551	Stronsay	Stronsay	SOY		United Kingdom	GB	59.155278000000	-2.641944000000	GBP
1552	Aschaffenburg Rail Station	Aschaffenburg Rail Station	ZCB		Germany	DE	49.980278000000	9.143889000000	EUR
1553	Mukalla	Mukalla	RIY		Yemen	YE	14.662778000000	49.375000000000	YER
1554	Mmabatho	Mmabatho	MBD		South Africa	ZA	-25.798333000000	25.548056000000	ZAR
1555	Sukhothai	Sukhothai	THS		Thailand	TH	17.237778000000	99.818333000000	THB
1556	Boolgeeda	Boolgeeda	OCM		Australia	AU	-22.540000000000	117.275000000000	AUD
1557	Maradi	Maradi	MFQ		Niger	NE	13.500000000000	7.133333000000	XOF
1558	New Chenega	New Chenega	NCN		USA	US	60.079444000000	-147.995000000000	USD
1559	Leaf Rapids	Leaf Rapids	YLR		Canada	CA	56.450000000000	-100.000000000000	CAD
1560	Lisbon Portela Airport	Lisbon	LIS		Portugal	PT	38.770043000000	-9.128165000000	EUR
1561	Leeds/Bradford Airport	Leeds	LBA		United Kingdom	GB	53.869339000000	-1.659985000000	GBP
1562	Huejotsingo Airport	Puebla	PBC		Mexico	MX	19.135000000000	-98.367500000000	MXN
1563	Prince Rupert Seal Cove Apt	Prince Rupert	ZSW		Canada	CA	54.286111000000	-130.450000000000	CAD
1564	Huesca-Pirineos Airport	Huesca	HSK		Spain and Canary Islands	ES	42.080927000000	-0.323469000000	EUR
1565	El Plumerillo Airport	Mendoza	MDZ		Argentina	AR	-32.827888000000	-68.798909000000	ARS
1566	Perigueux Airport	Perigueux	PGX		France	FR	45.183334000000	0.716667000000	EUR
1567	Cauquira	Cauquira	CDD		Honduras	HN	15.322222000000	-83.602778000000	HNL
1568	Capri	Capri	PRJ		Italy	IT	40.556944000000	14.241944000000	EUR
1569	Nuneaton Rail Station	Nuneaton Rail Station	XNV		United Kingdom	GB	52.526111000000	-1.464722000000	GBP
1570	Zamora Rail Station	Zamora Rail Station	ZOB		Spain	ES	41.516111000000	-5.739722000000	EUR
1571	Al Hoceima	Al Hoceima	AHU		Morocco	MA	35.177222000000	-3.839444000000	MAD
1572	Skukuza	Skukuza	SZK		South Africa	ZA	-24.964444000000	31.590556000000	ZAR
1573	Port Klang	Port Klang	XPQ		Malaysia	MY	2.988889000000	101.393333000000	MYR
1574	Ramingining	Ramingining	RAM		Australia	AU	-12.356389000000	134.897500000000	AUD
1575	Warri	Warri	QRW		Nigeria	NG	5.598889000000	5.820278000000	NGN
1576	Pack Creek	Pack Creek	PBK		USA	US	57.400000000000	-134.283333000000	USD
1577	Port Menier	Port Menier	YPN		Canada	CA	49.836389000000	-64.289444000000	CAD
1578	Podgorica Airport	Podgorica	TGD		Montenegro	ME	42.368023000000	19.246024000000	EUR
1579	Charlotte Douglas International Airport	Charlotte	CLT		United States	US	35.219167000000	-80.935833000000	USD
1580	Brie-Champniers Airport	Angouleme	ANG		France	FR	45.733334000000	0.216667000000	EUR
1581	Bloomington-Normal Airport	Bloomington-Normal	BMI		USA	US	40.484010000000	-88.914830000000	USD
1582	Den Helder	Den Helder	DHR		Netherlands	NL	52.924444000000	4.780833000000	EUR
1583	Thorshofn	Thorshofn	THO		Iceland	IS	66.218333000000	-15.334722000000	ISK
1584	Cruzeiro do Sul	Cruzeiro do Sul	CZS		Brazil	BR	-7.600000000000	-72.769444000000	BRL
1585	Qingyang	Qingyang	IQN		China	CN	24.796667000000	118.589167000000	RMB
1586	Ratnagiri	Ratnagiri	RTC		India	IN	17.000000000000	73.316667000000	INR
1587	Hamilton (AU)	Hamilton (AU)	HLT		Australia	AU	-37.647222000000	142.061944000000	AUD
1588	Carupano	Carupano	CUP		Venezuela	VE	10.660000000000	-63.261667000000	VEB
1589	Tacoma Gray AAF	Tacoma	GRF		USA	US	47.078611000000	-122.580556000000	USD
1590	Tuntutuliak	Tuntutuliak	WTL		USA	US	60.350556000000	-162.655556000000	USD
1591	Toulon/Hyeres Rail Station	Toulon/Hyeres Rail Station	XZV		France	FR	43.128333000000	5.929722000000	EUR
1592	St. John's International Airport	St. John's	YYT		Canada	CA	47.612818000000	-52.743339000000	CAD
1593	King Khaled International Airport	Riyadh	RUH		Saudi Arabia	SA	24.959289000000	46.702876000000	SAR
1594	Tweed New Haven Airport	East Haven	HVN		United States	US	41.265278000000	-72.888336000000	USD
1595	Carlisle	Carlisle	CAX		United Kingdom	GB	54.937500000000	-2.809167000000	GBP
1596	London St Pancras Intl Rail Station	London (GB)	QQS		United Kingdom	GB	51.531667000000	-0.126389000000	GBP
1597	Glasgow Central Rail Station	Glasgow (GB)	ZGG		United Kingdom	GB	55.850000000000	-4.250000000000	GBP
1598	Aberdeen Rail Station	Aberdeen Rail Station	ZXA		United Kingdom	GB	57.166667000000	-2.066667000000	GBP
1599	Mitiga	Mitiga	MJI		Libya	LY	32.883333000000	13.266667000000	LYD
1600	Bharatpur	Bharatpur	BHR		Nepal	NP	27.678056000000	84.428056000000	NPR
1601	Leonardo da Vinci-Fiumicino Airport	Rome	FCO		Italy	IT	41.794594000000	12.250346000000	EUR
1602	Taba International Airport	Taba	TCP		Egypt	EG	29.550000000000	34.916667000000	EGP
1603	Ahmedabad Airport	Ahmedabad	AMD		India	IN	23.066389000000	72.624167000000	INR
1604	Sumburgh Airport	Shetland Islands	LSI		United Kingdom	GB	59.877888000000	-1.287111000000	GBP
1605	Marie Galante	Marie Galante	GBJ		Guadeloupe	GP	15.868889000000	-61.270000000000	EUR
1606	Brighton	Brighton	BSH		United Kingdom	GB	50.833333000000	-0.133333000000	GBP
1607	Grimsby	Grimsby	GSY		United Kingdom	GB	53.583333000000	-0.033333000000	GBP
1608	Thisted	Thisted	TED		Denmark	DK	57.068889000000	8.705278000000	DKK
1609	Budapest Deli Rail Station	Budapest Deli Rail Station	XXJ		Hungary	HU	47.499444000000	19.025000000000	HUF
1610	Huizhou	Huizhou	HUZ		China	CN	23.083333000000	114.366667000000	RMB
1611	Pondicherry	Pondicherry	PNY		India	IN	11.968333000000	79.811389000000	INR
1612	Cape Barren Island	Cape Barren Island	CBI		Australia	AU	-40.390278000000	148.015278000000	AUD
1613	Tabiteuea South	Tabiteuea South	TSU		Kiribati	KI	-1.333333000000	174.833333000000	AUD
1614	Barter Island	Barter Island	BTI		USA	US	70.133889000000	-143.581944000000	USD
1615	Rowan Bay	Rowan Bay	RWB		USA	US	56.750000000000	-134.133333000000	USD
1616	Taloyoak	Taloyoak	YYH		Canada	CA	69.546667000000	-93.576667000000	CAD
1617	Kagau	Kagau	KGE		Solomon Islands	SB	-7.328333000000	157.583333000000	SBD
1618	Monteria	Monteria	MTR		Colombia	CO	8.823611000000	-75.825833000000	COP
1619	Wilmington (US) OH	Wilmington	ILN		USA	US	39.423056000000	-83.786667000000	USD
1620	Coteau Rail Station	Coteau Rail Station	XGK		Canada	CA	45.274722000000	-74.233056000000	CAD
1621	Tirana International Airport	Tirana	TIA		Albania	AL	41.419133000000	19.713280000000	EUR
1622	London City Airport	London	LCY		United Kingdom	GB	51.500000000000	0.050000000000	GBP
1623	Pinto Martins Airport	Fortaleza	FOR		Brazil	BR	-3.779073000000	-38.540835000000	BRL
1624	Puerto Escondido Airport	Puerto Escondido	PXM		Mexico	MX	15.850000000000	-97.083336000000	MXN
1625	Bielefeld	Bielefeld	BFE		Germany	DE	51.964722000000	8.544722000000	EUR
1626	Patreksfjordur	Patreksfjordur	PFJ		Iceland	IS	65.555833000000	-23.965000000000	ISK
1627	Nyurba	Nyurba	NYR		Russian Federation	RU	63.296111000000	118.340833000000	RUB
1628	Beida	Beida	LAQ		Libya	LY	32.788611000000	21.964444000000	LYD
1629	Vadodara	Vadodara	BDQ		India	IN	22.336111000000	73.226389000000	INR
1630	Aragip	Aragip	ARP		Papua New Guinea	PG	-9.900000000000	149.466667000000	PGK
1631	Shepparton	Shepparton	SHT		Australia	AU	-36.433333000000	145.400000000000	AUD
1632	Herlong	Herlong	AHC		USA	US	40.150000000000	-120.133333000000	USD
1633	Pilot Station	Pilot Station	PQS		USA	US	61.934722000000	-162.899167000000	USD
1634	Marie Galante	Marie Galante	GBJ		Guadeloupe	GP	15.868889000000	-61.270000000000	EUR
1635	Brighton	Brighton	BSH		United Kingdom	GB	50.833333000000	-0.133333000000	GBP
1636	Grimsby	Grimsby	GSY		United Kingdom	GB	53.583333000000	-0.033333000000	GBP
1637	London Kings Cross Rail Station	London Kings Cross Rail Station	QQK		United Kingdom	GB	51.533333000000	-0.116667000000	GBP
1638	Neftekamsk	Neftekamsk	NEF		Russian Federation	RU	56.100000000000	54.350000000000	RUB
1639	Chiayi	Chiayi	CYI		Chinese Taipei	TW	23.461667000000	120.392778000000	TWD
1640	Leh	Leh	IXL		India	IN	34.135833000000	77.546389000000	INR
1641	Namatanai	Namatanai	ATN		Papua New Guinea	PG	-3.666667000000	152.450000000000	PGK
1642	Singleton	Singleton	SIX		Australia	AU	-32.566667000000	151.166667000000	AUD
1643	Anderson	Anderson	AID		USA	US	40.100000000000	-85.666667000000	USD
1644	Pulaski	Pulaski	PSK		USA	US	37.116667000000	-80.683333000000	USD
1645	Lutselke Snowdrift	Lutselke Snowdrift	YSG		Canada	CA	62.417778000000	-110.682500000000	CAD
1646	Gizo	Gizo	GZO		Solomon Islands	SB	-8.097500000000	156.863611000000	SBD
1647	Carimagua	Carimagua	CCO		Colombia	CO	4.566667000000	-71.333333000000	COP
1648	Galesburg	Galesburg	GBG		USA	US	40.933333000000	-90.433333000000	USD
1649	Selawik	Selawik	WLK		USA	US	66.600278000000	-159.984444000000	USD
1650	St Genis Bus Station	St Genis Bus Station	QXK		France	FR	46.250000000000	6.016667000000	EUR
1651	London City Airport	London	LCY		United Kingdom	GB	51.500000000000	0.050000000000	GBP
1652	Plattsburgh Air Force Base	Plattsburgh	PBG		United States	US	44.700000000000	-73.483333000000	USD
1653	Reunion Roland Garros Airport	Saint Denis de la Reunion	RUN		Réunion	RE	-20.892000000000	55.511875000000	EUR
1654	Inda Selassie	Inda Selassie	SHC		Ethiopia	ET	14.079444000000	38.271389000000	ETB
1655	Jaen Rail Station	Jaen Rail Station	JEA		Spain	ES	37.780000000000	-3.790833000000	EUR
1656	Rade Rail Station	Rade Rail Station	ZXX		Norway	NO	59.348056000000	10.866389000000	NOK
1657	Sa Dah	Sa Dah	SYE		Yemen	YE	16.966667000000	43.733333000000	YER
1658	Mocimboa Da Praia	Mocimboa Da Praia	MZB		Mozambique	MZ	-11.360000000000	40.355833000000	MZM
1659	Tarakan	Tarakan	TRK		Indonesia	ID	3.326667000000	117.566667000000	IDR
1660	Omora	Omora	OSE		Papua New Guinea	PG	-7.833333000000	147.083333000000	PGK
1661	Mosteiros	Mosteiros	MTI		Cape Verde	CV	15.000000000000	-24.433333000000	CVE
1662	Nephi	Nephi	NPH		USA	US	39.738889000000	-111.870833000000	USD
1663	Montreal Mirabel Intl Apt	Montreal	YMX		Canada	CA	45.673056000000	-74.033611000000	CAD
1664	Adana Airport	Adana	ADA		Turkey	TR	36.985032000000	35.297360000000	USD
1665	Bermuda International Airport	Bermuda	BDA		Bermuda	BM	32.359940000000	-64.701148000000	BMD
1666	Haifa Airport	Haifa	HFA		Israel	IL	32.811822000000	35.040180000000	ILS
1667	Inyokern Airport	Inyokern	IYK		United States	US	35.660600000000	-117.816000000000	USD
1668	La Graciosa	La Graciosa	GGA		Spain	ES	29.229167000000	-13.501389000000	EUR
1669	Darlington Rail Station	Darlington Rail Station	XVG		United Kingdom	GB	54.516667000000	-1.566667000000	GBP
1670	Araguaina	Araguaina	AUX		Brazil	BR	-7.228056000000	-48.240278000000	BRL
1671	Jingchang	Jingchang	JIC		China	CN	38.541944000000	102.348611000000	RMB
1672	Surat	Surat	STV		India	IN	21.114167000000	72.741667000000	INR
1673	Forbes	Forbes	FRB		Australia	AU	-33.366667000000	147.933333000000	AUD
1674	Manihi	Manihi	XMH		French Polynesia	PF	-14.436667000000	-146.070000000000	XPF
1675	Egegik	Egegik	EGX		USA	US	58.185556000000	-157.375556000000	USD
1676	Tiniteqilaaq Heliport	Tiniteqilaaq Heliport	TQI		Greenland	GL	65.891944000000	-37.783333000000	DKK
1677	Baltimore Rail Station	Baltimore Rail Station	ZZB		USA	US	39.283333000000	-76.600000000000	USD
1678	Tolmachevo Airport	Novosibirsk	OVB		Russian Federation	RU	55.009011000000	82.666999000000	RUB
1759	Tanga	Tanga	TGT		Tanzania United Republic of	TZ	-5.092500000000	39.071667000000	TZS
1679	Salt Lake City International Airport	Salt Lake City	SLC		United States	US	40.785645000000	-111.980673000000	USD
1680	Gloucestershire Airport	Gloucester	GLO		United Kingdom	GB	51.883330000000	-2.233333000000	GBP
1681	Stornoway Airport	Stornoway	SYY		United Kingdom	GB	58.213627000000	-6.321995000000	GBP
1682	Semipalatinsk	Semipalatinsk	PLX		Kazakhstan	KZ	50.351389000000	80.234444000000	KZT
1683	Brize Norton	Brize Norton	BZZ		United Kingdom	GB	51.750000000000	-1.583333000000	GBP
1684	Malmo Syd Rail Station	Malmo	XFR		Sweden	SE	55.548333000000	12.991111000000	SEK
1685	Rail (generic) - Belgium	Rail (generic) - Belgium	ZWY		Belgium	BE	50.833333000000	4.483333000000	EUR
1686	Houn	Houn	HUQ		Libya	LY	29.050000000000	15.933333000000	LYD
1687	Agra	Agra	AGR		India	IN	27.155833000000	77.960833000000	INR
1688	Amanab	Amanab	AMU		Papua New Guinea	PG	-3.583333000000	141.216667000000	PGK
1689	Spring Creek	Spring Creek	SCG		Australia	AU	-18.633333000000	144.550000000000	AUD
1690	Aleneva	Aleneva	AED		USA	US	58.033333000000	-152.900000000000	USD
1691	Fayetteville Pope AFB	Fayetteville (US) NC	POB		USA	US	35.167500000000	-79.018333000000	USD
1692	Roberval	Roberval	YRJ		Canada	CA	48.520000000000	-72.265556000000	CAD
1693	Belp Airport	Berne	BRN		Switzerland	CH	46.911728000000	7.503560000000	CHF
1694	Komatsu Airport	Komatsu	KMQ		Japan	JP	36.402369000000	136.413428000000	JPY
1695	Long Beach Airport	Long Beach	LGB		United States	US	33.818195000000	-118.144490000000	USD
1696	Kigoma	Kigoma	TKQ		Tanzania United Republic of	TZ	-4.888056000000	29.671667000000	TZS
1697	Kortrijk	Kortrijk	KJK		Belgium	BE	50.817222000000	3.204722000000	EUR
1698	Lancaster Rail Station (GB)	Lancaster Rail Station (GB)	XQL		United Kingdom	GB	54.050000000000	-2.800000000000	GBP
1699	Kirovsk/Apatity	Kirovsk/Apatity	KVK		Russian Federation	RU	67.576389000000	33.580278000000	RUB
1700	Baoshan	Baoshan	BSD		China	CN	25.053611000000	99.168056000000	RMB
1701	Simikot	Simikot	IMK		Nepal	NP	29.970833000000	81.818056000000	NPR
1702	Boulia	Boulia	BQL		Australia	AU	-22.913056000000	139.900833000000	AUD
1703	Tekadu	Tekadu	TKB		Papua New Guinea	PG	-7.666667000000	146.550000000000	PGK
1704	Big Creek	Big Creek	BIC		USA	US	57.666667000000	-157.583333000000	USD
1705	Reading	Reading	RDG		USA	US	40.383333000000	-75.966667000000	USD
1706	Gillette	Gillette	GCC		USA	US	44.347500000000	-105.541667000000	USD
1707	Mountain Home	Mountain Home	WMH		USA	US	36.366667000000	-92.466667000000	USD
1708	Rochefort	Rochefort	RCO		France	FR	45.889444000000	-0.982500000000	EUR
1709	Tripoli International Airport	Tripoli	TIP		Libyan Arab Jamahiriya	LY	32.669890000000	13.144279000000	LYD
1710	Bhopal Airport	Bhopal	BHO		India	IN	23.284762000000	77.341764000000	INR
1711	Rick Husband Amarillo International Airport	Amarillo	AMA		United States	US	35.218273000000	-101.705130000000	USD
1712	Balikesir Airport	Balikesir	BZI		Turkey	TR	39.616667000000	27.936111000000	USD
1713	London Paddington Rail Station	London (GB)	QQP		United Kingdom	GB	51.517222000000	-0.177778000000	GBP
1714	Berwick-upon-Tweed Rail Station	Berwick-upon-Tweed Rail Station	XQG		United Kingdom	GB	55.766667000000	-2.000000000000	GBP
1715	Campo Mourao	Campo Mourao	CBW		Brazil	BR	-24.002778000000	-52.355556000000	BRL
1716	Kangding	Kangding	KGT		China	CN	30.055278000000	101.964722000000	RMB
1717	Vidyanagar	Vidyanagar	VDY		India	IN	15.171944000000	76.643611000000	INR
1718	Jeh	Jeh	JEJ		Marshall Islands	MH	7.583333000000	168.916667000000	USD
1719	La Fria	La Fria	LFR		Venezuela	VE	8.239167000000	-72.271111000000	VEB
1720	Hot Springs (US) VA	Hot Springs (US) VA	HSP		USA	US	37.952222000000	-79.833056000000	USD
1721	Ladysmith Rail Station	Ladysmith Rail Station	XEH		Canada	CA	48.995278000000	-123.816667000000	CAD
1722	Brussels Airport	Brussels	BRU		Belgium	BE	50.897170000000	4.483602000000	EUR
1723	London Southend Airport	Southend	SEN		United Kingdom	GB	51.572778000000	0.701389000000	GBP
1724	Jauja	Jauja	JAU		Peru	PE	-11.784167000000	-75.473056000000	PEN
1725	Cataratas Airport	Iguassu Falls	IGU		Brazil	BR	-25.597937000000	-54.488823000000	BRL
1726	Shillavo	Shillavo	HIL		Ethiopia	ET	6.083333000000	44.800000000000	ETB
1727	Kaiserslauter	Kaiserslautern	KLT		Germany	DE	49.450000000000	7.750000000000	EUR
1728	Inverness Rail Station	Inverness Rail Station	ZIV		United Kingdom	GB	57.450000000000	-4.250000000000	GBP
1729	Dourados	Dourados	DOU		Brazil	BR	-22.201389000000	-54.926667000000	BRL
1730	Ishigaki	Ishigaki	ISG		Japan	JP	24.396389000000	124.245000000000	JPY
1731	Rumjatar	Rumjatar	RUM		Nepal	NP	27.302778000000	86.551111000000	NPR
1732	Hao Island	Hao Island	HOI		French Polynesia	PF	-18.074722000000	-140.945833000000	XPF
1733	Wau (PG)	Wau (PG)	WUG		Papua New Guinea	PG	-7.333333000000	146.716667000000	PGK
1734	Duncan	Duncan	DUQ		Canada	CA	48.754722000000	-123.709722000000	CAD
1735	Tenakee	Tenakee	TKE		USA	US	57.778056000000	-135.209444000000	USD
1736	Harrisburg Rail Station	Harrisburg Rail Station	ZUP		USA	US	40.266667000000	-76.866667000000	USD
1737	Valencia Airport	Valencia	VLC		Spain and Canary Islands	ES	39.491792000000	-0.473475000000	EUR
1738	Nsimalen Airport	Yaounde	NSI		Cameroon	CM	3.702222000000	11.550278000000	XAF
1739	Soekarno-Hatta International Airport	Jakarta	CGK		Indonesia	ID	-6.130643000000	106.655526000000	IDR
1740	Chester Airport	Chester	CEG		United Kingdom	GB	53.166668000000	-2.916667000000	GBP
1741	Merrill Field	Anchorage	MRI		United States	US	61.233334000000	-149.900000000000	USD
1742	Bandirma	Bandirma	BDM		Turkey	TR	40.316667000000	27.983333000000	USD
1743	Siglufjordur	Siglufjordur	SIJ		Iceland	IS	66.133333000000	-18.916667000000	ISK
1744	Conceicao do Araguaia	Conceicao do Araguaia	CDJ		Brazil	BR	-8.283333000000	-49.283333000000	BRL
1745	Tokunoshima	Tokunoshima	TKN		Japan	JP	27.836389000000	128.881389000000	JPY
1746	Lubang	Lubang	LBX		Philippines	PH	13.865556000000	120.105000000000	PHP
1747	Kar	Kar	KAK		Papua New Guinea	PG	-6.216667000000	143.483333000000	PGK
1748	Loja	Loja	LOH		Ecuador	EC	-3.995833000000	-79.371667000000	USD
1749	Havre	Havre	HVR		USA	US	48.544167000000	-109.759167000000	USD
1750	New Richmond Rail Station	New Richmond Rail Station	XEM		Canada	CA	48.333333000000	-65.833333000000	CAD
1751	Borongan City Airport	Borongan City	BPR		Philippines	PH	11.674167000000	125.478611000000	PHP
1752	Adak Island	Adak Island	ADK		USA	US	51.881111000000	-176.648333000000	USD
1753	Philadelphia North Philadelphia Apt	Philadelphia	PNE		USA	US	40.083333000000	-75.016667000000	USD
1754	Cartwright	Cartwright	YRF		Canada	CA	53.683333000000	-57.034722000000	CAD
1755	Chita Airport	Chita	HTA		Russian Federation	RU	52.033333000000	113.300000000000	RUB
1756	Niamey Airport	Niamey	NIM		Niger	NE	13.476534000000	2.177158000000	XOF
1757	Adisutjipto Airport	Yogyakarta	JOG		Indonesia	ID	-7.785572000000	110.437060000000	IDR
1758	Waco Regional Airport	Waco	ACT		United States	US	31.609133000000	-97.223210000000	USD
1760	Namur Rail Station	Namur Rail Station	QNM		Belgium	BE	50.466667000000	4.866667000000	EUR
1761	Grantham Rail Station	Grantham Rail Station	XGM		United Kingdom	GB	52.916667000000	-0.650000000000	GBP
1762	Warrington B.q. Rail Station	Warrington B.q. Rail Station	XWN		United Kingdom	GB	53.400000000000	-2.616667000000	GBP
1763	Rondonopolis	Rondonopolis	ROO		Brazil	BR	-16.586944000000	-54.725000000000	BRL
1764	Xining	Xining	XNN		China	CN	36.528611000000	102.040278000000	RMB
1765	Nha Trang Airport	Nha Trang	NHA		Viet Nam	VN	12.227500000000	109.192222000000	VND
1766	Mount Hotham	Mount Hotham	MHU		Australia	AU	-37.047500000000	147.334167000000	AUD
1767	Atar	Atar	ATR		Mauritania	MR	20.500000000000	-13.050000000000	MRO
1768	Los Alamos	Los Alamos	LAM		USA	US	35.880278000000	-106.271111000000	USD
1769	Dease Lake	Dease Lake	YDL		Canada	CA	58.583333000000	-130.033333000000	CAD
1770	Guglielmo Marconi Airport	Bologna	BLQ		Italy	IT	44.529268000000	11.293289000000	EUR
1771	Prestwick Airport	Glasgow	PIK		United Kingdom	GB	55.508432000000	-4.611286000000	GBP
1772	Gen. Wayne A. Downing Peoria International Airport	Peoria	PIA		United States	US	40.666432000000	-89.690117000000	USD
1773	Rota Airport	Rota	ROP		Northern Mariana Islands	MP	14.171568000000	145.244085000000	USD
1774	Aniak Airport	Bethel	ANI		United States	US	61.574398000000	-159.536970000000	USD
1775	Blackbushe	Blackbushe	BBS		United Kingdom	GB	51.323889000000	-0.847500000000	GBP
1776	Madrid Chamartin Rail Station	Madrid	XTI		Spain	ES	40.473889000000	-3.682500000000	EUR
1777	Bournemouth Airport	Bournemouth	BOH		United Kingdom	GB	50.778269000000	-1.832476000000	GBP
1778	Shanghai Hongqiao International Airport	Shanghai	SHA		China	CN	31.196815000000	121.341976000000	RMB
1779	Porto Santo Airport	Porto Santo	PXO		Portugal	PT	33.070023000000	-16.345015000000	EUR
1780	Carrillo	Carrillo	RIK		Costa Rica	CR	9.866667000000	-85.483333000000	CRC
1781	Eday	Eday	EOI		United Kingdom	GB	59.190556000000	-2.772222000000	GBP
1782	Amersfoort Rail Station	Amersfoort Rail Station	QYM		Netherlands	NL	52.150000000000	5.400000000000	EUR
1783	Srendnekolymsk	Srendnekolymsk	SEK		Russian Federation	RU	67.474722000000	153.729444000000	RUB
1784	Fukushima	Fukushima	FKS		Japan	JP	37.227500000000	140.430556000000	JPY
1785	Kandy	Kandy	KDW		Sri Lanka	LK	7.263889000000	80.763611000000	LKR
1786	Castaway	Castaway	CST		Fiji	FJ	-17.619444000000	177.122222000000	FJD
1787	Tadji	Tadji	TAJ		Papua New Guinea	PG	-3.183333000000	142.416667000000	PGK
1788	Lafayette New Iberia Apt	Lafayette	ARA		USA	US	30.042778000000	-91.885278000000	USD
1789	Kitsissuarsuit	Kitsissuarsuit	QJE		Greenland	GL	68.856111000000	-53.125278000000	DKK
1790	Tuktoyaktuk	Tuktoyaktuk	YUB		Canada	CA	69.433333000000	-133.026389000000	CAD
1791	Trabzon Airport	Trabzon	TZX		Turkey	TR	40.994191000000	39.781681000000	USD
1792	Chongqing Airport	Chongqing	CKG		China	CN	29.720341000000	106.634080000000	RMB
1793	Nanchang Airport	Nanchang	KHN		China	CN	28.859901000000	115.907845000000	RMB
1794	Arusha	Arusha	ARK		Tanzania United Republic of	TZ	-3.367222000000	36.625000000000	TZS
1795	Unst	Unst	UNT		United Kingdom	GB	60.750000000000	-0.850000000000	GBP
1796	Crewe Rail Station	Crewe Rail Station	XVC		United Kingdom	GB	53.083333000000	-2.450000000000	GBP
1797	London Brit Rail Terminal	London Brit Rail Terminal	ZLX		United Kingdom	GB	12.944444000000	23.563333000000	GBP
1798	Dubai Chelsea Twr Ey Bus Station	Dubai Chelsea Twr Ey Bus Station	XNB		United Arab Emirates	AE	25.293056000000	55.588056000000	AED
1799	Pemba	Pemba	POL		Mozambique	MZ	-12.986667000000	40.522500000000	MZM
1800	Zakinthos Airport	Zakinthos	ZTH		Greece	GR	37.755833000000	20.888333000000	EUR
1801	Cancun International Airport	Cancun	CUN		Mexico	MX	21.040457000000	-86.874439000000	MXN
1802	Tullamarine Airport	Melbourne	MEL		Australia	AU	-37.669611000000	144.849777000000	AUD
1803	Hierro Airport	Valverde	VDE		Spain and Canary Islands	ES	27.813969000000	-17.884937000000	EUR
1804	Brus Laguna	Brus Laguna	BHG		Honduras	HN	15.833333000000	-84.833333000000	HNL
1805	Best Bus Station	Best Bus Station	QWZ		Netherlands	NL	51.513333000000	5.396111000000	EUR
1806	Kongsvinger Rail Station	Kongsvinger Rail Station	XZD		Norway	NO	60.187500000000	12.001667000000	NOK
1807	Videira	Videira	VIA		Brazil	BR	-27.008333000000	-51.136111000000	BRL
1808	Waco Kungo	Waco Kungo	CEO		Angola	AO	-11.450000000000	15.083333000000	AOA
1809	Simanggang	Simanggang	SGG		Malaysia	MY	65.905833000000	-36.378333000000	MYR
1810	Maupiti Island	Maupiti Island	MAU		French Polynesia	PF	-16.426389000000	-152.243611000000	XPF
1811	St Georges de L'oyapock	St Georges de L'oyapock	OYP		French Guiana	GF	3.900000000000	-51.800000000000	EUR
1812	Paamiut	Paamiut	JFR		Greenland	GL	62.013056000000	-49.668611000000	DKK
1813	Jonquiere Rail Station	Jonquiere Rail Station	XJQ		Canada	CA	48.400000000000	-71.250000000000	CAD
1814	Saravane	Saravane	VNA		Lao People's Democratic Republic	LA	15.700000000000	106.433333000000	LAK
1815	Napuka Island	Napuka Island	NAU		French Polynesia	PF	-14.176944000000	-141.267222000000	XPF
1816	Omboue	Omboue	OMB		Gabon	GA	-1.574722000000	9.262778000000	XAF
1817	Toksook Bay	Toksook Bay	OOK		USA	US	60.541111000000	-165.087500000000	USD
1818	Prince Albert	Prince Albert	YPA		Canada	CA	53.218056000000	-105.673333000000	CAD
1819	Sheremetyevo International Airport	Moscow	SVO		Russian Federation	RU	55.966324000000	37.416574000000	RUB
1820	Lome Airport	Lome	LFW		Togo	TG	6.167103000000	1.250347000000	XOF
1821	Salalah Airport	Salalah	SLL		Oman	OM	17.038125000000	54.106939000000	OMR
1822	Lewiston Nez Perce County Airport	Lewiston	LWS		United States	US	46.374720000000	-117.014440000000	USD
1823	Girona Rail Station	Girona Rail Station	GIA		Spain	ES	41.979167000000	2.816944000000	EUR
1824	Venice Mestre Rail Station	Venice Mestre Rail Station	XVY		Italy	IT	45.482500000000	12.232222000000	EUR
1825	Livramento	Livramento	LVB		Brazil	BR	-3.300000000000	-55.316667000000	BRL
1826	Rishiri	Rishiri	RIS		Japan	JP	45.241944000000	141.186389000000	JPY
1827	Sawu	Sawu	SAU		Indonesia	ID	-10.500000000000	121.900000000000	IDR
1828	Huahine	Huahine	HUH		French Polynesia	PF	-16.687222000000	-151.021667000000	XPF
1829	Elorza	Elorza	EOZ		Venezuela	VE	7.059722000000	-69.496667000000	VEB
1830	Chicago Gary International Apt	Chicago	GYY		USA	US	41.616389000000	-87.412778000000	USD
1831	Montreal Dorval Rail Station	Montreal	XAX		Canada	CA	45.448889000000	-73.741389000000	CAD
1832	Turku Airport	Turku	TKU		Finland	FI	60.512795000000	22.280980000000	EUR
1833	Burlington International Airport	Burlington	BTV		United States	US	44.469014000000	-73.155277000000	USD
1834	Andenes Airport	Andenes	ANX		Norway	NO	69.304920000000	16.133326000000	NOK
1835	Nadym Airport	Nadym	NYM		Russia	RU	65.483330000000	72.716670000000	RUB
1836	Asosa	Asosa	ASO		Ethiopia	ET	10.018611000000	34.586389000000	ETB
1837	York Rail Station	York Rail Station	QQY		United Kingdom	GB	53.966667000000	-1.083333000000	GBP
1838	Gothenburg Central Rail Station	Goteborg	XWL		Sweden	SE	57.708611000000	11.973333000000	SEK
1839	Santa Cruz	Santa Cruz (AR)	RZA		Argentina	AR	-50.017778000000	-68.580278000000	ARS
1840	Yuncheng	Yuncheng	YCU		China	CN	35.116389000000	111.033611000000	RMB
1841	Bintuni	Bintuni	NTI		Indonesia	ID	-2.100000000000	133.516667000000	IDR
1842	Majkin	Majkin	MJE		Marshall Islands	MH	7.833333000000	168.166667000000	USD
1843	Bukavu	Bukavu	BKY		Congo Democratic Republic of	CD	-2.308889000000	28.808889000000	CDF
1844	Kauai Island Lihue Municipal Apt	Kauai Island	LIH		USA	US	21.976389000000	-159.336111000000	USD
1845	Desolation Sound	Desolation Sound	YDS		Canada	CA	50.141667000000	-124.683333000000	CAD
1846	La Coruna Airport	La Coruna	LCG		Spain and Canary Islands	ES	43.302360000000	-8.381923000000	EUR
1847	Glasgow International Airport	Glasgow	GGW		United States	US	48.212778000000	-106.615556000000	USD
1848	Gander Airport	Gander	YQX		Canada	CA	48.946667000000	-54.563330000000	CAD
1849	Corazon de Jesus	Corazon de Jesus	CZJ		Panama	PA	9.444444000000	-78.585278000000	PAB
1850	Bury St Edmunds	Bury St Edmunds	BEQ		United Kingdom	GB	52.350000000000	0.766667000000	GBP
1851	Reading Rail Station	Reading Rail Station	XRE		United Kingdom	GB	51.466667000000	-0.983333000000	GBP
1852	Kuressaare	Kuressaare	URE		Estonia	EE	58.230000000000	22.509444000000	EEK
1853	Krasnoselkup	Krasnoselkup	KKQ		Russian Federation	RU	65.700000000000	82.450000000000	RUB
1854	Mahendranagar	Mahendranagar	XMG		Nepal	NP	28.966667000000	80.150000000000	NPR
1855	Gora	Gora	GOC		Papua New Guinea	PG	-8.416667000000	147.666667000000	PGK
1856	Wagga Wagga	Wagga Wagga	WGA		Australia	AU	-35.165278000000	147.466389000000	AUD
1857	Carson City	Carson City	CSN		USA	US	39.200000000000	-119.733333000000	USD
1858	Sault Ste  Marie County Apt	Sault Ste Marie (US)	SSM		USA	US	46.483333000000	-84.366667000000	USD
1859	Queen Charlotte Is	Queen Charlotte Is	ZQS		Canada	CA	53.000000000000	-132.000000000000	CAD
1860	Belfast City Airport	Belfast	BHD		United Kingdom	GB	54.614520000000	-5.870215000000	GBP
1861	Guadalupe Victoria Airport	Durango	DGO		Mexico	MX	24.125000000000	-104.525000000000	MXN
1862	Bolzano Airport	Bolzano	BZO		Italy	IT	46.462444000000	11.330511000000	EUR
1863	Ralph Wien Memorial Airport	Kotzebue	OTZ		United States	US	66.888054000000	-162.605830000000	USD
1864	Nosy-Be	Nosy-Be	NOS		Madagascar	MG	-13.311944000000	48.314722000000	MGA
1865	Rotterdam Centraal Rail Station	Rotterdam	QRH		Netherlands	NL	51.924167000000	4.470278000000	EUR
1866	Huesca Rail Station	Huesca Rail Station	XUA		Spain	ES	42.133333000000	-0.410000000000	EUR
1867	Stralsund Rail Station	Stralsund Rail Station	ZSX		Germany	DE	54.309167000000	13.078056000000	EUR
1868	Arar	Arar	RAE		Saudi Arabia	SA	30.906667000000	41.138333000000	SAR
1869	Luderitz	Luderitz	LUD		Namibia	NA	-26.687500000000	15.242778000000	NAD
1870	Thanh Hoe	Thanh Hoe	THD		Viet Nam	VN	19.902500000000	105.469167000000	VND
1871	Orange	Orange	OAG		Australia	AU	-33.382222000000	149.131389000000	AUD
1872	Makurdi	Makurdi	MDI		Nigeria	NG	7.716667000000	8.600000000000	NGN
1873	Mekoryuk	Mekoryuk	MYU		USA	US	60.372500000000	-166.271667000000	USD
1874	Lloydminster	Lloydminster	YLL		Canada	CA	53.309167000000	-110.072500000000	CAD
1875	Porto Airport	Porto	OPO		Portugal	PT	41.237774000000	-8.670272000000	EUR
1876	Liverpool John Lennon Airport	Liverpool	LPL		United Kingdom	GB	53.337616000000	-2.854905000000	GBP
1877	Gustavo Diaz Ordaz Airport	Puerto Vallarta	PVR		Mexico	MX	20.678297000000	-105.248979000000	MXN
1878	Aulnat Airport	Clermont-Ferrand	CFE		France	FR	45.780320000000	3.163893000000	EUR
1879	Union Island	Union Island	UNI		St Vincent and the Grenadines	VC	12.616667000000	-61.433333000000	XCD
1880	Benson	Benson	BEX		United Kingdom	GB	51.616667000000	-1.083333000000	GBP
1881	Valladolid Bus Station	Valladolid Bus Station	XJN		Spain	ES	41.641389000000	-4.733333000000	EUR
1882	Cutral	Cutral	CUT		Argentina	AR	-38.966667000000	-69.250000000000	ARS
1883	Lijiang	Lijiang	LJG		China	CN	26.674167000000	100.243611000000	RMB
1884	Bengkulu	Bengkulu	BKS		Indonesia	ID	-3.863611000000	102.339167000000	IDR
1885	Kaukura Atoll	Kaukura Atoll	KKR		French Polynesia	PF	-15.663333000000	-146.884722000000	XPF
1886	Cartago	Cartago	CRC		Colombia	CO	4.758333000000	-75.956389000000	COP
1887	London Heathrow Airport	London	LHR		United Kingdom	GB	51.469603000000	-0.453566000000	GBP
1888	San Luis Potosi Airport	San Luis Potosi	SLP		Mexico	MX	22.255467000000	-100.936804000000	MXN
1889	Dijon Airport	Dijon	DIJ		France	FR	47.270832000000	5.088889000000	EUR
1890	Fort Collins Loveland Municipal Airport	Loveland	FNL		United States	US	40.450500000000	-105.008000000000	USD
1891	London Biggin Hill Apt	London (GB)	BQH		United Kingdom	GB	51.330833000000	0.032222000000	GBP
1892	Forres	Forres	FSS		United Kingdom	GB	57.650000000000	-3.566667000000	GBP
1893	Braintree	Braintree	WXF		United Kingdom	GB	51.966667000000	0.516667000000	GBP
1894	Concordia	Concordia	CCI		Brazil	BR	-27.250000000000	-52.033333000000	BRL
1895	Neryungri	Neryungri	NER		Russian Federation	RU	56.911389000000	124.903056000000	RUB
1896	Dipolog	Dipolog	DPL		Philippines	PH	8.604167000000	123.342500000000	PHP
1897	Lae	Lae	LAE		Papua New Guinea	PG	-6.569722000000	146.726111000000	PGK
1898	San Cristobal Island	San Cristobal Island	SCY		Ecuador	EC	-0.910278000000	-89.617500000000	USD
1899	Chignik Lagoon Apt	Chignik	KCL		USA	US	56.311944000000	-158.531389000000	USD
1900	Pass (generic) Rail Station	Pass (generic) Rail Station	XZP		Canada	CA	46.803333000000	-71.252222000000	CAD
1901	Grenoble-Isere Airport	Grenoble	GNB		France	FR	45.359832000000	5.332019000000	EUR
1902	Dyce Airport	Aberdeen	ABZ		United Kingdom	GB	57.200253000000	-2.204186000000	GBP
1903	Cataratas Airport	Iguazu	IGR		Argentina	AR	-25.731505000000	-54.476347000000	ARS
1904	Blackpool Airport	Blackpool	BLK		United Kingdom	GB	53.778385000000	-3.041985000000	GBP
1905	Cheboksary Airport	Cheboksary	CSY		Russia	RU	56.133330000000	47.266666000000	RUB
1906	Nejjo	Nejjo	NEJ		Ethiopia	ET	9.500000000000	35.466667000000	ETB
1907	Papa Stour	Papa Stour	PSV		United Kingdom	GB	60.321944000000	-1.693333000000	GBP
1908	Suntar	Suntar	SUY		Russian Federation	RU	62.185000000000	117.635000000000	RUB
1909	Xingyi	Xingyi	ACX		China	CN	25.085556000000	104.959444000000	RMB
1910	Dolpa	Dolpa	DOP		Nepal	NP	28.985556000000	82.818889000000	NPR
1911	Uzein Airport	Pau	PUF		France	FR	43.382348000000	-0.413573000000	EUR
1912	Glasgow International Airport	Glasgow	GLA		United Kingdom	GB	55.864213000000	-4.431782000000	GBP
1913	Campo Grande Internacional Airport	Campo Grande	CGR		Brazil	BR	-20.456992000000	-54.668872000000	BRL
1914	Saipan International Airport	Saipan	SPN		Northern Mariana Islands	MP	15.122178000000	145.723257000000	USD
1915	Port Elizabeth (XH)	Port Elizabeth (XH)	BQU		St Vincent and the Grenadines	VC	12.983333000000	-61.250000000000	XCD
1916	Bembridge	Bembridge	BBP		United Kingdom	GB	50.678056000000	-1.109167000000	GBP
1917	Zemio Airport	Zemio	IMO		Central African Republic	CF	5.033333000000	25.083332000000	XAF
1918	Owen Roberts International Airport	Grand Cayman Island	GCM		Cayman Islands	KY	19.296369000000	-81.357786000000	KYD
1919	Mohammad Bin Abdulaziz Airport	Madinah	MED		Saudi Arabia	SA	24.544369000000	39.698966000000	SAR
1920	Van Airport	Van	VAN		Turkey	TR	38.458610000000	43.332222000000	USD
1921	Morondava	Morondava	MOQ		Madagascar	MG	-20.284722000000	44.317500000000	MGA
1922	Ramsgate Rail Station	Ramsgate Rail Station	QQR		United Kingdom	GB	51.333333000000	1.416667000000	GBP
1923	Oktiabrskij	Oktiabrskij	OKT		Russian Federation	RU	54.433333000000	53.383333000000	RUB
1924	Ghadames	Ghadames	LTD		Libya	LY	30.151667000000	9.715278000000	LYD
1925	Bhuj	Bhuj	BHJ		India	IN	23.287778000000	69.670278000000	INR
1926	Cobar	Cobar	CAZ		Australia	AU	-31.537500000000	145.794444000000	AUD
1927	Simbai	Simbai	SIM		Papua New Guinea	PG	-5.266667000000	144.533333000000	PGK
1928	Alliance	Alliance	AIA		USA	US	42.051944000000	-102.807778000000	USD
1929	Prescott	Prescott	PRC		USA	US	34.654444000000	-112.419722000000	USD
1930	Stony Rapids	Stony Rapids	YSF		Canada	CA	59.250000000000	-105.833333000000	CAD
1931	Rostov Airport	Rostov	ROV		Russian Federation	RU	47.250000000000	39.750000000000	RUB
1932	San Antonio International Airport	San Antonio	SAT		United States	US	29.524937000000	-98.472643000000	USD
1933	Mount Pleasant Municipal Airport	Mount Pleasant	MOP		United States	US	43.616670000000	-84.733330000000	USD
1934	Qurghonteppa	Qurghonteppa	KQT		Tajikistan	TJ	37.867222000000	68.864722000000	TJS
1935	Milton Keynes	Milton Keynes	KYN		United Kingdom	GB	52.033333000000	-0.700000000000	GBP
1936	Salisbury Rail Station	Salisbury Rail Station	XSR		United Kingdom	GB	51.083333000000	-1.800000000000	GBP
1937	Mariupol	Mariupol	MPW		Ukraine	UA	47.076111000000	37.449444000000	UAH
1938	Chokurdakh	Chokurdakh	CKH		Russian Federation	RU	70.624444000000	147.896667000000	RUB
1939	Lilabari	Lilabari	IXI		India	IN	27.266667000000	94.100000000000	INR
1940	Sibiu Airport	Sibiu	SBZ		Romania	RO	45.789757000000	24.093529000000	ROL
1941	Roberts International Airport	Monrovia	ROB		Liberia	LR	6.239722000000	-10.358889000000	LRD
1942	Futuna Island Airport	Futuna Island	FUT		Wallis and Futuna Islands	WF	-14.250000000000	-178.150000000000	XPF
1943	San Salvador (BS)	San Salvador (BS)	ZSA		Bahamas	BS	24.063333000000	-74.523889000000	BSD
1944	Lausanne Rail Station	Lausanne Rail Station	QLS		Switzerland	CH	46.517222000000	6.629167000000	CHF
1945	Arboga Rail Station	Arboga Rail Station	XXT		Sweden	SE	59.397222000000	15.841111000000	SEK
1946	Sao Felix do Xingu	Sao Felix do Xingu	SXX		Brazil	BR	-6.634444000000	-51.984444000000	BRL
1947	Zhaotong	Zhaotong	ZAT		China	CN	27.325833000000	103.754722000000	RMB
1948	Tanjung Pandan	Tanjung Pandan	TJQ		Indonesia	ID	-2.745833000000	107.755000000000	IDR
1949	Mildura	Mildura	MQL		Australia	AU	-34.229167000000	142.085556000000	AUD
1950	Harper	Harper	CPA		Liberia	LR	4.383333000000	-7.700000000000	LRD
1951	Ely (US) MN	Ely (US) MN	LYU		USA	US	47.900000000000	-91.850000000000	USD
1952	Fort Good Hope	Fort Good Hope	YGH		Canada	CA	66.240833000000	-128.650833000000	CAD
1953	Dysart	Dysart	DYA		Australia	AU	-22.616667000000	148.366667000000	AUD
1954	Takaroa	Takaroa	TKX		French Polynesia	PF	-14.455833000000	-145.024444000000	XPF
1955	Bishop	Bishop	BIH		USA	US	37.366667000000	-118.350000000000	USD
1956	Rifle	Rifle	RIL		USA	US	39.524722000000	-107.725278000000	USD
1957	Sioux Lookout	Sioux Lookout	YXL		Canada	CA	50.113889000000	-91.905278000000	CAD
1958	Reus Airport	Reus	REU		Spain and Canary Islands	ES	41.146102000000	1.153319000000	EUR
1959	Hewanorra Airport	Saint Lucia	UVF		Saint Lucia	LC	13.735556000000	-60.952222000000	XCD
1960	Yerevan Airport	Yerevan	EVN		Armenia	AM	40.152720000000	44.398050000000	AMD
1961	St Jacques Airport	Rennes	RNS		France	FR	48.068066000000	-1.726249000000	EUR
1962	St Croix SPB	St Croix Island	SSB		Virgin Islands, US	VI	17.747778000000	-64.705556000000	USD
1963	Enontekio	Enontekio	ENF		Finland	FI	68.362500000000	23.424444000000	EUR
1964	Usak	Usak	USQ		Turkey	TR	38.681389000000	29.471667000000	USD
1965	Santana do Araguaia	Santana do Araguaia	CMP		Brazil	BR	-9.333333000000	-50.333333000000	BRL
1966	Kushiro	Kushiro	KUH		Japan	JP	43.040833000000	144.193056000000	JPY
1967	Ambon	Ambon	AMQ		Indonesia	ID	-3.710278000000	128.089167000000	IDR
1968	Gunnedah	Gunnedah	GUH		Australia	AU	-30.950000000000	150.233333000000	AUD
1969	Yacuiba	Yacuiba	BYC		Bolivia	BO	-21.961111000000	-63.651944000000	BOB
1970	Atlanta Fulton County Apt	Atlanta	FTY		USA	US	33.778333000000	-84.526944000000	USD
1971	Frenchville	Frenchville	WFK		USA	US	47.350000000000	-68.383333000000	USD
1972	Butmir Airport	Sarajevo	SJJ		Bosnia and Herzegovina	BA	43.826687000000	18.336065000000	BAM
1973	Newcastle Airport	Newcastle	NCL		United Kingdom	GB	55.037062000000	-1.710629000000	GBP
1974	Palmares Airport	Maceio	MCZ		Brazil	BR	-9.512521000000	-35.800444000000	BRL
1975	Dundee Airport	Dundee	DND		United Kingdom	GB	56.454090000000	-3.014531000000	GBP
1976	Kent International Airport	Manston	MSE		United Kingdom	GB	51.350000000000	1.350000000000	GBP
1977	Dominica Cane Field	Dominica	DCF		Dominica	DM	15.336667000000	-61.392222000000	XCD
1978	Kahramanmaras	Kahramanmaras	KCM		Turkey	TR	37.538889000000	36.953333000000	USD
1979	Vegarshei Rail Station	Vegarshei Rail Station	ZYV		Norway	NO	58.759722000000	8.853056000000	NOK
1980	Sir Bani Yas Island	Sir Bani Yas Island	XSB		United Arab Emirates	AE	24.282778000000	52.581667000000	AED
1981	Pretoria Wonderboom Apt	Pretoria	PRY		South Africa	ZA	-25.650000000000	28.216667000000	ZAR
1982	Con Dao	Con Dao	VCS		Viet Nam	VN	8.732222000000	106.632500000000	VND
1983	Pago Pago	Pago Pago	PPG		American Samoa	AS	-14.333611000000	-170.712500000000	USD
1984	Nzerekore	Nzerekore	NZE		Guinea	GN	7.816667000000	-8.700000000000	GNF
1985	Old Harbor	Old Harbor	OLH		USA	US	57.205000000000	-153.299167000000	USD
1986	Oxford House	Oxford House	YOH		Canada	CA	54.933333000000	-95.268611000000	CAD
1987	Chisinau Airport	Chisinau	KIV		Republic of Moldova	MD	46.935442000000	28.934967000000	MDL
1988	Juist	Juist	JUI		Germany	DE	53.683333000000	7.066667000000	EUR
1989	Truk Airport	Truk, Caroline Islands	TKK		Micronesia	FM	7.457446000000	151.842005000000	USD
1990	Salgado Filho Airport	Porto Alegre	POA		Brazil	BR	-29.989611000000	-51.177088000000	BRL
1991	Mildenhall Airport	Mildenhall	MHZ		United Kingdom	GB	52.366670000000	0.483333000000	GBP
1992	Hilton Head Airport	Hilton Head Island	HHH		United States	US	32.226700000000	-80.698900000000	USD
1993	Mus	Mus	MSR		Turkey	TR	38.747778000000	41.661111000000	USD
1994	Ciudad Real Rail Station	Ciudad Real Rail Station	XJI		Spain	ES	38.985000000000	-3.913333000000	EUR
1995	Joinville	Joinville	JOI		Brazil	BR	-26.224444000000	-48.797500000000	BRL
1996	Okhotsk	Okhotsk	OHO		Russian Federation	RU	59.410556000000	143.056389000000	RUB
1997	Luwuk	Luwuk	LUW		Indonesia	ID	-1.038056000000	122.772778000000	IDR
1998	Lonorore	Lonorore	LNE		Vanuatu	VU	-15.864167000000	168.171111000000	VUV
1999	San Antonio	San Antonio (VE)	SVZ		Venezuela	VE	7.840833000000	-72.439722000000	VEB
2000	Levelock	Levelock	KLL		USA	US	59.126111000000	-156.860833000000	USD
2001	Baie Comeau	Baie Comeau	YBC		Canada	CA	49.132500000000	-68.204444000000	CAD
2002	Exeter St Thomas Railway Station	Exeter	EXS		United Kingdom	GB	50.717130000000	-3.538580000000	GBP
2003	Bristol Temple Meads Railway Station	Bristol	TPB		United Kingdom	GB	51.449000000000	-2.580000000000	GBP
2004	Aeroport Lleida-Alguaire	Alguaire	ILD		Spain and Canary Islands	ES	41.728836000000	0.543302000000	EUR
2005	OR Tambo International Airport	Johannesburg	JNB		South Africa	ZA	-26.132664000000	28.231313000000	ZAR
2006	Da Nang Airport	Da Nang	DAD		Viet Nam	VN	16.055398000000	108.202980000000	VND
2007	Rhinelander Oneida County Airport	Rhinelander	RHI		United States	US	45.625706000000	-89.462530000000	USD
2008	Ranohira	Ranohira	RLR		Madagascar	MG	-22.645278000000	45.323611000000	MGA
2009	Portsmouth	Portsmouth	PME		United Kingdom	GB	50.833333000000	-1.050000000000	GBP
2010	Kristiansand Rail Station	Kristiansand	XKR		Norway	NO	58.138611000000	7.996667000000	NOK
2011	Formosa	Formosa	FMA		Argentina	AR	-26.212778000000	-58.228056000000	ARS
2012	Memambetsu	Memambetsu	MMB		Japan	JP	43.880556000000	144.164167000000	JPY
2013	Cotabato	Cotabato	CBO		Philippines	PH	7.165278000000	124.209722000000	PHP
2014	Ine Island	Ine Island	IMI		Marshall Islands	MH	6.983333000000	171.616667000000	USD
2015	Scenic Flight	Scenic Flight	XXF		New Zealand	NZ	-36.869444000000	174.769444000000	NZD
2016	El Dorado	El Dorado	ELD		USA	US	33.221111000000	-92.813333000000	USD
2017	Thief River Falls	Thief River Falls	TVF		USA	US	48.066667000000	-96.183333000000	USD
2018	Richmond Rail Station	Richmond Rail Station	ZZL		USA	US	36.550000000000	3.200000000000	USD
2019	Enfidha - Hammamet International Airport	Enfidha	NBE		Tunisia	TN	36.075833000000	10.438611000000	TND
2020	Francisco Bangoy Intl Airport	Davao	DVO		Philippines	PH	7.130696000000	125.644698000000	PHP
2021	Eagle County Regional Airport	Gypsum	EGE		United States	US	39.639880000000	-106.913470000000	USD
2022	Nairobi Wilson Apt	Nairobi	WIL		Kenya	KE	-1.321667000000	36.814722000000	KES
2023	Unst	Unst	UNT		United Kingdom	GB	60.750000000000	-0.850000000000	GBP
2024	Barcelona Franca Rail Stn	Barcelona Franca Rail Stn	YJD		Spain	ES	41.384167000000	2.186111000000	EUR
2025	Prague Florenc Bus Station	Prague Florenc Bus Station	PFL		Czech Republic	CZ	50.089167000000	14.440556000000	CZK
2026	Dongsheng	Dongsheng	DSN		China	CN	39.829444000000	109.975833000000	RMB
2027	Jabalpur	Jabalpur	JLR		India	IN	23.177778000000	80.051944000000	INR
2028	Airport De Gran Canaria	Las Palmas	LPA		Spain and Canary Islands	ES	27.938944000000	-15.389351000000	EUR
2029	Myrtle Beach International Airport	Myrtle Beach	MYR		United States	US	33.682676000000	-78.922944000000	USD
2030	Benbecula Airport	Benbecula	BEB		United Kingdom	GB	57.473415000000	-7.376028000000	GBP
2031	Bacau Airport	Bacau	BCM		Romania	RO	46.598610000000	26.881945000000	ROL
2032	Nachingwea	Nachingwea	NCH		Tanzania United Republic of	TZ	-10.366667000000	38.800000000000	TZS
2033	Anglesey	Anglesey	VLY		United Kingdom	GB	53.248333000000	-4.535278000000	GBP
2034	Nationaltheatret Rail Station	Nationaltheatret Rail Station	ZZN		Norway	NO	59.914722000000	10.755833000000	NOK
2035	Tindouf	Tindouf	TIN		Algeria	DZ	27.700278000000	-8.167222000000	DZD
2036	Cox's Bazar	Cox's Bazar	CXB		Bangladesh	BD	21.452222000000	91.963889000000	BDT
2037	Tamky	Tamky	VCL		Viet Nam	VN	15.407500000000	108.707222000000	VND
2038	Menyamya	Menyamya	MYX		Papua New Guinea	PG	-7.200000000000	146.016667000000	PGK
2039	Garoua	Garoua	GOU		Cameroon	CM	9.335833000000	13.370000000000	XAF
2040	Omaha Millard Apt	Omaha	MIQ		USA	US	41.302778000000	-95.902778000000	USD
2041	Ulukhaktok	Ulukhaktok	YHI		Canada	CA	70.762778000000	-117.806111000000	CAD
2042	Coonamble	Coonamble	CNB		Australia	AU	-30.983333000000	148.383333000000	AUD
2043	Silur	Silur	SWR		Papua New Guinea	PG	-4.533333000000	153.050000000000	PGK
2044	Candle	Candle	CDL		USA	US	65.900000000000	-161.916667000000	USD
2045	Springfield (US) MO	Springfield (US) MO	SGF		USA	US	37.245556000000	-93.388611000000	USD
2046	Baltimore Rail Station	Baltimore	ZBP		USA	US	39.307500000000	-76.615833000000	USD
2047	Yap Airport	Yap, Caroline Islands	YAP		Micronesia	FM	9.497715000000	138.086730000000	USD
2048	Alice International Airport	Alice	ALI		United States	US	27.750000000000	-98.066667000000	USD
2049	I. Kapodistrias Airport	Kerkyra	CFU		Greece	GR	39.607840000000	19.914644000000	EUR
2050	Ekibastuz	Ekibastuz	EKB		Kazakhstan	KZ	51.583333000000	75.216667000000	KZT
2051	Kastoria	Kastoria	KSO		Greece	GR	40.446389000000	21.282222000000	EUR
2052	Granada Rail Stn	Granada Rail Stn	YJG		Spain	ES	37.184167000000	-3.609167000000	EUR
2053	Vitoria Da Conquista	Vitoria Da Conquista	VDC		Brazil	BR	-14.862778000000	-40.863056000000	BRL
2054	Cabinda	Cabinda	CAB		Angola	AO	-5.583333000000	12.200000000000	AOA
2055	Arutua	Arutua	AXR		French Polynesia	PF	-15.248333000000	-146.616667000000	XPF
2056	Maryborough	Maryborough	MBH		Australia	AU	-25.513333000000	152.715000000000	AUD
2057	Mocoa	Mocoa	VGZ		Colombia	CO	0.982222000000	-76.604167000000	COP
2058	St Marys	St Marys	KSM		USA	US	62.060556000000	-163.300833000000	USD
2059	Olekminsk	Olekminsk	OLZ		Russian Federation	RU	60.400833000000	120.470833000000	RUB
2060	Ibaraki	Ibaraki	IBR		Japan	JP	36.178333000000	140.418056000000	JPY
2061	Rawala Kot	Rawala Kot	RAZ		Pakistan	PK	33.866667000000	73.766667000000	PKR
2062	Embessa	Embessa	EMS		Papua New Guinea	PG	-9.450000000000	148.766667000000	PGK
2063	Tubuai	Tubuai	TUB		French Polynesia	PF	-23.365278000000	-149.524167000000	XPF
2064	Wainwright	Wainwright	AIN		USA	US	70.613611000000	-159.866944000000	USD
2065	Port Alsworth	Port Alsworth	PTA		USA	US	60.202500000000	-154.323333000000	USD
2066	Smith Falls	Smith Falls	YSH		Canada	CA	44.946389000000	-75.939722000000	CAD
2067	Mahon Airport	Menorca	MAH		Spain and Canary Islands	ES	39.864745000000	4.226256000000	EUR
2068	Luis Munoz Marin International Airport	San Juan	SJU		Puerto Rico	PR	18.437403000000	-66.004683000000	USD
2069	Can Tho Airport	Can Tho	VCA		Viet Nam	VN	10.047222000000	105.766389000000	VND
2070	Noorvik	Noorvik	ORV		USA	US	66.816944000000	-161.029167000000	USD
2071	Eskisehir Anadolu	Eskisehir Anadolu	AOE		Turkey	TR	39.801944000000	30.525000000000	USD
2072	Preston Rail Station	Preston Rail Station	XPT		United Kingdom	GB	53.766667000000	-2.700000000000	GBP
2073	Swindon Rail Station	Swindon Rail Station	XWS		United Kingdom	GB	53.566667000000	-1.783333000000	GBP
2074	Rio Verde	Rio Verde	RVD		Brazil	BR	-17.833333000000	-50.955556000000	BRL
2075	Kariba	Kariba	KAB		Zimbabwe	ZW	-16.519722000000	28.885000000000	ZWD
2076	Anaa	Anaa	AAA		French Polynesia	PF	-17.352500000000	-145.510000000000	XPF
2077	Narrandera	Narrandera	NRA		Australia	AU	-34.702222000000	146.512222000000	AUD
2078	Koulamoutou	Koulamoutou	KOU		Gabon	GA	-1.184722000000	12.441389000000	XAF
2079	Metlakatla	Metlakatla	MTM		USA	US	55.133333000000	-131.583333000000	USD
2080	Yankton	Yankton	YKN		USA	US	42.916667000000	-97.383333000000	USD
2081	La Coruna Airport	La Coruna	LCG		Spain and Canary Islands	ES	43.302360000000	-8.381923000000	EUR
2082	Tulsa International Airport	Tulsa	TUL		United States	US	36.189809000000	-95.890102000000	USD
2083	Oskarshamn Airport	Oskarshamn	OSK		Sweden	SE	57.266666000000	16.433332000000	SEK
2084	Big Creek	Big Creek	BGK		Belize	BZ	16.516667000000	-88.416667000000	BZD
2085	Oban	Oban	OBN		United Kingdom	GB	56.466667000000	-5.400000000000	GBP
2086	Neslandsvatn Rail Station	Neslandsvatn Rail Station	XUM		Norway	NO	58.971111000000	9.155833000000	NOK
2087	Parana	Parana	PRA		Argentina	AR	-31.793611000000	-60.481111000000	ARS
2088	Panzhihua	Panzhihua	PZI		China	CN	26.540000000000	101.798056000000	RMB
2089	Merauke	Merauke	MKQ		Indonesia	ID	-8.520278000000	140.418333000000	IDR
2090	Lawn Hill	Lawn Hill	LWH		Australia	AU	-18.633333000000	138.633333000000	AUD
2091	Tucupita	Tucupita	TUV		Venezuela	VE	9.091667000000	-62.050000000000	VEB
2092	Parks	Parks	KPK		USA	US	57.416667000000	-155.900000000000	USD
2093	Toronto Downtown Rail Station	Toronto	YBZ		Canada	CA	43.645278000000	-79.380833000000	CAD
2094	Lappeenranta Airport	Lappeenranta	LPP		Finland	FI	61.046111000000	28.156667000000	EUR
2095	Los Angeles International Airport	Los Angeles	LAX		United States	US	33.943399000000	-118.408279000000	USD
2096	Valan Airport	Honningsvag	HVG		Norway	NO	70.983330000000	25.833332000000	NOK
2097	Mayaguez	Mayaguez	MAZ		Puerto Rico	PR	18.255833000000	-67.148611000000	USD
2098	Carlisle	Carlisle	CAX		United Kingdom	GB	54.937500000000	-2.809167000000	GBP
2099	London St Pancras Intl Rail Station	London (GB)	QQS		United Kingdom	GB	51.531667000000	-0.126389000000	GBP
2100	Glasgow Central Rail Station	Glasgow (GB)	ZGG		United Kingdom	GB	55.850000000000	-4.250000000000	GBP
2101	Szczecin Bus Station	Szczecin Bus Station	ZFX		Poland	PL	53.433333000000	14.566667000000	PLN
2102	Igarka	Igarka	IAA		Russian Federation	RU	67.433333000000	86.633333000000	RUB
2103	Rajkot	Rajkot	RAJ		India	IN	22.309167000000	70.779444000000	INR
2104	Zurich Airport	Zurich	ZRH		Switzerland	CH	47.450604000000	8.561746000000	CHF
2105	Tocumen International Airport	Panama City	PTY		Panama	PA	9.066897000000	-79.387639000000	PAB
2106	Ben Gurion International Airport	Tel Aviv-Yafo	TLV		Israel	IL	32.000454000000	34.870741000000	ILS
2107	Sumburgh Airport	Shetland Islands	LSI		United Kingdom	GB	59.877888000000	-1.287111000000	GBP
2108	Zhambyl	Zhambyl	DMB		Kazakhstan	KZ	42.853611000000	71.303611000000	KZT
2109	Brighton	Brighton	BSH		United Kingdom	GB	50.833333000000	-0.133333000000	GBP
2110	Lugo Rail Station	Lugo Rail Station	LUY		Spain	ES	43.015000000000	-7.551944000000	EUR
2111	Albacete Bus Station	Albacete Bus Station	XJJ		Spain	ES	38.997778000000	-1.846389000000	EUR
2112	Ji-Parana	Ji-Parana	JPR		Brazil	BR	-10.870833000000	-61.846944000000	BRL
2113	Oshima	Oshima	OIM		Japan	JP	34.781944000000	139.360278000000	JPY
2114	Mae Hong Son	Mae Hong Son	HGN		Thailand	TH	19.301667000000	97.975000000000	THB
2115	Mount Hagen	Mount Hagen	HGU		Papua New Guinea	PG	-5.826667000000	144.295833000000	PGK
2116	Chiclayo	Chiclayo	CIX		Peru	PE	-6.787500000000	-79.828056000000	PEN
2117	Goodland	Goodland	GLD		USA	US	39.366667000000	-101.700000000000	USD
2118	Wunnummin Lake	Wunnummin Lake	WNN		Canada	CA	52.894722000000	-89.290833000000	CAD
2119	Paris Gare du Nord Rail Station	Paris	XPG		France	FR	48.880833000000	2.355278000000	EUR
2120	Masterton	Masterton	MRO		New Zealand	NZ	-40.975000000000	175.632778000000	NZD
2121	Dili (CD)	Dili (CD)	DIC		Congo Democratic Republic of	CD	3.416667000000	26.750000000000	CDF
2122	Manistee	Manistee	MBL		USA	US	44.266667000000	-86.250000000000	USD
2123	Greenway Sound	Greenway Sound	YGN		Canada	CA	50.850000000000	-126.850000000000	CAD
2124	Fontanarossa Airport	Catania	CTA		Italy	IT	37.470663000000	15.065877000000	EUR
2125	Jijel Airport	Jijel	GJL		Algeria	DZ	36.800000000000	5.883333000000	DZD
2126	Sung Shan Airport	Taipei	TSA		Republic of China Taiwan	TW	25.062789000000	121.551924000000	TWD
2127	Monroe Regional Airport	Monroe	MLU		United States	US	32.511840000000	-92.043655000000	USD
2128	Farnborough	Farnborough	FAB		United Kingdom	GB	51.275833000000	-0.776389000000	GBP
2129	Vicenza	Vicenza	VIC		Italy	IT	45.571667000000	11.526944000000	EUR
2130	Costa Marques	Costa Marques	CQS		Brazil	BR	-12.416667000000	-64.333333000000	BRL
2131	Brownwood	Brownwood	BWD		USA	US	31.800000000000	-98.950000000000	USD
2132	San Bernardino International Apt	San Bernardino	SBD		USA	US	34.100000000000	-117.283333000000	USD
2133	Mont Joli	Mont Joli	YYY		Canada	CA	48.608611000000	-68.208056000000	CAD
2134	Kayseri Airport	Kayseri	ASR		Turkey	TR	38.774200000000	35.490706000000	USD
2135	Las Cruces Municipal Airport	Las Cruces	LRU		United States	US	32.290833000000	-106.921667000000	USD
2136	Framnes Airport	Narvik	NVK		Norway	NO	68.425000000000	17.425000000000	NOK
2137	Navoi	Navoi	NVI		Uzbekistan	UZ	40.116389000000	65.165833000000	UZS
2138	Doncaster	Doncaster	DCS		United Kingdom	GB	53.466667000000	-1.000000000000	GBP
2139	Rugby Rail Station	Rugby Rail Station	XRU		United Kingdom	GB	52.383333000000	-1.250000000000	GBP
2140	Vologda	Vologda	VGD		Russian Federation	RU	59.283333000000	39.950000000000	RUB
2141	Huaihua	Huaihua	HJJ		China	CN	27.441389000000	109.700278000000	RMB
2142	Nanded	Nanded	NDC		India	IN	19.181944000000	77.322778000000	INR
2143	Denham	Denham	DNM		Australia	AU	-25.916667000000	113.533333000000	AUD
2144	Tari	Tari	TIZ		Papua New Guinea	PG	-5.845000000000	142.947500000000	PGK
2145	Scottsbluff	Scottsbluff	BFF		USA	US	41.874167000000	-103.595556000000	USD
2146	Cinder River	Cinder River	RCP		USA	US	57.083056000000	-157.805556000000	USD
2147	Whistler	Whistler	YWS		Canada	CA	50.150000000000	-122.966667000000	CAD
2148	Amata Kabua International Airport	Majuro	MAJ		Marshall Islands	MH	7.068717000000	171.282508000000	USD
2149	Hazrat Shahjalal International Airport	Dhaka	DAC		Bangladesh	BD	23.848649000000	90.405874000000	BDT
2150	Midland International Airport	Midland	MAF		United States	US	31.937145000000	-102.208170000000	USD
2151	Tulear	Tulear	TLE		Madagascar	MG	-23.383333000000	43.728333000000	MGA
2152	Filton	Filton	FZO		United Kingdom	GB	51.519444000000	-2.590278000000	GBP
2153	Sheffield	Sheffield	SZD		United Kingdom	GB	53.394167000000	-1.388333000000	GBP
2154	Pecs Bus Station	Pecs Bus Station	QPJ		Hungary	HU	46.083333000000	18.233333000000	HUF
2155	Jiayuguan	Jiayuguan	JGN		China	CN	39.857222000000	98.341389000000	RMB
2156	Simla	Simla	SLV		India	IN	31.081667000000	77.068056000000	INR
2157	Cicia	Cicia	ICI		Fiji	FJ	-17.743333000000	-179.342222000000	FJD
2158	Florencia	Florencia	FLA		Colombia	CO	1.589167000000	-75.564444000000	COP
2159	Hudson	Hudson	HCC		USA	US	42.294444000000	-73.711111000000	USD
2160	Chambord Rail Station	Chambord Rail Station	XCI		Canada	CA	48.433333000000	-72.066667000000	CAD
2161	Vannes	Vannes	VNE		France	FR	47.719167000000	-2.723333000000	EUR
2162	Stansted Airport	London	STN		United Kingdom	GB	51.889267000000	0.262703000000	GBP
2163	Portland International Airport	Portland	PDX		United States	US	45.588995000000	-122.592901000000	USD
2164	Stokka Airport	Sandnessjoen	SSJ		Norway	NO	65.959946000000	12.476518000000	NOK
2165	San Cristobal de Las Casas	San Cristobal de Las Casas	SZT		Mexico	MX	16.690556000000	-92.544167000000	MXN
2166	Lleida Rail Station	Lleida Rail Station	QLQ		Spain	ES	41.620833000000	0.633056000000	EUR
2167	Lankaran	Lankaran	LLK		Azerbaijan	AZ	38.758889000000	48.806389000000	AZM
2168	Ghardaia	Ghardaia	GHA		Algeria	DZ	32.384167000000	3.794167000000	DZD
2169	Mzuzu	Mzuzu	ZZU		Malawi	MW	-11.444722000000	34.011667000000	MWK
2170	Bourke	Bourke	BRK		Australia	AU	-30.050000000000	145.950000000000	AUD
2171	Tatakoto	Tatakoto	TKV		French Polynesia	PF	-17.355556000000	-138.448611000000	XPF
2172	Zinder	Zinder	ZND		Niger	NE	13.778889000000	8.983611000000	XOF
2173	Palmer	Palmer	PMX		USA	US	42.150000000000	-72.316667000000	USD
2174	Refuge Cove	Refuge Cove	YRC		Canada	CA	50.123889000000	-124.839444000000	CAD
2175	St Austell Railway Station	St Austell	USX		United Kingdom	GB	50.339700000000	-4.790280000000	GBP
2176	Tucson International Airport	Tucson	TUS		United States	US	32.120688000000	-110.937369000000	USD
2177	Hovden Airport	Orsta-Volda	HOV		Norway	NO	62.179787000000	6.078802000000	NOK
2178	Urgench	Urgench	UGC		Uzbekistan	UZ	41.584167000000	60.641667000000	UZS
2179	Ourense Rail Station	Ourense Rail Station	OUQ		Spain	ES	42.350556000000	-7.873056000000	EUR
2180	Halle Rail Station	Halle Rail Station	ZHZ		Germany	DE	51.477222000000	11.987778000000	EUR
2181	Socotra	Socotra	SCT		Yemen	YE	12.630556000000	53.905833000000	YER
2182	Nacala	Nacala	MNC		Mozambique	MZ	-14.485833000000	40.712500000000	MZM
2183	Ama	Ama	AMF		Papua New Guinea	PG	-4.166667000000	141.666667000000	PGK
2184	Ononge	Ononge	ONB		Papua New Guinea	PG	-8.583333000000	147.200000000000	PGK
2185	Mekambo	Mekambo	MKB		Gabon	GA	0.966667000000	13.950000000000	XAF
2186	Niaqornat	Niaqornat	NIQ		Greenland	GL	70.789444000000	-53.663056000000	DKK
2187	Mary's Harbour	Mary's Harbour	YMH		Canada	CA	52.300556000000	-55.835833000000	CAD
2188	Pulkovo Airport	Saint Petersburg	LED		Russian Federation	RU	59.806085000000	30.308300000000	RUB
2189	San Diego International Airport	San Diego	SAN		United States	US	32.731938000000	-117.197312000000	USD
2190	Graciosa Island Airport	Graciosa Island (Azores)	GRW		Portugal	PT	39.090954000000	-28.027958000000	EUR
2191	Mason City Municipal Airport	Clear Lake	MCW		United States	US	43.153000000000	-93.336100000000	USD
2192	Ghent	Ghent	GNE		Belgium	BE	51.050000000000	3.716667000000	EUR
2193	Puertollano Rail Station	Puertollano Rail Station	UER		Spain	ES	38.691389000000	-4.111944000000	EUR
2194	Malaga Rail Station	Malaga Rail Station	YJM		Spain	ES	36.711389000000	-4.432778000000	EUR
2195	Valdivia	Valdivia	ZAL		Chile	CL	-39.649444000000	-73.086389000000	CLP
2196	George	George	GRJ		South Africa	ZA	-34.005556000000	22.378889000000	ZAR
2197	Sorong	Sorong	SOQ		Indonesia	ID	-0.926389000000	131.121111000000	IDR
2198	Niau	Niau	NIU		French Polynesia	PF	-16.120833000000	-146.373611000000	XPF
2199	Akieni	Akieni	AKE		Gabon	GA	-1.172222000000	13.916667000000	XAF
2200	Kasaan	Kasaan	KXA		USA	US	55.536111000000	-132.401389000000	USD
2201	Fairmount Springs	Fairmount Springs	YCZ		Canada	CA	50.331944000000	-115.873611000000	CAD
2202	Frankfurt am Main Airport	Frankfurt	FRA		Germany	DE	50.050737000000	8.570773000000	EUR
2203	Clermont Airport	Clermont	CMQ		Australia	AU	-22.866667000000	147.500000000000	AUD
2204	South Andros	South Andros	TZN		Bahamas	BS	24.233333000000	-77.583333000000	BSD
2205	Bury St Edmunds	Bury St Edmunds	BEQ		United Kingdom	GB	52.350000000000	0.766667000000	GBP
2206	Reading Rail Station	Reading Rail Station	XRE		United Kingdom	GB	51.466667000000	-0.983333000000	GBP
2207	Kerch	Kerch	KHC		Ukraine	UA	45.366667000000	36.450000000000	UAH
2208	Huai'an	Huai'an	HIA		China	CN	33.787500000000	119.127778000000	RMB
2209	Mysore	Mysore	MYQ		India	IN	12.231667000000	76.657222000000	INR
2210	Dunk Island	Dunk Island	DKI		Australia	AU	-17.939167000000	146.141389000000	AUD
2211	Tikehau Atoll	Tikehau Atoll	TIH		French Polynesia	PF	-15.119722000000	-148.230833000000	XPF
2212	Bedford/Hanscom	Bedford/Hanscom	BED		USA	US	42.470000000000	-71.289167000000	USD
2213	Fort Jefferson	Fort Jefferson	RBN		USA	US	24.616667000000	-82.866667000000	USD
2214	Webequie	Webequie	YWP		Canada	CA	52.959722000000	-87.374444000000	CAD
2215	La Palma Airport	Santa Cruz De La Palma	SPC		Spain and Canary Islands	ES	28.626389000000	-17.755556000000	EUR
2216	Reina Beatrix Airport	Aruba	AUA		Aruba	AW	12.502222000000	-70.013889000000	AWG
2217	Koh Samui Airport	Koh Samui	USM		Thailand	TH	9.555315000000	100.062795000000	THB
2218	Hattiesburg Laurel Regional Airport	Moselle	PIB		United States	US	31.467500000000	-89.336670000000	USD
2219	Antsiranana	Antsiranana	DIE		Madagascar	MG	-12.349444000000	49.291667000000	MGA
2220	Rotterdam Centraal Rail Station	Rotterdam	QRH		Netherlands	NL	51.924167000000	4.470278000000	EUR
2221	Soria Bus Station	Soria Bus Station	XJO		Spain	ES	41.766944000000	-2.479444000000	EUR
2222	Chesterfield Bus Station	Chesterfield Bus Station	ZFI		United Kingdom	GB	53.250000000000	-1.416667000000	GBP
2223	Abu Dhabi Bateen Apt	Abu Dhabi	AZI		United Arab Emirates	AE	24.427778000000	54.459167000000	AED
2224	Yiwu	Yiwu	YIW		China	CN	29.345000000000	120.032500000000	RMB
2225	Moanamani	Moanamani	ONI		Indonesia	ID	-3.983333000000	136.083333000000	IDR
2226	Mal	Mal	MMV		Papua New Guinea	PG	-1.409722000000	144.186944000000	PGK
2227	Bubaque	Bubaque	BQE		Guinea-Bissau	GW	11.300000000000	-15.850000000000	XOF
2228	Little Port Walter	Little Port Walter	LPW		USA	US	56.383333000000	-134.833333000000	USD
2229	Fort Hope	Fort Hope	YFH		Canada	CA	51.561667000000	-87.908056000000	CAD
2230	Elmas Airport	Cagliari	CAG		Italy	IT	39.254333000000	9.060673000000	EUR
2231	Liverpool John Lennon Airport	Liverpool	LPL		United Kingdom	GB	53.337616000000	-2.854905000000	GBP
2232	Henry E. Rohlsen Airport	Saint Croix	STX		U.S. Virgin Islands	VI	17.701944000000	-64.798611000000	USD
2233	Airai Airport	Koror	ROR		Palau	PW	7.364122000000	134.532892000000	USD
2234	Union Island	Union Island	UNI		St Vincent and the Grenadines	VC	12.616667000000	-61.433333000000	XCD
2235	Benson	Benson	BEX		United Kingdom	GB	51.616667000000	-1.083333000000	GBP
2236	St Moritz	St Moritz	SMV		Switzerland	CH	46.534167000000	9.884167000000	CHF
2237	Zyryanka	Zyryanka	ZKP		Russian Federation	RU	65.736667000000	150.705000000000	RUB
2238	Inta	Inta	INA		Russian Federation	RU	66.066667000000	60.100000000000	RUB
2239	Rajshahi	Rajshahi	RJH		Bangladesh	BD	24.437222000000	88.616389000000	BDT
2240	Hivaro	Hivaro	HIT		Papua New Guinea	PG	-6.941944000000	143.056944000000	PGK
2241	Westport	Westport	WSZ		New Zealand	NZ	-41.736944000000	171.579167000000	NZD
2242	Saeve Airport	Gothenburg	GSE		Sweden	SE	57.777749000000	11.864513000000	SEK
2243	Juan Santamaria International Airport	San Jose	SJO		Costa Rica	CR	9.998238000000	-84.204080000000	CRC
2244	Henderson International Airport	Honiara	HIR		Solomon Islands	SB	-9.428592000000	160.048182000000	SBD
2245	Dubuque Regional Airport	Dubuque	DBQ		United States	US	42.410000000000	-90.710830000000	USD
2246	London Biggin Hill Apt	London (GB)	BQH		United Kingdom	GB	51.330833000000	0.032222000000	GBP
2247	Forres	Forres	FSS		United Kingdom	GB	57.650000000000	-3.566667000000	GBP
2248	Braintree	Braintree	WXF		United Kingdom	GB	51.966667000000	0.516667000000	GBP
2249	Sevastopol	Sevastopol	UKS		Ukraine	UA	44.691667000000	33.575833000000	UAH
2250	Kashi	Kashi	KHG		China	CN	39.542500000000	76.020000000000	RMB
2251	Vijayawada	Vijayawada	VGA		India	IN	16.530556000000	80.796944000000	INR
2252	Shute Harbour	Shute Harbour	JHQ		Australia	AU	-20.283333000000	148.750000000000	AUD
2253	Lago Agrio	Lago Agrio	LGQ		Ecuador	EC	0.092500000000	-76.869444000000	USD
2254	East Hampton	East Hampton	HTO		USA	US	40.966667000000	-72.233333000000	USD
2255	Langford Rail Station	Langford Rail Station	XEJ		Canada	CA	48.433333000000	-123.483333000000	CAD
2256	General Bartolome Salom Intl	Puerto Cabello	PBL		Venezuela	VE	10.479167000000	-68.073610000000	VEB
2257	Dyce Airport	Aberdeen	ABZ		United Kingdom	GB	57.200253000000	-2.204186000000	GBP
2258	John F. Kennedy International Airport	New York	JFK		United States	US	40.642335000000	-73.788170000000	USD
2259	Blackpool Airport	Blackpool	BLK		United Kingdom	GB	53.778385000000	-3.041985000000	GBP
2260	Medfra	Medfra	MDR		USA	US	63.100000000000	-154.716667000000	USD
2261	Debra Tabor	Debra Tabor	DBT		Ethiopia	ET	11.966667000000	38.000000000000	ETB
2262	Papa Stour	Papa Stour	PSV		United Kingdom	GB	60.321944000000	-1.693333000000	GBP
2263	Berdyansk	Berdyansk	ERD		Ukraine	UA	46.733333000000	36.783333000000	UAH
2264	Kufra	Kufra	AKF		Libya	LY	24.178611000000	23.313889000000	LYD
2265	Sesriem	Sesriem	SZM		Namibia	NA	-24.583333000000	15.833333000000	NAD
2266	Deurne Airport	Antwerp	ANR		Belgium	BE	51.189160000000	4.450672000000	EUR
2267	Glasgow International Airport	Glasgow	GLA		United Kingdom	GB	55.864213000000	-4.431782000000	GBP
2268	Pensacola Regional Airport	Pensacola	PNS		United States	US	30.475942000000	-87.194157000000	USD
2269	Saipan International Airport	Saipan	SPN		Northern Mariana Islands	MP	15.122178000000	145.723257000000	USD
2270	Wiley Post Will Rogers Memorial Airport	Barrow	BRW		United States	US	71.288574000000	-156.775790000000	USD
2271	Bembridge	Bembridge	BBP		United Kingdom	GB	50.678056000000	-1.109167000000	GBP
2272	Shoreham By Sea	Shoreham By Sea	ESH		United Kingdom	GB	50.835556000000	-0.297222000000	GBP
2273	Shoreham By Sea	Shoreham By Sea	ESH		United Kingdom	GB	50.835556000000	-0.297222000000	GBP
2274	Northallerton Rail Station	Northallerton Rail Station	XNO		United Kingdom	GB	54.333333000000	-1.433333000000	GBP
2275	Breves	Breves	BVS		Brazil	BR	-1.666667000000	-50.466667000000	BRL
2276	Sovetskaya Gavan	Sovetskaya Gavan	GVN		Russian Federation	RU	48.000000000000	140.000000000000	RUB
2277	Qalah-ye Now	Qalah-ye Now	LQN		Afghanistan	AF	34.950000000000	63.666667000000	USD
2278	Gewoya	Gewoya	GEW		Papua New Guinea	PG	-9.183333000000	148.483333000000	PGK
2279	Vahitahi	Vahitahi	VHZ		French Polynesia	PF	-18.779722000000	-138.853333000000	XPF
2280	Chicken	Chicken	CKX		USA	US	64.066389000000	-141.951389000000	USD
2281	Salmon	Salmon	SMN		USA	US	45.183333000000	-113.916667000000	USD
2282	Swan River	Swan River	ZJN		Canada	CA	52.100000000000	-101.266667000000	CAD
2283	Mangaia Island	Mangaia Island	MGS		Cook Islands	CK	-21.893889000000	-157.908333000000	NZD
2284	Zanaga	Zanaga	ANJ		Congo	CG	-2.850000000000	13.833333000000	XAF
2285	Zachar Bay	Zachar Bay	KZB		USA	US	57.550000000000	-153.750000000000	USD
2286	Paradise River	Paradise River	YDE		Canada	CA	53.433333000000	-57.233333000000	CAD
2287	Vaasa Airport	Vaasa	VAA		Finland	FI	63.043549000000	21.760123000000	EUR
2288	Winnipeg James Armstrong Richardson International Airport	Winnipeg	YWG		Canada	CA	49.900000000000	-97.233333000000	CAD
2289	Al Ain Airport	Al Ain	AAN		United Arab Emirates	AE	24.260231000000	55.616626000000	AED
2290	Hatay Airport	Antakya	HTY		Turkey	TR	36.364544000000	36.280570000000	USD
2291	Amboseli	Amboseli	ASV		Kenya	KE	-2.645000000000	37.252778000000	KES
2292	Lydd	Lydd	LYX		United Kingdom	GB	50.956111000000	0.939167000000	GBP
2293	London Ebbsfleet Intl Rail Station	London (GB)	XQE		United Kingdom	GB	51.443056000000	0.321111000000	GBP
2294	Guajara-Mirim	Guajara-Mirim	GJM		Brazil	BR	-10.833333000000	-65.333333000000	BRL
2295	Juzhou	Juzhou	JUZ		China	CN	28.966667000000	118.833333000000	RMB
2296	Tirupati	Tirupati	TIR		India	IN	13.632500000000	79.543333000000	INR
2297	Noumea Magenta Apt	Noumea	GEA		New Caledonia	NC	-22.258333000000	166.472778000000	XPF
2298	Yuendumu	Yuendumu	YUE		Australia	AU	-22.266667000000	131.783333000000	AUD
2299	Kenosha	Kenosha	ENW		USA	US	42.595833000000	-87.927778000000	USD
2300	Umiat	Umiat	UMT		USA	US	69.366667000000	-152.133333000000	USD
2301	Pleso Airport	Zagreb	ZAG		Croatia	HR	45.733242000000	16.061519000000	EUR
2302	Belfast International Airport	Belfast	BFS		United Kingdom	GB	54.662397000000	-6.217616000000	GBP
2303	LaGuardia Airport	New York	LGA		United States	US	40.774252000000	-73.871617000000	USD
2304	Kramfors Airport	Kramfors	KRF		Sweden	SE	63.049442000000	17.772778000000	SEK
2305	Long Island MacArthur Airport	Ronkonkoma	ISP		USA	US	40.789314000000	-73.097550000000	USD
2306	Nekemte	Nekemte	NEK		Ethiopia	ET	9.033333000000	36.583333000000	ETB
2307	Igdir	Igdir	IGD		Turkey	TR	39.972778000000	43.884444000000	USD
2308	Sevilla Santa Justa Rail Stn	Sevilla Santa Justa Rail Stn	XQA		Spain	ES	37.394167000000	-5.974167000000	EUR
2309	Juiz de Fora Zona da Mata	Juiz de Fora Zona da Mata	IZA		Brazil	BR	-21.511389000000	-43.173056000000	BRL
2310	Taramajima	Taramajima	TRA		Japan	JP	24.650000000000	124.700000000000	JPY
2311	Lampang	Lampang	LPT		Thailand	TH	18.272222000000	99.504167000000	THB
2312	Likiep Island	Likiep Island	LIK		Marshall Islands	MH	9.816667000000	169.316667000000	USD
2313	Manta	Manta	MEC		Ecuador	EC	-0.946111000000	-80.678889000000	USD
2314	Visby Airport	Visby	VBY		Sweden	SE	57.660447000000	18.338154000000	SEK
2315	Augusto C Sandino Airport	Managua	MGA		Nicaragua	NI	12.144838000000	-86.171263000000	NIO
2316	Erbil International Airport	Erbil	EBL		Iraq	IQ	36.237500000000	43.963056000000	NID
2317	Lanai Airport	Lanai City	LNY		United States	US	20.790085000000	-156.950490000000	USD
2318	Bodrum (TR) 00	Bodrum	BXN		Turkey	TR	37.134722000000	27.667222000000	USD
2319	Shetland Islands Scatsta Apt	Shetland Islands	SCS		United Kingdom	GB	60.433333000000	-1.283333000000	GBP
2320	Garmisch-Partenkirchen Rail Station	Garmisch-Partenkirchen Rail Station	ZEI		Germany	DE	47.500000000000	11.100000000000	EUR
2321	Bisha	Bisha	BHH		Saudi Arabia	SA	19.984444000000	42.620833000000	SAR
2322	Luena	Luena	LUO		Angola	AO	-11.750000000000	19.866667000000	AOA
2323	Busselton	Busselton	BQB		Australia	AU	-33.687500000000	115.402222000000	AUD
2324	Takume	Takume	TJN		French Polynesia	PF	-15.855556000000	-142.268333000000	XPF
2325	Yaounde Apt	Yaounde	YAO		Cameroon	CM	3.833611000000	11.523611000000	XAF
2326	Pemina	Pemina	PMB		USA	US	48.950000000000	-97.233333000000	USD
2327	Quesnel	Quesnel	YQZ		Canada	CA	53.026111000000	-122.510278000000	CAD
2328	Kungsangen Airport	Norrkoping	NRK		Sweden	SE	58.583296000000	16.232393000000	SEK
2329	Comalapa International Airport	San Salvador	SAL		El Salvador	SV	13.445126000000	-89.057230000000	USD
2330	Fua'Amotu International Airport	Nuku'alofa	TBU		Tonga	TO	-21.241171000000	-175.141312000000	TOP
2331	Mcclellan Palomar Airport	Carlsbad	CLD		United States	US	33.125500000000	-117.275000000000	USD
2332	Malmo Harbour Heliport	Malmo	JMM		Sweden	SE	55.616667000000	13.000000000000	SEK
2333	Passau Rail Station	Passau Rail Station	ZPF		Germany	DE	48.574167000000	13.450833000000	EUR
2334	El Bayadh	El Bayadh	EBH		Algeria	DZ	33.720833000000	1.091389000000	DZD
2335	Ondjiva	Ondjiva	VPE		Angola	AO	-17.043889000000	15.684722000000	AOA
2336	Ocean Falls Seaplane Base	Ocean Falls	ZOF		Canada	CA	52.350975000000	-127.694550000000	CAD
2337	Doncaster Sheffield Airport	Doncaster	DSA		United Kingdom	GB	53.481004000000	-1.011550000000	GBP
2338	Erie International Airport	Erie	ERI		United States	US	42.083142000000	-80.182030000000	USD
2339	Faaa Airport	Papeete	PPT		French Polynesia	PF	-17.559629000000	-149.609375000000	XPF
2340	Edward G. Pitka Sr Airport	Galena	GAL		United States	US	64.737980000000	-156.941860000000	USD
2341	Kauhava	Kauhava	KAU		Finland	FI	63.100000000000	23.083333000000	EUR
2342	Siegburg	Siegburg	ZPY		Germany	DE	50.800000000000	7.200000000000	EUR
2343	Dakhla Oasis	Dakhla Oasis	DAK		Egypt	EG	25.416667000000	29.000000000000	EGP
2344	Upington	Upington	UTN		South Africa	ZA	-28.399167000000	21.260278000000	ZAR
2345	Melbourne International Airport	Melbourne	MLB		United States	US	28.102500000000	-80.630278000000	USD
2346	Joensuu Airport	Joensuu	JOE		Finland	FI	62.656788000000	29.613540000000	EUR
2347	Port de Paix	Port de Paix	PAX		Haiti	HT	19.933333000000	-72.841667000000	HTG
2348	Husavik	Husavik	HZK		Iceland	IS	65.952500000000	-17.425833000000	ISK
2349	Artvin Hopa Bus Station	Artvin Hopa Bus Station	XHQ		Turkey	TR	41.000000000000	41.000000000000	USD
2350	Lencois	Lencois	LEC		Brazil	BR	-12.480000000000	-41.281111000000	BRL
2351	Tokyo Bus Station	Tokyo Bus Station	LMJ		Japan	JP	35.680000000000	139.768889000000	JPY
2352	Bima	Bima	BMU		Indonesia	ID	-8.539722000000	118.687222000000	IDR
2353	Karimui	Karimui	KMR		Papua New Guinea	PG	-6.500000000000	144.833333000000	PGK
2354	Ogle	Ogle	OGL		Guyana	GY	6.806944000000	-58.106667000000	GYD
2355	Jonesboro	Jonesboro	JBR		USA	US	35.833056000000	-90.649444000000	USD
2356	St Marys Rail Station	St Marys Rail Station	XIO		Canada	CA	43.250000000000	-81.133333000000	CAD
2357	Noto Hadinegoro Airport	Jember	JBB		Indonesia	ID	-8.242432000000	113.695330000000	IDR
2358	Birmingham Airport	Birmingham	BHM		United States	US	33.560834000000	-86.752189000000	USD
2359	Alamosa Municipal Airport	Alamosa	ALS		United States	US	37.436670000000	-105.866670000000	USD
2360	St George Municipal Airport	St. George	SGU		United States	US	37.097300000000	-113.591000000000	USD
2361	Carlisle	Carlisle	CAX		United Kingdom	GB	54.937500000000	-2.809167000000	GBP
2362	London St Pancras Intl Rail Station	London (GB)	QQS		United Kingdom	GB	51.531667000000	-0.126389000000	GBP
2363	Glasgow Central Rail Station	Glasgow (GB)	ZGG		United Kingdom	GB	55.850000000000	-4.250000000000	GBP
2364	Olomouc	Olomouc	OLO		Czech Republic	CZ	49.588333000000	17.208333000000	CZK
2365	Daocheng	Daocheng	DCY		China	CN	29.316667000000	100.060000000000	RMB
2366	Aurangabad	Aurangabad	IXU		India	IN	19.862778000000	75.398056000000	INR
2367	Krasnodar Airport	Krasnodar	KRR		Russian Federation	RU	45.034138000000	39.139002000000	RUB
2368	Yoff Airport	Dakar	DKR		Senegal	SN	14.744975000000	-17.490194000000	XOF
2369	Sultan Ismail International Airport	Johor Bharu	JHB		Malaysia	MY	1.638889000000	103.670833000000	MYR
2370	Sumburgh Airport	Shetland Islands	LSI		United Kingdom	GB	59.877888000000	-1.287111000000	GBP
2371	Marie Galante	Marie Galante	GBJ		Guadeloupe	GP	15.868889000000	-61.270000000000	EUR
2372	Brighton	Brighton	BSH		United Kingdom	GB	50.833333000000	-0.133333000000	GBP
2373	Lugo Rail Station	Lugo Rail Station	LUY		Spain	ES	43.015000000000	-7.551944000000	EUR
2374	Albacete Bus Station	Albacete Bus Station	XJJ		Spain	ES	38.997778000000	-1.846389000000	EUR
2375	Campina Grande	Campina Grande	CPV		Brazil	BR	-7.270000000000	-35.896389000000	BRL
2376	Gwangju	Gwangju	KWJ		Korea Republic of	KR	35.126389000000	126.808889000000	KRW
2377	Ban Mak Khaeng	Ban Mak Khaeng	BAO		Thailand	TH	17.383333000000	102.783333000000	THB
2378	Emo	Emo	EMO		Papua New Guinea	PG	-8.733333000000	147.783333000000	PGK
2379	Whangarei	Whangarei	WRE		New Zealand	NZ	-35.768889000000	174.363889000000	NZD
2380	Dolomi	Dolomi	DLO		USA	US	55.133333000000	-132.051389000000	USD
2381	Tuscaloosa	Tuscaloosa	TCL		USA	US	33.219167000000	-87.610000000000	USD
2382	Shamattawa	Shamattawa	ZTM		Canada	CA	55.851944000000	-92.083333000000	CAD
2383	Lese	Lese	LNG		Papua New Guinea	PG	-8.166667000000	146.116667000000	PGK
2384	Tumbes	Tumbes	TBP		Peru	PE	-3.552500000000	-80.381389000000	PEN
2385	Larsen Bay	Larsen Bay	KLN		USA	US	57.534444000000	-153.977778000000	USD
2386	Uranium City	Uranium City	YBE		Canada	CA	59.566667000000	-108.483333000000	CAD
2387	Entzheim Airport	Strasbourg	SXB		France	FR	48.544877000000	7.627674000000	EUR
2388	London City Airport	London	LCY		United Kingdom	GB	51.500000000000	0.050000000000	GBP
2389	Osh Airport	Osh	OSS		Kyrgyzstan	KG	40.607690000000	72.786482000000	KGS
2390	Tri-State/Milton J. Ferguson Field	Huntington	HTS		United States	US	38.366943000000	-82.556114000000	USD
2391	Farnborough	Farnborough	FAB		United Kingdom	GB	51.275833000000	-0.776389000000	GBP
2392	German Rail Zone G	German Rail Zone G	QYG		Germany	DE	54.000000000000	13.000000000000	EUR
2393	Prague Hlavni North Rail Station	Prague Hlavni North Rail Station	XYG		Czech Republic	CZ	50.083333000000	14.466667000000	CZK
2394	Changzhou	Changzhou	CZX		China	CN	31.919444000000	119.778333000000	RMB
2395	Pathankot	Pathankot	IXP		India	IN	32.233889000000	75.634722000000	INR
2396	Bunsil	Bunsil	BXZ		Papua New Guinea	PG	-5.716667000000	147.866667000000	PGK
2397	Tom Price	Tom Price	TPR		Australia	AU	-22.650000000000	117.666667000000	AUD
2398	Bartow	Bartow	BOW		USA	US	27.933333000000	-81.783333000000	USD
2399	Rosario (US)	Rosario (US)	RSJ		USA	US	48.646111000000	-122.870000000000	USD
2400	Fort Nelson	Fort Nelson	YYE		Canada	CA	58.837778000000	-122.597778000000	CAD
2401	Pohnpei Airport	Pohnpei, Caroline Islands	PNI		Micronesia	FM	6.980947000000	158.203343000000	USD
2402	Jacksonville International Airport	Jacksonville	JAX		United States	US	30.491657000000	-81.683056000000	USD
2403	Luigi Ridolfi Airport	Forli	FRL		Italy	IT	44.198570000000	12.070760000000	EUR
2404	Zhezkazgan	Zhezkazgan	DZN		Kazakhstan	KZ	47.710000000000	67.740278000000	KZT
2405	Karlskoga	Karlskoga	KSK		Sweden	SE	59.333333000000	14.516667000000	SEK
2406	Darlington Rail Station	Darlington Rail Station	XVG		United Kingdom	GB	54.516667000000	-1.566667000000	GBP
2407	Macae	Macae	MEA		Brazil	BR	-22.343056000000	-41.766111000000	BRL
2408	Seoul Kimpo International Apt	Seoul	SEL		Korea Republic of	KR	37.550000000000	126.800000000000	KRW
2409	Koh Kong	Koh Kong	KKZ		Cambodia	KH	11.633333000000	102.966667000000	KHR
2410	Yasuru	Yasuru	KSX		Papua New Guinea	PG	-6.600000000000	146.183333000000	PGK
2411	Galapagos Islands	Galapagos Islands	GPS		Ecuador	EC	-0.453889000000	-90.265833000000	USD
2412	Nanortalik	Nanortalik	JNN		Greenland	GL	60.141944000000	-45.233056000000	DKK
2413	Aldershot Rail Station	Aldershot Rail Station	XLY		Canada	CA	43.313333000000	-79.855833000000	CAD
2414	Sishen Airport	Sishen	SIS		South Africa	ZA	-27.649178000000	22.999138000000	ZAR
2415	Tontouta Airport	Noumea	NOU		New Caledonia	NC	-22.016389000000	166.216111000000	XPF
2416	Castlegar	Castlegar	YCG		Canada	CA	49.296389000000	-117.632500000000	CAD
2417	Skopje Airport	Skopje	SKP		Macedonia (FYROM)	MK	41.956489000000	21.628720000000	EUR
2418	Tampa International Airport	Tampa	TPA		United States	US	27.979869000000	-82.535415000000	USD
2419	Glenegedale Airport	Islay	ILY		United Kingdom	GB	55.681946000000	-6.254167000000	GBP
2420	Grand Forks International Airport	Grand Forks	GFK		United States	US	47.948800000000	-97.175870000000	USD
2421	Wajir	Wajir	WJR		Kenya	KE	1.784722000000	39.932778000000	KES
2422	York Rail Station	York Rail Station	QQY		United Kingdom	GB	53.966667000000	-1.083333000000	GBP
2423	Muehlheim An Der Ruhr Rail Station	Muehlheim An Der Ruhr Rail Station	ZOO		Germany	DE	51.433333000000	6.883333000000	EUR
2424	Dabaa City	Dabaa City	DBB		Egypt	EG	30.924444000000	28.461389000000	EGP
2425	Umtata	Umtata	UTT		South Africa	ZA	-31.547778000000	28.674167000000	ZAR
2426	Aranuka	Aranuka	AAK		Kiribati	KI	0.216667000000	174.000000000000	AUD
2427	Ringi Cove	Ringi Cove	RIN		Solomon Islands	SB	-8.125556000000	157.143056000000	SBD
2428	Sierra Leone	Sierra Leone	SRK		Sierra Leone	SL	77.786389000000	-70.638333000000	SLL
2429	Port Graham	Port Graham	PGM		USA	US	59.349722000000	-151.831111000000	USD
2430	The Pas	The Pas	YQD		Canada	CA	53.971389000000	-101.091111000000	CAD
2431	Donetsk Airport	Donetsk	DOK		Ukraine	UA	48.083333000000	37.750000000000	UAH
2432	Jose Maria Cordova	Medellin	MDE		Colombia	CO	6.171382000000	-75.428206000000	COP
2433	Vadso Airport	Vadso	VDS		Norway	NO	70.065000000000	29.845278000000	NOK
2434	Piedras Negras	Piedras Negras	PDS		Mexico	MX	28.627500000000	-100.535278000000	MXN
2435	Oban	Oban	OBN		United Kingdom	GB	56.466667000000	-5.400000000000	GBP
2436	Falkenberg Rail Station	Falkenberg Rail Station	XYM		Sweden	SE	56.901944000000	12.487500000000	SEK
2437	San Julian	San Julian	ULA		Argentina	AR	-49.306667000000	-67.802778000000	ARS
2438	Underkhaan	Underkhaan	UNR		Mongolia	MN	47.316667000000	110.666667000000	MNT
2439	Roi Et	Roi Et	ROI		Thailand	TH	16.116667000000	103.773889000000	THB
2440	Mindik	Mindik	MXK		Papua New Guinea	PG	-6.216667000000	147.616667000000	PGK
2441	Gamba	Gamba	GAX		Gabon	GA	-2.766667000000	9.983333000000	XAF
2442	Minchumin	Minchumin	MHM		USA	US	63.866667000000	-152.250000000000	USD
2443	Dryden	Dryden	YHD		Canada	CA	49.831667000000	-92.744167000000	CAD
2444	Chios Airport	Chios	JKH		Greece	GR	38.345795000000	26.142335000000	EUR
2445	Seattle-Tacoma International Airport	Seattle	SEA		United States	US	47.443839000000	-122.301732000000	USD
2446	Cam Rahn Airport	Nha Trang	CXR		Viet Nam	VN	11.993611000000	109.225000000000	VND
2447	Petropavlovsk (KZ)	Petropavlovsk (KZ)	PPK		Kazakhstan	KZ	54.774444000000	69.183889000000	KZT
2448	Carlisle	Carlisle	CAX		United Kingdom	GB	54.937500000000	-2.809167000000	GBP
2449	Barra do Garcas	Barra do Garcas	BPG		Brazil	BR	-15.850000000000	-52.383333000000	BRL
2450	Glasgow Central Rail Station	Glasgow (GB)	ZGG		United Kingdom	GB	55.850000000000	-4.250000000000	GBP
2451	Santa Cruz do Sul	Santa Cruz do Sul	CSU		Brazil	BR	-29.683333000000	-52.416667000000	BRL
2452	Longyan	Longyan	LCX		China	CN	25.675556000000	116.745556000000	RMB
2453	Buri Ram	Buri Ram	BFV		Thailand	TH	15.226667000000	103.251111000000	THB
2454	Kosrae Airport	Kosrae, Caroline Islands	KSA		Micronesia	FM	5.352478000000	162.956603000000	USD
2455	Albuquerque International Sunport	Albuquerque	ABQ		United States	US	35.049625000000	-106.617193000000	USD
2456	Bornholm Airport	Bornholm	RNN		Denmark	DK	55.065556000000	14.757778000000	DKK
2457	Salcea Airport	Suceava	SCV		Romania	RO	47.689445000000	26.356112000000	ROL
2458	La Paz (MX)	La Paz (MX)	LAP		Mexico	MX	24.072778000000	-110.362500000000	MXN
2459	Brighton	Brighton	BSH		United Kingdom	GB	50.833333000000	-0.133333000000	GBP
2460	London Kings Cross Rail Station	London Kings Cross Rail Station	QQK		United Kingdom	GB	51.533333000000	-0.116667000000	GBP
2461	Levanger Rail Station	Levanger Rail Station	XUH		Norway	NO	63.745278000000	11.301667000000	NOK
2462	Belo Horizonte Pampulha Apt	Belo Horizonte	PLU		Brazil	BR	-19.851111000000	-43.950556000000	BRL
2463	Taiyuan	Taiyuan	TYN		China	CN	37.746944000000	112.628333000000	RMB
2464	Lwbak	Lwbak	LWA		Philippines	PH	17.350000000000	121.183333000000	PHP
2465	Kili Island	Kili Island	KIO		Marshall Islands	MH	5.650000000000	169.200000000000	USD
2466	Nare	Nare	NAR		Colombia	CO	6.200000000000	-74.616667000000	COP
2467	Imperial County Apt	Imperial	IPL		USA	US	32.835000000000	-115.574722000000	USD
2468	Georgetown Rail Station	Georgetown Rail Station	XHM		Canada	CA	43.655556000000	-79.919167000000	CAD
2469	Stung Treng	Stung Treng	TNX		Cambodia	KH	13.531944000000	106.014444000000	KHR
2470	Open Bay	Open Bay	OPB		Papua New Guinea	PG	-4.800000000000	151.700000000000	PGK
2471	Moanda	Moanda	MNB		Congo Democratic Republic of	CD	-5.933333000000	12.350000000000	CDF
2472	Naknek	Naknek	NNK		USA	US	58.750000000000	-156.533333000000	USD
2473	Chibougamau	Chibougamau	YMT		Canada	CA	49.771944000000	-74.528056000000	CAD
2474	Paro Airport	Paro	PBH		Bhutan	BT	27.433333000000	89.416667000000	BTN
2475	Bangui Airport	Bangui	BGF		Central African Republic	CF	4.396111000000	18.520278000000	XAF
2476	Lombok International Airport	Praya	LOP		Indonesia	ID	-8.757322000000	116.276675000000	IDR
2477	Bemidji-Beltrami County Airport	Bemidji	BJI		United States	US	47.506500000000	-94.933800000000	USD
2478	Farnborough	Farnborough	FAB		United Kingdom	GB	51.275833000000	-0.776389000000	GBP
2479	Porsgrunn Rail Station	Porsgrunn Rail Station	XKP		Norway	NO	59.140278000000	9.658056000000	NOK
2480	Jose de San Martin	Jose de San Martin	JSM		Argentina	AR	-44.033333000000	-70.466667000000	ARS
2481	Orchid Island	Orchid Island	KYD		Chinese Taipei	TW	22.083333000000	121.500000000000	TWD
2482	Bario	Bario	BBN		Malaysia	MY	3.734722000000	115.478333000000	MYR
2483	Hobart	Hobart	HBA		Australia	AU	-42.836111000000	147.510278000000	AUD
2484	Chachapoyas	Chachapoyas	CHH		Peru	PE	-6.050000000000	-78.033333000000	PEN
2485	Greenville (US) TN	Greenville (US) TN	GCY		USA	US	36.183333000000	-82.816667000000	USD
2486	Meyers Chuck	Meyers Chuck	WMK		USA	US	55.740000000000	-132.258056000000	USD
2487	Sudbury Airport	Sudbury	YSB		Canada	CA	46.625000000000	-80.798889000000	CAD
2488	Pohnpei Airport	Pohnpei, Caroline Islands	PNI		Micronesia	FM	6.980947000000	158.203343000000	USD
2489	Alexandria International Airport	Alexandria	AEX		United States	US	31.321268000000	-92.539583000000	USD
2490	El Dorado International Airport	Bogota	BOG		Colombia	CO	4.698602000000	-74.143135000000	COP
2491	Grand Turk	Grand Turk	GDT		Turks and Caicos Islands	TC	21.445278000000	-71.145278000000	USD
2492	La Graciosa	La Graciosa	GGA		Spain	ES	29.229167000000	-13.501389000000	EUR
2493	Darlington Rail Station	Darlington Rail Station	XVG		United Kingdom	GB	54.516667000000	-1.566667000000	GBP
2494	Francisco Beltrao	Francisco Beltrao	FBE		Brazil	BR	-26.059444000000	-53.064167000000	BRL
2495	Matsu	Matsu	MFK		Chinese Taipei	TW	26.216667000000	119.983333000000	TWD
2496	Batom	Batom	BXM		Indonesia	ID	-2.283333000000	139.600000000000	IDR
2497	Nissan Island	Nissan Island	IIS		Papua New Guinea	PG	-4.500000000000	154.241667000000	PGK
2498	Manihi	Manihi	XMH		French Polynesia	PF	-14.436667000000	-146.070000000000	XPF
2499	Hartford Brainard Apt	Hartford	HFD		USA	US	41.737222000000	-72.648611000000	USD
2500	Halifax Rail Station	Halifax	XDG		Canada	CA	44.638889000000	-63.568333000000	CAD
2501	Milas Airport	Bodrum	BJV		Turkey	TR	37.243952000000	27.672781000000	USD
2502	Santos Dumont Airport	Rio De Janeiro	SDU		Brazil	BR	-22.911541000000	-43.167097000000	BRL
2503	Gloucestershire Airport	Gloucester	GLO		United Kingdom	GB	51.883330000000	-2.233333000000	GBP
2504	Stornoway Airport	Stornoway	SYY		United Kingdom	GB	58.213627000000	-6.321995000000	GBP
2505	Nuevo Laredo	Nuevo Laredo	NLD		Mexico	MX	27.443889000000	-99.570556000000	MXN
2506	Brize Norton	Brize Norton	BZZ		United Kingdom	GB	51.750000000000	-1.583333000000	GBP
2507	Derby Rail Station	Nottingham	XQH		United Kingdom	GB	52.916667000000	-1.500000000000	GBP
2508	Miskolc	Miskolc	MCQ		Hungary	HU	48.138889000000	20.794444000000	HUF
2509	Changzhi	Changzhi	CIH		China	CN	36.247500000000	113.125833000000	RMB
2510	Belgaum	Belgaum	IXG		India	IN	15.859167000000	74.618333000000	INR
2511	Bunbury	Bunbury	BUY		Australia	AU	-33.378056000000	115.678611000000	AUD
2512	Tamworth	Tamworth	TMW		Australia	AU	-31.083889000000	150.846667000000	AUD
2513	Beckley	Beckley	BKW		USA	US	37.787222000000	-81.124167000000	USD
2514	Rome	Rome (US)	RME		USA	US	43.232500000000	-75.405833000000	USD
2515	Prince George	Prince George	YXS		Canada	CA	53.881944000000	-122.675833000000	CAD
2516	Kwajalein Airport	Kwajalein	KWA		Marshall Islands	MH	8.720843000000	167.721953000000	USD
2517	Patenga Airport	Chittagong	CGP		Bangladesh	BD	22.245202000000	91.815159000000	BDT
2518	San Angelo Regional Mathis Field	San Angelo	SJT		United States	US	31.359722000000	-100.494446000000	USD
2519	Badajoz Rail Station	Badajoz Rail Station	BQZ		Spain	ES	38.890556000000	-6.981389000000	EUR
2520	Kelsterbach	Kelsterbach	QLH		Germany	DE	50.066667000000	8.533333000000	EUR
2521	Lancaster Rail Station (GB)	Lancaster Rail Station (GB)	XQL		United Kingdom	GB	54.050000000000	-2.800000000000	GBP
2522	Vinnica	Vinnica	VIN		Ukraine	UA	49.233333000000	28.483333000000	UAH
2523	Ulanhot	Ulanhot	HLH		China	CN	46.194722000000	122.008333000000	RMB
2524	Nuwara Eliya	Nuwara Eliya	NUA		Sri Lanka	LK	6.956667000000	80.780000000000	LKR
2525	Dorobisoro	Dorobisoro	DOO		Papua New Guinea	PG	-9.500000000000	147.800000000000	PGK
2526	Winton	Winton	WIN		Australia	AU	-22.363611000000	143.085556000000	AUD
2527	Clovis Municipal Apt	Clovis	CVN		USA	US	34.426389000000	-103.078889000000	USD
2528	Sturgeon Bay	Sturgeon Bay	SUE		USA	US	44.833333000000	-87.416667000000	USD
2529	Lancaster Rail Station	Lancaster Rail Station	ZRL		USA	US	40.053611000000	-76.307500000000	USD
2530	Valladolid Airport	Valladolid	VLL		Spain and Canary Islands	ES	41.705810000000	-4.844626000000	EUR
2531	Rabil Airport	Boa Vista	BVC		Cape Verde	CV	16.083333000000	-22.833333000000	CVE
2532	Afonso Pena Airport	Curitiba	CWB		Brazil	BR	-25.532199000000	-49.176543000000	BRL
2533	Blagoveschensk Airport	Blagoveschensk	BQS		Russia	RU	50.416668000000	127.400000000000	RUB
2534	Ghimbi	Ghimbi	GHD		Ethiopia	ET	9.166667000000	35.816667000000	ETB
2535	Kassel	Kassel	KSF		Germany	DE	51.408333000000	9.377500000000	EUR
2536	Reading Rail Station	Reading Rail Station	XRE		United Kingdom	GB	51.466667000000	-0.983333000000	GBP
2537	Ipiranga	Ipiranga	IPG		Brazil	BR	-3.333333000000	-69.416667000000	BRL
2538	Tokushima	Tokushima	TKS		Japan	JP	34.132778000000	134.606667000000	JPY
2539	Lahad Datu	Lahad Datu	LDU		Malaysia	MY	5.030278000000	118.328333000000	MYR
2540	Learmonth	Learmonth	LEA		Australia	AU	-22.235556000000	114.088611000000	AUD
2541	La Pedrera	La Pedrera	LPD		Colombia	CO	-1.325556000000	-69.581389000000	COP
2542	Hartsville	Hartsville	HVS		USA	US	34.400000000000	-80.116667000000	USD
2543	Tasiuasaq	Tasiuasaq	XEQ		Greenland	GL	60.194444000000	-44.813611000000	DKK
2544	Capt.  Justiniano Montenegro Airport	Pedasi	PDM		Panama	PA	7.553333000000	-80.021290000000	PAB
2545	Belfast City Airport	Belfast	BHD		United Kingdom	GB	54.614520000000	-5.870215000000	GBP
2546	Newark Liberty International Airport	Newark	EWR		United States	US	40.689071000000	-74.178753000000	USD
2547	PopradTatry Airport	PopradTatry	TAT		Slovakia	SK	49.071945000000	20.240278000000	EUR
2548	St Francois	St Francois	SFC		Guadeloupe	GP	16.257778000000	-61.262500000000	EUR
2549	Algeciras Rail Station	Algeciras Rail Station	AEI		Spain	ES	36.127500000000	-5.453889000000	EUR
2550	Isles of Scilly Tresco Heliport	Isles of Scilly	TSO		United Kingdom	GB	49.945556000000	-6.331389000000	GBP
2551	Kumla Rail Station	Kumla Rail Station	XXV		Sweden	SE	59.126667000000	15.141111000000	SEK
2552	Ust-Tsilma	Ust-Tsilma	UTS		Russian Federation	RU	65.433333000000	52.201667000000	RUB
2553	Bole	Bole	BPL		China	CN	44.895833000000	82.300000000000	RMB
2554	Hambantota	Hambantota	HRI		Sri Lanka	LK	6.283889000000	81.123889000000	LKR
2555	Bapi	Bapi	BPD		Papua New Guinea	PG	-7.750000000000	147.016667000000	PGK
2556	Timaru	Timaru	TIU		New Zealand	NZ	-44.300000000000	171.224722000000	NZD
2557	Bradford	Bradford	BFD		USA	US	41.803056000000	-78.640000000000	USD
2558	Northallerton Rail Station	Northallerton Rail Station	XNO		United Kingdom	GB	54.333333000000	-1.433333000000	GBP
2559	Bor	Bor	TGP		Russian Federation	RU	61.593056000000	90.002500000000	RUB
2560	Asahikawa	Asahikawa	AKJ		Japan	JP	43.670833000000	142.447500000000	JPY
2561	Faizabad	Faizabad	FBD		Afghanistan	AF	37.122500000000	70.518056000000	USD
2562	Carnarvon	Carnarvon	CVQ		Australia	AU	-24.884722000000	113.666389000000	AUD
2563	Vahitahi	Vahitahi	VHZ		French Polynesia	PF	-18.779722000000	-138.853333000000	XPF
2564	Alakanuk	Alakanuk	AUK		USA	US	62.678889000000	-164.650833000000	USD
2565	Kangaatsiaq	Kangaatsiaq	QPW		Greenland	GL	68.312778000000	-53.460278000000	DKK
2566	Val D'Or	Val D'Or	YVO		Canada	CA	48.053333000000	-77.782778000000	CAD
2567	Kamusi	Kamusi	KUY		Papua New Guinea	PG	-7.427500000000	143.123889000000	PGK
2568	Paz de Ariporo	Paz de Ariporo	PZA		Colombia	CO	5.783333000000	-71.816667000000	COP
2569	Maniitsoq	Maniitsoq	JSU		Greenland	GL	65.412500000000	-52.939722000000	DKK
2570	Pointe-aux-Trembles Rail Station	Pointe-aux-Trembles Rail Station	XPX		Canada	CA	45.650000000000	-73.500000000000	CAD
2571	Shennongjia Airport	Hongping	HPG		China	CN	31.633330000000	110.337780000000	RMB
2572	Melville Hall Airport	Dominica	DOM		Dominica	DM	15.543056000000	-61.309167000000	XCD
2573	Kalibo Airport	Kalibo	KLO		Philippines	PH	11.687152000000	122.381832000000	PHP
2574	Ornskoldsvik Airport	Ornskoldsvik	OER		Sweden	SE	63.412582000000	18.992073000000	SEK
2575	Ustupu Island	Ustupu Island	OGM		Panama	PA	9.137500000000	-77.933333000000	PAB
2576	Lydd	Lydd	LYX		United Kingdom	GB	50.956111000000	0.939167000000	GBP
2577	London Ebbsfleet Intl Rail Station	London (GB)	XQE		United Kingdom	GB	51.443056000000	0.321111000000	GBP
2578	Blumenau	Blumenau	BNU		Brazil	BR	-26.933333000000	-49.050000000000	BRL
2579	Yamagata	Yamagata	GAJ		Japan	JP	38.411944000000	140.371389000000	JPY
2580	Katukurunda	Katukurunda	KTY		Sri Lanka	LK	6.552778000000	79.976389000000	LKR
2581	Chungribu	Chungribu	CVB		Papua New Guinea	PG	-4.800000000000	144.700000000000	PGK
2582	Vanuabalavu	Vanuabalavu	VBV		Fiji	FJ	-17.244722000000	178.956389000000	FJD
2583	Chalkyitsik	Chalkyitsik	CIK		USA	US	66.644167000000	-143.742778000000	USD
2584	Sleetmute	Sleetmute	SLQ		USA	US	61.700000000000	-157.165833000000	USD
2585	Houston Bus Station	Houston Bus Station	ZHO		Canada	CA	54.394444000000	-126.666667000000	CAD
2586	Belfast International Airport	Belfast	BFS		United Kingdom	GB	54.662397000000	-6.217616000000	GBP
2587	Denver International Airport	Denver	DEN		United States	US	39.849390000000	-104.672844000000	USD
2588	Bodo Airport	Bodo	BOO		Norway	NO	67.272620000000	14.367839000000	NOK
2589	Magnitogorsk Airport	Magnitogorsk	MQF		Russia	RU	53.450000000000	59.066666000000	RUB
2590	Dembidollo	Dembidollo	DEM		Ethiopia	ET	8.583333000000	34.883333000000	ETB
2591	Tudela Rail Station	Tudela Rail Station	EEL		Spain	ES	42.059444000000	-1.597500000000	EUR
2592	Flam Rail Station	Flam Rail Station	XGH		Norway	NO	60.862778000000	7.113056000000	NOK
2593	Corumba	Corumba	CMG		Brazil	BR	-19.011944000000	-57.673056000000	BRL
2594	Manzhouli	Manzhouli	NZH		China	CN	49.566667000000	117.330556000000	RMB
2595	Galela	Galela	GLX		Indonesia	ID	-2.183333000000	127.833333000000	IDR
2596	Kandrian	Kandrian	KDR		Papua New Guinea	PG	-6.216667000000	149.550000000000	PGK
2597	Buenaventura	Buenaventura	BUN		Colombia	CO	3.819722000000	-76.989722000000	COP
2598	Santiago De Compostela Airport	Santiago De Compostela	SCQ		Spain and Canary Islands	ES	42.897317000000	-8.420327000000	EUR
2599	Canouan Island Airport	Canouan Island	CIW		Saint Vincent and the Grenadines	VC	12.700000000000	-61.316667000000	XCD
2600	Blang Bintang Airport	Banda Aceh	BTJ		Indonesia	ID	5.518021000000	95.418329000000	IDR
2601	Yakima Air Terminal McAllister Field	Yakima	YKM		United States	US	46.566944000000	-120.537780000000	USD
2602	Shakiso	Shakiso	SKR		Ethiopia	ET	5.883333000000	38.966667000000	ETB
2603	Ashford International Rail Station	Ashford International Rail Station	QDH		United Kingdom	GB	51.143333000000	0.874722000000	GBP
2604	Nottingham Rail Station	Nottingham	XNM		United Kingdom	GB	52.969444000000	-1.166667000000	GBP
2605	Osnabrueck Rail Station	Osnabrueck Rail Station	ZPE		Germany	DE	52.272778000000	8.060556000000	EUR
2606	Sidi Belabbes	Sidi Belabbes	BFW		Algeria	DZ	35.171667000000	-0.589444000000	DZD
2607	Tsumeb	Tsumeb	TSB		Namibia	NA	-19.266667000000	17.733333000000	NAD
2608	Serui	Serui	ZRI		Indonesia	ID	-1.416667000000	136.233333000000	IDR
2609	Redcliffe	Redcliffe	RCL		Vanuatu	VU	-15.483333000000	167.833333000000	VUV
2610	Sibiti	Sibiti	SIB		Congo	CG	-3.733333000000	13.400000000000	XAF
2611	Pendleton	Pendleton	PDT		USA	US	45.695278000000	-118.836944000000	USD
2612	Powell River	Powell River	YPW		Canada	CA	49.834167000000	-124.500000000000	CAD
2613	Eelde Airport	Groningen	GRQ		Netherlands	NL	53.120278000000	6.575556000000	EUR
2614	O'Hare International Airport	Chicago	ORD		United States	US	41.976912000000	-87.904876000000	USD
2615	Avignon-Caum Airport	Avignon	AVN		France	FR	43.900000000000	4.900000000000	EUR
2616	Borg El Arab Airport	Alexandria	HBE		Egypt	EG	30.922234000000	29.686504000000	EGP
2617	Musoma	Musoma	MUZ		Tanzania United Republic of	TZ	-1.500000000000	33.800000000000	TZS
2618	Milan Cadorna Rail Station	Milan Cadorna Rail Station	XNC		Italy	IT	45.766667000000	9.333333000000	EUR
2619	Brande Bus Station	Brande Bus Station	ZMW		Denmark	DK	55.950000000000	9.116667000000	DKK
2620	Jerusalem	Jerusalem	JRS		Israel	IL	31.866667000000	35.216667000000	ILS
2621	Club Makokola	Club Makokola	CMK		Malawi	MW	-14.306667000000	35.132500000000	MWK
2622	Singkep	Singkep	SIQ		Indonesia	ID	-0.483333000000	104.583333000000	IDR
2623	Bristol Airport	Bristol	BRS		United Kingdom	GB	51.386756000000	-2.710659000000	GBP
2624	Niagara Falls International Airport	Niagara Falls	IAG		United States	US	43.100000000000	-78.950000000000	USD
2625	Kuala Namu International Airport	Kuala Namu	KNO		Indonesia	ID	3.634650000000	98.880720000000	IDR
2626	Kenai Municipal Airport	Kenai	ENA		United States	US	60.565210000000	-151.246440000000	USD
2627	Leon Rail Station	Leon Rail Station	EEU		Spain	ES	42.596111000000	-5.582778000000	EUR
2628	Edmonton Municipal Apt	Edmonton	YXD		Canada	CA	53.572500000000	-113.520556000000	CAD
2629	Lisbon Portela Airport	Lisbon	LIS		Portugal	PT	38.770043000000	-9.128165000000	EUR
2630	Ain El Bey Airport	Constantine	CZL		Algeria	DZ	36.286477000000	6.618425000000	DZD
2631	Phoenix Sky Harbor International Airport	Phoenix	PHX		United States	US	33.435036000000	-112.000164000000	USD
2632	Laage Airport	Rostock-Laage	RLG		Germany	DE	53.920000000000	12.266667000000	EUR
2633	San Jose Island	San Jose Island	SIC		Panama	PA	8.262222000000	-79.077778000000	PAB
2634	Flateyri	Flateyri	FLI		Iceland	IS	66.014167000000	-23.441111000000	ISK
2635	Reading Rail Station	Reading Rail Station	XRE		United Kingdom	GB	51.466667000000	-0.983333000000	GBP
2636	Colonia de Sacramento	Colonia de Sacramento	CDM		Argentina	AR	-34.472778000000	-57.842778000000	ARS
2637	Nagoya	Nagoya (JP) 00	NGY		Japan	JP	35.171111000000	136.882778000000	JPY
2638	Dumai	Dumai	DUM		Indonesia	ID	1.683333000000	101.450000000000	IDR
2639	Kamulai	Kamulai	KAQ		Papua New Guinea	PG	-8.133333000000	146.816667000000	PGK
2640	Ayacucho	Ayacucho	AYP		Peru	PE	-13.154722000000	-74.204444000000	PEN
2641	Fire Cove	Fire Cove	FIC		USA	US	55.777778000000	-131.537500000000	USD
2642	Venice	Venice (US)	VNC		USA	US	27.066667000000	-82.433333000000	USD
2643	Cannes Palm Beach Heliport	Cannes	JCA		France	FR	43.535278000000	7.038333000000	EUR
2644	Belfast City Airport	Belfast	BHD		United Kingdom	GB	54.614520000000	-5.870215000000	GBP
2645	Del Rio International Airport	Del Rio	DRT		United States	US	29.333333000000	-100.978333000000	USD
2646	Kjevik Airport	Kristiansand	KRS		Norway	NO	58.202550000000	8.073732000000	NOK
2647	Columbia Metropolitan Airport	Columbia	CAE		USA	US	33.946907000000	-81.125010000000	USD
2648	Algeciras Rail Station	Algeciras Rail Station	AEI		Spain	ES	36.127500000000	-5.453889000000	EUR
2649	Isles of Scilly Tresco Heliport	Isles of Scilly	TSO		United Kingdom	GB	49.945556000000	-6.331389000000	GBP
2650	Huesca Rail Station	Huesca Rail Station	XUA		Spain	ES	42.133333000000	-0.410000000000	EUR
2651	Kremenchug	Kremenchug	KHU		Ukraine	UA	49.100000000000	33.450000000000	UAH
2652	El Oued	El Oued	ELU		Algeria	DZ	33.512778000000	6.782778000000	DZD
2653	Hwange	Hwange	WKI		Zimbabwe	ZW	-18.366667000000	26.483333000000	ZWD
2654	Airok	Airok	AIC		Marshall Islands	MH	7.100000000000	171.233333000000	USD
2655	Ngukurr	Ngukurr	RPM		Australia	AU	-14.716667000000	134.750000000000	AUD
2656	Tambacounda	Tambacounda	TUD		Senegal	SN	13.736944000000	-13.653056000000	XOF
2657	Plattsburgh Municipal Apt	Plattsburgh	PLB		USA	US	44.683333000000	-73.516667000000	USD
2658	Thunder Bay	Thunder Bay	YQT		Canada	CA	48.371944000000	-89.323889000000	CAD
2659	Porto Airport	Porto	OPO		Portugal	PT	41.237774000000	-8.670272000000	EUR
2660	Liverpool John Lennon Airport	Liverpool	LPL		United Kingdom	GB	53.337616000000	-2.854905000000	GBP
2661	Gerald R. Ford International Airport	Grand Rapids	GRR		United States	US	42.885009000000	-85.529738000000	USD
2662	Ensheim Airport	Saarbruecken	SCN		Germany	DE	49.220090000000	7.112705000000	EUR
2663	Dangriga	Dangriga	DGA		Belize	BZ	16.982500000000	-88.231111000000	BZD
2664	Benson	Benson	BEX		United Kingdom	GB	51.616667000000	-1.083333000000	GBP
2665	Valladolid Bus Station	Valladolid Bus Station	XJN		Spain	ES	41.641389000000	-4.733333000000	EUR
2666	Bom Jesus Da Lapa	Bom Jesus Da Lapa	LAZ		Brazil	BR	-13.266667000000	-43.416667000000	BRL
2667	Pingtung	Pingtung	PIF		Chinese Taipei	TW	22.700278000000	120.481944000000	TWD
2668	Inanwatan	Inanwatan	INX		Indonesia	ID	-2.133333000000	132.166667000000	IDR
2669	Kaukura Atoll	Kaukura Atoll	KKR		French Polynesia	PF	-15.663333000000	-146.884722000000	XPF
2670	Neiva	Neiva	NVA		Colombia	CO	2.950278000000	-75.293889000000	COP
2671	London Heathrow Airport	London	LHR		United Kingdom	GB	51.469603000000	-0.453566000000	GBP
2672	Piedmont Triad International Airport	Greensboro/High Point	GSO		United States	US	36.105324000000	-79.937304000000	USD
2673	Lugano Airport	Lugano	LUG		Switzerland	CH	46.016666000000	8.966667000000	CHF
2674	El Portillo / Samana	El Portillo / Samana	EPS		Dominican Republic	DO	19.250000000000	-69.500000000000	DOP
2675	London Biggin Hill Apt	London (GB)	BQH		United Kingdom	GB	51.330833000000	0.032222000000	GBP
2676	Kastamonu	Kastamonu	KFS		Turkey	TR	41.315000000000	33.796111000000	USD
2677	Cordoba Rail Station	Cordoba Rail Station	XOJ		Spain	ES	37.888333000000	-4.789444000000	EUR
2678	Horizontina	Horizontina	HRZ		Brazil	BR	-27.638333000000	-54.340556000000	BRL
2679	Tianshui	Tianshui	THQ		China	CN	34.559722000000	105.860000000000	RMB
2680	Long Banga	Long Banga	LBP		Malaysia	MY	3.202222000000	115.402222000000	MYR
2681	Malekolon	Malekolon	MKN		Papua New Guinea	PG	-4.016667000000	153.675000000000	PGK
2682	Boende	Boende	BNB		Congo Democratic Republic of	CD	-0.288333000000	20.880556000000	CDF
2683	Alluitsup Paa	Alluitsup Paa	LLU		Greenland	GL	60.464722000000	-45.569444000000	DKK
2684	Fort Severn	Fort Severn	YER		Canada	CA	56.018611000000	-87.676389000000	CAD
2685	Debrecen Airport	Debrecen	DEB		Hungary	HU	47.550000000000	21.700000000000	HUF
2686	Dyce Airport	Aberdeen	ABZ		United Kingdom	GB	57.200253000000	-2.204186000000	GBP
2687	Rodriguez Ballon Airport	Arequipa	AQP		Peru	PE	-16.344812000000	-71.567993000000	PEN
2688	Blackpool Airport	Blackpool	BLK		United Kingdom	GB	53.778385000000	-3.041985000000	GBP
2689	Cedar Rapids Airport	Cedar Rapids	CID		USA	US	41.889423000000	-91.700300000000	USD
2690	Adiyaman	Adiyaman	ADF		Turkey	TR	37.731389000000	38.468889000000	USD
2691	Copenhagen Roskilde Apt	Copenhagen	RKE		Denmark	DK	55.666667000000	12.583333000000	DKK
2692	Bage	Bage	BGX		Brazil	BR	-31.383333000000	-54.116667000000	BRL
2693	Shenzhen Fu Yong Ferry Port	Shenzhen Fu Yong Ferry Port	FYG		China	CN	22.778056000000	113.612778000000	RMB
2694	Kolhapur	Kolhapur	KLH		India	IN	16.664722000000	74.289444000000	INR
2695	Orio Al Serio Airport	Milan	BGY		Italy	IT	45.665315000000	9.698713000000	EUR
2696	Glasgow International Airport	Glasgow	GLA		United Kingdom	GB	55.864213000000	-4.431782000000	GBP
2697	Karaganda Airport	Karaganda	KGF		Kazakhstan	KZ	49.675257000000	73.328364000000	KZT
2698	Roche Harbor	Roche Harbor	RCE		USA	US	48.611389000000	-123.141389000000	USD
2699	White River	White River	YWR		Canada	CA	48.583333000000	-85.250000000000	CAD
2700	Porto Airport	Porto	OPO		Portugal	PT	41.237774000000	-8.670272000000	EUR
2701	Oued Irara Airport	Hassi Messaoud	HME		Algeria	DZ	31.675303000000	6.145436000000	DZD
2702	Pittsburgh International Airport	Pittsburgh	PIT		United States	US	40.495850000000	-80.256570000000	USD
2703	Lampedusa Airport	Lampedusa	LMP		Italy	IT	35.500000000000	12.616667000000	EUR
2704	Siuna	Siuna	SIU		Nicaragua	NI	13.583333000000	-84.366667000000	NIO
2705	Elazig	Elazig	EZS		Turkey	TR	38.606944000000	39.291389000000	USD
2706	Lysaker Rail Station	Lysaker Rail Station	XUI		Norway	NO	59.913056000000	10.636944000000	NOK
2707	Patos de Minas	Patos de Minas	POJ		Brazil	BR	-18.671667000000	-46.490833000000	BRL
2708	Lensk	Lensk	ULK		Russian Federation	RU	60.722778000000	114.821944000000	RUB
2709	Ratanankiri	Ratanankiri	RBE		Cambodia	KH	13.666667000000	106.983333000000	KHR
2710	Lismore	Lismore	LSY		Australia	AU	-28.829444000000	153.257778000000	AUD
2711	Tena	Tena	TNW		Ecuador	EC	-0.986389000000	-77.819444000000	USD
2712	Ouzinkie	Ouzinkie	KOZ		USA	US	57.925556000000	-152.496667000000	USD
2713	Southampton Airport	Southampton	SOU		United Kingdom	GB	50.950725000000	-1.361318000000	GBP
2714	Huntsville International Airport	Huntsville	HSV		United States	US	34.648570000000	-86.774838000000	USD
2715	Esbjerg Airport	Esbjerg	EBJ		Denmark	DK	55.521430000000	8.549062000000	DKK
2716	Great Harbour Cay	Great Harbour Cay	GHC		Bahamas	BS	25.750278000000	-77.850000000000	BSD
2717	Skovde	Skovde	KVB		Sweden	SE	58.456389000000	13.972778000000	SEK
2718	Penrith Rail Station	Penrith Rail Station	XPF		United Kingdom	GB	54.666667000000	-2.733333000000	GBP
2719	Kotlas	Kotlas	KSZ		Russian Federation	RU	61.236111000000	46.698889000000	RUB
2720	Bangda	Bangda	BPX		China	CN	30.551111000000	97.110556000000	RMB
2721	Imphal	Imphal	IMF		India	IN	24.760000000000	93.896667000000	INR
2722	Garasa	Garasa	GRL		Papua New Guinea	PG	-7.950000000000	147.183333000000	PGK
2723	Franz Josef	Franz Josef	WHO		New Zealand	NZ	-43.300000000000	170.016667000000	NZD
2724	Pittsburgh Civic Arena H/P	Pittsburgh	CVA		USA	US	40.483333000000	-80.216667000000	USD
2725	Stuart	Stuart	SUA		USA	US	27.183333000000	-80.216667000000	USD
2726	Rockford Van Galder Bus Stn	Rockford	ZRK		USA	US	42.266667000000	-89.083333000000	USD
2727	London Luton Airport	London	LTN		United Kingdom	GB	51.879768000000	-0.376232000000	GBP
2728	Greenville-Spartanburg Airport	Greenville	GSP		United States	US	34.890569000000	-82.217053000000	USD
2729	Kallax Airport	Lulea	LLA		Sweden	SE	65.549390000000	22.123587000000	SEK
2730	Garachine	Garachine	GHE		Panama	PA	8.064722000000	-78.367222000000	PAB
2731	Salamanca Rail Station	Salamanca Rail Station	SEJ		Spain	ES	40.971667000000	-5.648333000000	EUR
2732	Ulyanovsk (RU) 00	Ulyanovsk (RU) 00	ULY		Russian Federation	RU	54.401111000000	48.802778000000	RUB
2733	Heihe	Heihe	HEK		China	CN	50.171667000000	127.309444000000	RMB
2734	Mirpur Khas	Mirpur Khas	MPD		Pakistan	PK	25.533333000000	69.016667000000	PKR
2735	Shannon Airport	Shannon	SNN		Ireland	IE	52.692480000000	-8.920390000000	EUR
2736	Doncaster Sheffield Airport	Doncaster	DSA		United Kingdom	GB	53.481004000000	-1.011550000000	GBP
2737	Aracaju Airport	Aracaju	AJU		Brazil	BR	-10.987206000000	-37.072791000000	BRL
2738	Octeville Airport	Le Havre	LEH		France	FR	49.538890000000	0.088611000000	EUR
2739	Chetumal	Chetumal	CTM		Mexico	MX	18.504722000000	-88.326944000000	MXN
2740	Salamanca Bus Station	Salamanca Bus Station	SAJ		Spain	ES	40.970278000000	-5.675278000000	EUR
2741	Tuzla	Tuzla	TZL		Bosnia and Herzegovina	BA	44.458611000000	18.725556000000	BAM
2742	Guyuan	Guyuan	GYU		China	CN	36.078889000000	106.216389000000	RMB
2743	Ludhiana	Ludhiana	LUH		India	IN	30.854167000000	75.953611000000	INR
2744	Bellona	Bellona	BNY		Solomon Islands	SB	-11.302222000000	159.798889000000	SBD
2745	Rimatara	Rimatara	RMT		French Polynesia	PF	-22.637500000000	-152.805278000000	XPF
2746	Lodja	Lodja	LJA		Congo Democratic Republic of	CD	-3.462778000000	23.618333000000	CDF
2747	Mount Vernon	Mount Vernon	MVW		USA	US	48.416667000000	-122.333333000000	USD
2748	Kimmirut/Lake Harbour	Kimmirut/Lake Harbour	YLC		Canada	CA	62.847778000000	-69.876111000000	CAD
2749	Jacquinot Bay	Jacquinot Bay	JAQ		Papua New Guinea	PG	-5.650000000000	151.500000000000	PGK
2750	Valesdir	Valesdir	VLS		Vanuatu	VU	-16.795833000000	168.176944000000	VUV
2751	Claremont	Claremont	CNH		USA	US	43.366667000000	-72.366667000000	USD
2752	Southern Pines	Southern Pines	SOP		USA	US	35.215278000000	-79.588333000000	USD
2753	Kegaska	Kegaska	ZKG		Canada	CA	50.196111000000	-61.265833000000	CAD
2754	Ciudad Real Airport	Ciudad Real	CQM		Spain and Canary Islands	ES	38.983333000000	-3.916667000000	EUR
2755	Bradley International Airport	Hartford	BDL		United States	US	41.929530000000	-72.684701000000	USD
2756	Bermuda Dunes Airport	Palm Springs	UDD		United States	US	33.735832000000	-116.267220000000	USD
2757	North Sound	North Sound	NSX		Virgin Islands, British	VG	18.500000000000	-64.366667000000	USD
2758	Corvo Island	Corvo Island	CVU		Portugal	PT	39.671389000000	-31.113611000000	EUR
2759	La Palma Del Condada Rail Station	La Palma Del Condada Rail Station	NDO		Spain	ES	37.383333000000	-6.550000000000	EUR
2760	Valladolid Campo Grande Rail Station	Valladolid Campo Grande Rail Station	XIV		Spain	ES	41.641944000000	-4.726944000000	EUR
2761	Wolfsburg Rail Station	Wolfsburg Rail Station	ZQU		Germany	DE	52.433333000000	10.800000000000	EUR
2762	Djanet	Djanet	DJG		Algeria	DZ	24.292778000000	9.452500000000	DZD
2763	Saurimo	Saurimo	VHC		Angola	AO	-9.700000000000	20.433333000000	AOA
2764	Asau	Asau	AAU		Samoa	WS	-13.458333000000	-172.600000000000	WST
2765	Aratika	Aratika	RKA		French Polynesia	PF	-15.485278000000	-145.467778000000	XPF
2766	Lambarene	Lambarene	LBQ		Gabon	GA	-0.716667000000	10.233333000000	XAF
2767	Mount Union	Mount Union	MUU		USA	US	40.383333000000	-77.883333000000	USD
2768	Chisasibi	Chisasibi	YKU		Canada	CA	53.805556000000	-78.916944000000	CAD
2769	Mazamet Airport	Castres	DCM		France	FR	43.555832000000	2.284167000000	EUR
2770	Port Elizabeth (XH)	Port Elizabeth (XH)	BQU		St Vincent and the Grenadines	VC	12.983333000000	-61.250000000000	XCD
2771	Bembridge	Bembridge	BBP		United Kingdom	GB	50.678056000000	-1.109167000000	GBP
2772	Ischia	Ischia	ISH		Italy	IT	40.744444000000	13.940833000000	EUR
2773	Northallerton Rail Station	Northallerton Rail Station	XNO		United Kingdom	GB	54.333333000000	-1.433333000000	GBP
2774	Guarapuava	Guarapuava	GPB		Brazil	BR	-25.388056000000	-51.522500000000	BRL
2775	Song Pan	Song Pan	JZH		China	CN	32.856667000000	103.683056000000	RMB
2776	Taplejung	Taplejung	TPJ		Nepal	NP	27.300000000000	87.700000000000	NPR
2777	Inverell	Inverell	IVR		Australia	AU	-29.883333000000	151.150000000000	AUD
2778	Bowen	Bowen	ZBO		Australia	AU	-20.016667000000	148.216667000000	AUD
2779	Alexandria Esler Field Apt	Alexandria (US)	ESF		USA	US	31.400000000000	-92.300000000000	USD
2780	Concord	Concord	USA		USA	US	35.387778000000	-80.709167000000	USD
2781	Angers Rail Station	Angers	OXG		France	FR	47.486111000000	-0.533333000000	EUR
2782	Darnley Island	Darnley Island	NLF		Australia	AU	-9.566667000000	143.750000000000	AUD
2783	Kiffa	Kiffa	KFA		Mauritania	MR	16.583333000000	-11.400000000000	MRO
2784	Miami SPB	Miami	MPB		USA	US	25.775000000000	-80.175000000000	USD
2785	Jasper Hinton	Jasper Hinton	YJP		Canada	CA	53.319444000000	-117.752778000000	CAD
2786	Argostolion Airport	Kefallinia	EFL		Greece	GR	38.118056000000	20.505556000000	EUR
2787	Calexico International Airport	Calexico	CXL		United States	US	32.666667000000	-115.516667000000	USD
2788	Angelholm Airport	Angelholm	AGH		Sweden	SE	56.293056000000	12.862500000000	SEK
2789	Leon Airport	Leon	LEN		Spain	ES	42.590570000000	-5.646290000000	EUR
2790	Mekane Selam	Mekane Selam	MKS		Ethiopia	ET	10.750000000000	38.766667000000	ETB
2791	Lydd	Lydd	LYX		United Kingdom	GB	50.956111000000	0.939167000000	GBP
2792	London Ebbsfleet Intl Rail Station	London (GB)	XQE		United Kingdom	GB	51.443056000000	0.321111000000	GBP
2793	Monte Alegre	Monte Alegre	MTE		Brazil	BR	-2.016667000000	-54.066667000000	BRL
2794	Moron	Moron	MXV		Mongolia	MN	49.663333000000	100.099444000000	MNT
2795	Cilacap	Cilacap	CXP		Indonesia	ID	-7.733333000000	109.000000000000	IDR
2796	Mount Isa	Mount Isa	ISA		Australia	AU	-20.663889000000	139.488611000000	AUD
2797	Ilo	Ilo	ILQ		Peru	PE	-17.341667000000	-71.341667000000	PEN
2798	Huron	Huron	HON		USA	US	44.385278000000	-98.228611000000	USD
2799	Prince Rupert Rail Station	Prince Rupert	XDW		Canada	CA	54.307778000000	-130.334444000000	CAD
2800	Malta Airport	Malta	MLK		USA	US	48.494415000000	-107.909500000000	USD
2801	Belfast International Airport	Belfast	BFS		United Kingdom	GB	54.662397000000	-6.217616000000	GBP
2802	Rio Gallegos Internacional Airport	Rio Gallegos	RGL		Argentina	AR	-51.616667000000	-69.283333000000	ARS
2803	Plymouth Airport	Plymouth	PLH		United Kingdom	GB	50.422337000000	-4.110009000000	GBP
2804	Key Field	Meridian	MEI		United States	US	32.337223000000	-88.749170000000	USD
2805	St Andrews	St Andrews	ADX		United Kingdom	GB	56.366667000000	-2.866667000000	GBP
2806	Northampton	Northampton	ORM		United Kingdom	GB	52.305278000000	-0.792778000000	GBP
2807	Sevilla Santa Justa Rail Stn	Sevilla Santa Justa Rail Stn	XQA		Spain	ES	37.394167000000	-5.974167000000	EUR
2808	Puerto la Victoria	Puerto la Victoria	PCJ		Paraguay	PY	-22.282778000000	-57.928611000000	PYG
2809	Lanzhou Zhongchuan-Lanzhou West Apt	Lanzhou	ZGC		China	CN	36.019444000000	103.750000000000	RMB
2810	Pangkalpinang	Pangkalpinang	PGK		Indonesia	ID	-2.163611000000	106.139167000000	IDR
2811	Moomba	Moomba	MOO		Australia	AU	-28.133333000000	140.233333000000	AUD
2812	San Borja	San Borja	SRJ		Bolivia	BO	-14.859167000000	-66.737500000000	BOB
2813	Southampton Airport	Southampton	SOU		United Kingdom	GB	50.950725000000	-1.361318000000	GBP
2814	Capitan Carlos Perez Airport	Villahermosa	VSA		Mexico	MX	17.992429000000	-92.818987000000	MXN
2815	Schoenefeld Airport	Berlin	SXF		Germany	DE	52.370277000000	13.521388000000	EUR
2816	Lawton Municipal Airport	Lawton	LAW		United States	US	34.573000000000	-98.413500000000	USD
2817	Gol	Gol	GLL		Norway	NO	60.783333000000	9.050000000000	NOK
2818	Stockholm C Rail Station	Stockholm	XEV		Sweden	SE	59.330556000000	18.058889000000	SEK
2819	Aalborg Rail Station	Aalborg	ZTG		Denmark	DK	57.050000000000	9.933333000000	DKK
2820	Essaouira	Essaouira	ESU		Morocco	MA	31.397500000000	-9.681667000000	MAD
2821	Kasaba Bay	Kasaba Bay	ZKB		Zambia	ZM	-8.533333000000	30.700000000000	ZMK
2822	Deniliquin	Deniliquin	DNQ		Australia	AU	-35.550000000000	144.950000000000	AUD
2823	Takume	Takume	TJN		French Polynesia	PF	-15.855556000000	-142.268333000000	XPF
2824	Mobile Aerospace Apt	Mobile	BFM		USA	US	30.633333000000	-88.066667000000	USD
2825	Red Dog	Red Dog	RDB		USA	US	68.028333000000	-162.908611000000	USD
2826	Cranbrook	Cranbrook	YXC		Canada	CA	49.610833000000	-115.782222000000	CAD
2827	London Luton Airport	London	LTN		United Kingdom	GB	51.879768000000	-0.376232000000	GBP
2828	Queretaro Airport	Queretaro	QRO		Mexico	MX	20.600000000000	-100.383333000000	MXN
2829	Dole-Jura Airport	Dole	DLE		France	FR	47.038254000000	5.428719000000	EUR
2830	Crooked Island	Crooked Island	CRI		Bahamas	BS	22.745556000000	-74.182222000000	BSD
2831	Frankfurt Neu Isenburg Rail Station	Frankfurt	QGV		Germany	DE	50.050000000000	8.700000000000	EUR
2832	Kardla	Kardla	KDL		Estonia	EE	58.990833000000	22.830833000000	EEK
2833	Alxa Left Banner	Alxa Left Banner	AXF		China	CN	38.823889000000	105.626111000000	RMB
2834	Hubli	Hubli	HBX		India	IN	15.361667000000	75.086944000000	INR
2835	Nantes Atlantique Airport	Nantes	NTE		France	FR	47.157623000000	-1.601402000000	EUR
2836	Doncaster Sheffield Airport	Doncaster	DSA		United Kingdom	GB	53.481004000000	-1.011550000000	GBP
2837	Ogdensburg Airport	Ogdensburg	OGS		United States	US	44.681667000000	-75.465833000000	USD
2838	Sainte Catherine Airport	Calvi	CLY		France	FR	42.527780000000	8.791667000000	EUR
2839	Stella Maris	Stella Maris	SML		Bahamas	BS	23.583056000000	-75.268611000000	BSD
2840	Maloy Harbour	Maloy Harbour	QFQ		Norway	NO	61.950000000000	5.100000000000	NOK
2841	Huangyan	Huangyan	HYN		China	CN	28.565278000000	121.430278000000	RMB
2842	Pasni	Pasni	PSI		Pakistan	PK	25.290556000000	63.345000000000	PKR
2843	Elcho Island	Elcho Island	ELC		Australia	AU	-12.019444000000	135.570556000000	AUD
2844	Wollongong	Wollongong	WOL		Australia	AU	-34.561111000000	150.788611000000	AUD
2845	Dickinson	Dickinson	DIK		USA	US	46.800000000000	-102.800000000000	USD
2846	Warrensburg	Warrensburg	SZL		USA	US	38.766667000000	-93.733333000000	USD
2847	Stamford	Stamford	ZTF		USA	US	41.046944000000	-73.541944000000	USD
2848	Pohnpei Airport	Pohnpei, Caroline Islands	PNI		Micronesia	FM	6.980947000000	158.203343000000	USD
2849	Greater Rochester International Airport	Rochester	ROC		United States	US	43.127974000000	-77.665427000000	USD
2850	Aro Airport	Molde	MOL		Norway	NO	62.747303000000	7.262118000000	NOK
2851	Rio Dulce	Rio Dulce	LCF		Guatemala	GT	15.667778000000	-88.947778000000	GTQ
2852	Mons Rail Station	Mons Rail Station	QMO		Belgium	BE	50.450000000000	3.933333000000	EUR
2853	Alicante Rail Stn	Alicante Rail Stn	YJE		Spain	ES	38.344722000000	-0.495833000000	EUR
2854	Rio Cuarto	Rio Cuarto	RCU		Argentina	AR	-33.100000000000	-64.266667000000	ARS
2855	Wuhai	Wuhai	WUA		China	CN	39.792500000000	106.799444000000	RMB
2856	Masamba	Masamba	MXB		Indonesia	ID	-2.533333000000	120.333333000000	IDR
2857	Mare	Mare	MEE		New Caledonia	NC	-21.481667000000	168.037500000000	XPF
2858	Potosi	Potosi	POI		Bolivia	BO	-19.543333000000	-65.723889000000	BOB
2859	Waterfall	Waterfall	KWF		USA	US	55.295278000000	-133.244722000000	USD
2860	Chetwynd	Chetwynd	YCQ		Canada	CA	55.700000000000	-121.666667000000	CAD
2861	Salvaza Airport	Carcassonne	CCF		France	FR	43.216667000000	2.316667000000	EUR
2862	Le Raizet Airport	Pointe A Pitre	PTP		Guadeloupe	GP	16.267500000000	-61.526389000000	EUR
2863	Rebiechowo Airport	Gdansk	GDN		Poland	PL	54.380979000000	18.468654000000	PLN
2864	Aba Tenna D Yilma Airport	Dire Dawa	DIR		Ethiopia	ET	9.613380000000	41.857994000000	ETB
2865	Sialkot Airport	Sialkot	SKT		Pakistan	PK	32.533333000000	74.500000000000	PKR
2866	Groznyy Airport	Groznyy	GRV		Russia	RU	43.333332000000	45.750000000000	RUB
2867	Garissa	Garissa	GAS		Kenya	KE	0.466667000000	39.633333000000	KES
2868	Isparta	Isparta	ISE		Turkey	TR	37.855556000000	30.368333000000	USD
2869	Wuppertal Rail Station	Wuppertal Rail Station	UWP		Germany	DE	51.255000000000	7.150000000000	EUR
2870	Barcelos	Barcelos	BAZ		Brazil	BR	-0.981111000000	-62.918333000000	BRL
2871	Jiujiang	Jiujiang	JIU		China	CN	29.478611000000	115.802222000000	RMB
2872	Salem	Salem	SXV		India	IN	11.650000000000	78.166667000000	INR
2873	Fulleborn	Fulleborn	FUB		Papua New Guinea	PG	-6.150000000000	150.650000000000	PGK
2874	Manumu	Manumu	UUU		Papua New Guinea	PG	-8.083333000000	147.550000000000	PGK
2875	Craig	Craig	CGA		USA	US	55.483333000000	-133.150000000000	USD
2876	San Antonio Kelly AFB	San Antonio	SKF		USA	US	29.538889000000	-98.466667000000	USD
2877	Tulita Fort Norman	Tulita Fort Norman	ZFN		Canada	CA	64.909722000000	-125.572500000000	CAD
2878	Pointe Noire Airport	Pointe Noire	PNR		Congo	CG	-4.809799000000	11.882377000000	XAF
2879	Chhatrapati Shivaji International Airport	Mumbai	BOM		India	IN	19.095508000000	72.874969000000	INR
2880	Minot International Airport	Minot	MOT		United States	US	48.259724000000	-101.280830000000	USD
2881	Manja	Manja	MJA		Madagascar	MG	-21.416667000000	44.316667000000	MGA
2882	Unst	Unst	UNT		United Kingdom	GB	60.750000000000	-0.850000000000	GBP
2883	Crewe Rail Station	Crewe Rail Station	XVC		United Kingdom	GB	53.083333000000	-2.450000000000	GBP
2884	Beloreck	Beloreck	BCX		Russian Federation	RU	53.933333000000	58.333333000000	RUB
2885	Siwa	Siwa	SEW		Egypt	EG	29.350000000000	25.516667000000	EGP
2886	Barisal	Barisal	BZL		Bangladesh	BD	22.801111000000	90.301111000000	BDT
2887	Haugesund Airport	Haugesund	HAU		Norway	NO	59.344763000000	5.215903000000	NOK
2888	Corpus Christi International Airport	Corpus Christi	CRP		United States	US	27.774813000000	-97.502489000000	USD
2889	Benbecula Airport	Benbecula	BEB		United Kingdom	GB	57.473415000000	-7.376028000000	GBP
2890	Hierro Airport	Valverde	VDE		Spain and Canary Islands	ES	27.813969000000	-17.884937000000	EUR
2891	Puerto Lempira	Puerto Lempira	PEU		Honduras	HN	15.262222000000	-83.784444000000	HNL
2892	Anglesey	Anglesey	VLY		United Kingdom	GB	53.248333000000	-4.535278000000	GBP
2893	Randers Rail Station	Randers Rail Station	ZIR		Denmark	DK	56.466667000000	10.050000000000	DKK
2894	Al Asad	Al Asad	IQA		Iraq	IQ	33.785556000000	42.441111000000	NID
2895	Richards Bay	Richards Bay	RCB		South Africa	ZA	-28.741111000000	32.092222000000	ZAR
2896	Taytay Sandoval	Taytay Sandoval	RZP		Philippines	PH	11.053333000000	121.941667000000	PHP
2897	Maupiti Island	Maupiti Island	MAU		French Polynesia	PF	-16.426389000000	-152.243611000000	XPF
2898	Urrao	Urrao	URR		Colombia	CO	6.333333000000	-76.183333000000	COP
2899	Port Bailey	Port Bailey	KPY		USA	US	57.930556000000	-153.040000000000	USD
2900	Nanaimo Cassidy Apt	Nanaimo	YCD		Canada	CA	49.052222000000	-123.870278000000	CAD
2901	Amazon Bay	Amazon Bay	AZB		Papua New Guinea	PG	-10.300000000000	149.333333000000	PGK
2902	Parasi	Parasi	PRS		Solomon Islands	SB	-9.716667000000	161.400000000000	SBD
2903	Anvik	Anvik	ANV		USA	US	62.649167000000	-160.189722000000	USD
2904	Chattanooga Greyhound Bus Service	Chattanooga	QDK		USA	US	35.166667000000	-85.216667000000	USD
2905	Alma	Alma	YTF		Canada	CA	48.509167000000	-71.643611000000	CAD
2906	Esenboga Airport	Ankara	ESB		Turkey	TR	40.114941000000	32.993145000000	USD
2907	Calgary International Airport	Calgary	YYC		Canada	CA	51.131394000000	-114.010551000000	CAD
2908	Queen Alia International Airport	Amman	AMM		Jordan	JO	31.722535000000	35.989318000000	JOD
2909	Chautauqua County-Jamestown Airport	Jamestown	JHW		United States	US	42.152800000000	-79.266600000000	USD
2910	Girona Rail Station	Girona Rail Station	GIA		Spain	ES	41.979167000000	2.816944000000	EUR
2911	Granada Rail Stn	Granada Rail Stn	YJG		Spain	ES	37.184167000000	-3.609167000000	EUR
2912	Puerto Deseado	Puerto Deseado	PUD		Argentina	AR	-47.734722000000	-65.903333000000	ARS
2913	Okayama Airport	Okayama	OKJ		Japan	JP	34.760218000000	133.852770000000	JPY
2914	Gloucestershire Airport	Gloucester	GLO		United Kingdom	GB	51.883330000000	-2.233333000000	GBP
2915	Orenburg Airport	Orenburg	REN		Russia	RU	51.791050000000	55.456700000000	RUB
2916	Ambilobe	Ambilobe	AMB		Madagascar	MG	-13.183333000000	48.983333000000	MGA
2917	The Hague	The Hague	HAG		Netherlands	NL	52.150000000000	4.291667000000	EUR
2918	Derby Rail Station	Nottingham	XQH		United Kingdom	GB	52.916667000000	-1.500000000000	GBP
2919	Brasov Bus Station	Brasov Bus Station	XHV		Romania	RO	45.983333000000	25.983333000000	ROL
2920	Khatgal	Khatgal	HTM		Mongolia	MN	50.450000000000	100.166667000000	MNT
2921	Porbandar	Porbandar	PBD		India	IN	21.648611000000	69.657222000000	INR
2922	Ebon	Ebon	EBO		Marshall Islands	MH	4.600000000000	168.750000000000	USD
2923	Walaha	Walaha	WLH		Vanuatu	VU	-15.412778000000	167.691667000000	VUV
2924	Chisana	Chisana	CZN		USA	US	62.083333000000	-142.050000000000	USD
2925	Seward	Seward	SWD		USA	US	60.133333000000	-149.416667000000	USD
2926	Sandy Lake	Sandy Lake	ZSJ		Canada	CA	53.064444000000	-93.346389000000	CAD
2927	Marsa Alam Airport	Marsa Alam	RMF		Egypt	EG	25.555787000000	34.592778000000	EGP
2928	Pakse Airport	Pakse	PKZ		Lao People's Democratic Republic	LA	15.136257000000	105.781295000000	LAK
2929	South Bend Regional Airport	South Bend	SBN		United States	US	41.700554000000	-86.313350000000	USD
2930	Badajoz Rail Station	Badajoz Rail Station	BQZ		Spain	ES	38.890556000000	-6.981389000000	EUR
2931	Stronsay	Stronsay	SOY		United Kingdom	GB	59.155278000000	-2.641944000000	GBP
2932	Lancaster Rail Station (GB)	Lancaster Rail Station (GB)	XQL		United Kingdom	GB	54.050000000000	-2.800000000000	GBP
2933	Coari	Coari	CIZ		Brazil	BR	-4.134167000000	-63.132500000000	BRL
2934	Ganzhou	Ganzhou	KOW		China	CN	25.851389000000	114.775278000000	RMB
2935	Aek Godang	Aek Godang	AEG		Indonesia	ID	1.400000000000	99.430000000000	IDR
2936	Mount Gunson	Mount Gunson	GSN		Australia	AU	-31.460556000000	137.172500000000	AUD
2937	Barinas	Barinas	BNS		Venezuela	VE	8.619444000000	-70.220833000000	VEB
2938	Flat	Flat	FLT		USA	US	62.450000000000	-158.000000000000	USD
2939	Stebbins	Stebbins	WBB		USA	US	63.514722000000	-162.284167000000	USD
2940	Reims	Reims	RHE		France	FR	49.310278000000	3.993889000000	EUR
2941	Valladolid Airport	Valladolid	VLL		Spain and Canary Islands	ES	41.705810000000	-4.844626000000	EUR
2942	Cyril E. King Airport	Saint Thomas	STT		U.S. Virgin Islands	VI	18.337500000000	-64.969444000000	USD
2943	Uralsk Airport	Uralsk	URA		Kazakhstan	KZ	51.153708000000	51.538562000000	KZT
2944	Outagamie County Regional Airport	Appleton	ATW		United States	US	44.260110000000	-88.509940000000	USD
2945	Seronera	Seronera	SEU		Tanzania United Republic of	TZ	-2.457222000000	34.821944000000	TZS
2946	Gijon	Gijon	QIJ		Spain	ES	43.537500000000	-5.676111000000	EUR
2947	Reading Rail Station	Reading Rail Station	XRE		United Kingdom	GB	51.466667000000	-0.983333000000	GBP
2948	Oran	Oran (AR)	ORA		Argentina	AR	-23.150000000000	-64.316667000000	ARS
2949	Yining	Yining	YIN		China	CN	43.955278000000	81.328889000000	RMB
2950	Okaba	Okaba	OKQ		Indonesia	ID	-8.100000000000	139.700000000000	IDR
2951	Malalaua	Malalaua	MLQ		Papua New Guinea	PG	-8.100000000000	146.166667000000	PGK
2952	Santa Marta	Santa Marta	SMR		Colombia	CO	11.119722000000	-74.230556000000	COP
2953	Ekwok	Ekwok	KEK		USA	US	59.353333000000	-157.476389000000	USD
2954	Arctic Bay	Arctic Bay	YAB		Canada	CA	73.006111000000	-85.032778000000	CAD
2955	Lesquin Airport	Lille	LIL		France	FR	50.572047000000	3.106067000000	EUR
2956	Belfast City Airport	Belfast	BHD		United Kingdom	GB	54.614520000000	-5.870215000000	GBP
2957	San Carlos de Bariloche International Airport	San Carlos de Bariloche	BRC		Argentina	AR	-41.145965000000	-71.161085000000	ARS
2958	Vigo Airport	Vigo	VGO		Spain and Canary Islands	ES	42.224552000000	-8.634025000000	EUR
2959	St Francois	St Francois	SFC		Guadeloupe	GP	16.257778000000	-61.262500000000	EUR
2960	Albacete Rail Station	Albacete Rail Station	EEM		Spain	ES	38.999444000000	-1.848333000000	EUR
2961	Isles of Scilly Tresco Heliport	Isles of Scilly	TSO		United Kingdom	GB	49.945556000000	-6.331389000000	GBP
2962	Chesterfield Bus Station	Chesterfield Bus Station	ZFI		United Kingdom	GB	53.250000000000	-1.416667000000	GBP
2963	Cacador	Cacador	CFC		Brazil	BR	-26.790556000000	-50.941389000000	BRL
2964	Hiroshima West Apt	Hiroshima	HIW		Japan	JP	34.350000000000	132.400000000000	JPY
2965	Mazar-e Sharif	Mazar-e Sharif	MZR		Afghanistan	AF	36.706944000000	67.209444000000	USD
2966	Doomadgee Mission	Doomadgee Mission	DMD		Australia	AU	-17.940278000000	138.821667000000	AUD
2967	Wangaratta	Wangaratta	WGT		Australia	AU	-36.366667000000	146.333333000000	AUD
2968	Columbia Owens Field	Columbia (US) SC	CUB		USA	US	33.983333000000	-81.000000000000	USD
2969	St George Island	St George Island	STG		USA	US	56.577778000000	-169.664167000000	USD
2970	Rockford Park & Ride Bus Station	Rockford	ZRF		USA	US	42.202778000000	-89.100000000000	USD
2971	Zaragoza Airport	Zaragoza	ZAZ		Spain and Canary Islands	ES	41.663862000000	-1.007466000000	EUR
2972	Amilcar Cabral International Airport	Sal	SID		Cape Verde	CV	16.734696000000	-22.943613000000	CVE
2973	Hercilio Luz Airport	Florianopolis	FLN		Brazil	BR	-27.664445000000	-48.545200000000	BRL
2974	Morgantown Municipal Walter L. Bill Hart Field	Morgantown	MGW		United States	US	39.642776000000	-79.915830000000	USD
2975	Gambela	Gambela	GMB		Ethiopia	ET	8.128889000000	34.563056000000	ETB
2976	Ceuta	Ceuta	JCU		Spain	ES	35.892222000000	-5.306944000000	EUR
2977	Angelholm/Helsingborg C Rail Stn	Angelholm/Helsingborg C Rail Stn	XYH		Sweden	SE	56.043056000000	12.695556000000	SEK
2978	San Juan	San Juan (AR)	UAQ		Argentina	AR	-31.571389000000	-68.418333000000	ARS
2979	Benguera Island	Benguera Island	BCW		Mozambique	MZ	-21.884722000000	35.425000000000	MZM
2980	Tawau	Tawau	TWU		Malaysia	MY	4.313333000000	118.121944000000	MYR
2981	Maramuni	Maramuni	MWI		Papua New Guinea	PG	-5.150000000000	143.483333000000	PGK
2982	Owando	Owando	FTX		Congo	CG	-0.983333000000	16.008333000000	XAF
2983	Rochester Ny Rail Station	Rochester Ny Rail Station	ZTE		USA	US	43.162778000000	-77.609167000000	USD
2984	Truk Airport	Truk, Caroline Islands	TKK		Micronesia	FM	7.457446000000	151.842005000000	USD
2985	Kokura Airport	Kita Kyushu	KKJ		Japan	JP	33.834374000000	130.943502000000	JPY
2986	Mildenhall Airport	Mildenhall	MHZ		United Kingdom	GB	52.366670000000	0.483333000000	GBP
2987	Chardzhou	Chardzhou	CRZ		Turkmenistan	TM	39.083333000000	63.616667000000	TMM
2988	Harwich Rail Station	Harwich Rail Station	QQH		United Kingdom	GB	51.950000000000	1.283333000000	GBP
2989	Holmestrand Rail Station	Holmestrand Rail Station	XUG		Norway	NO	59.491944000000	10.312222000000	NOK
2990	Pedro Juan Caballero	Pedro Juan Caballero	PJC		Paraguay	PY	-22.545000000000	-55.745000000000	PYG
2991	Tunxi	Tunxi	TXN		China	CN	29.732778000000	118.257222000000	RMB
2992	Palangkaraya	Palangkaraya	PKY		Indonesia	ID	-2.225000000000	113.942778000000	IDR
2993	Manare	Manare	MRM		Papua New Guinea	PG	-9.200000000000	147.600000000000	PGK
2994	Cap Skiring	Cap Skiring	CSK		Senegal	SN	12.394722000000	-16.747500000000	XOF
2995	Malden	Malden	MAW		USA	US	36.600000000000	-89.983333000000	USD
2996	La Grande	La Grande	YGL		Canada	CA	53.625278000000	-77.704167000000	CAD
2997	Exeter St Thomas Railway Station	Exeter	EXS		United Kingdom	GB	50.717130000000	-3.538580000000	GBP
2998	Aeroport Lleida-Alguaire	Alguaire	ILD		Spain and Canary Islands	ES	41.728836000000	0.543302000000	EUR
2999	Aomori Airport	Aomori	AOJ		Japan	JP	40.738757000000	140.689224000000	JPY
3000	Rarotonga Airport	Rarotonga	RAR		Cook Islands	CK	-21.199920000000	-159.798529000000	NZD
3001	Barnstable Municipal Boardman Polando Field	Hyannis	HYA		United States	US	41.665833000000	-70.280556000000	USD
3002	Batman	Batman	BAL		Turkey	TR	37.928889000000	41.116667000000	USD
3003	Portsmouth	Portsmouth	PME		United Kingdom	GB	50.833333000000	-1.050000000000	GBP
3004	Voss Rail Station	Voss Rail Station	XVK		Norway	NO	60.629167000000	6.410000000000	NOK
3005	Castro	Castro	MHC		Chile	CL	-42.343333000000	-73.716111000000	CLP
3006	Sokcho	Sokcho	SHO		Korea Republic of	KR	-26.519167000000	31.315833000000	KRW
3007	Kaimana	Kaimana	KNG		Indonesia	ID	-3.644444000000	133.695556000000	IDR
3008	Kuria	Kuria	KUC		Kiribati	KI	0.233333000000	173.416667000000	AUD
3009	Guanare	Guanare	GUQ		Venezuela	VE	9.033333000000	-69.750000000000	VEB
3010	Hillsboro	Hillsboro	HIO		USA	US	45.538056000000	-122.947500000000	USD
3011	Drummondville Rail Station	Drummondville Rail Station	XDM		Canada	CA	45.883333000000	-72.483333000000	CAD
3012	Ferdinand Lumban Tobing Airport	Sibolga	FLZ		Indonesia	ID	1.555833000000	98.888885000000	IDR
3013	Vancouver International Airport	Vancouver	YVR		Canada	CA	49.194697000000	-123.179191000000	CAD
3014	Demokritos Airport	Alexandroupolis	AXD		Greece	GR	40.856785000000	25.944893000000	EUR
3015	Westerly State Airport	Westerly	WST		United States	US	41.349200000000	-71.811500000000	USD
3016	Magdeburg	Magdeburg	CSO		Germany	DE	51.855833000000	11.418056000000	EUR
3017	Unst	Unst	UNT		United Kingdom	GB	60.750000000000	-0.850000000000	GBP
3018	Barcelona Franca Rail Stn	Barcelona Franca Rail Stn	YJD		Spain	ES	41.384167000000	2.186111000000	EUR
3019	Aripuana	Aripuana	AIR		Brazil	BR	-10.250000000000	-59.383333000000	BRL
3020	Iwami	Iwami	IWJ		Japan	JP	34.676389000000	131.790278000000	JPY
3021	Sawan	Sawan	RZS		Pakistan	PK	26.967222000000	68.878889000000	PKR
3022	Airport De Gran Canaria	Las Palmas	LPA		Spain and Canary Islands	ES	27.938944000000	-15.389351000000	EUR
3023	Jorge Newbery Airport	Buenos Aires	AEP		Argentina	AR	-34.556221000000	-58.416670000000	ARS
3024	Benbecula Airport	Benbecula	BEB		United Kingdom	GB	57.473415000000	-7.376028000000	GBP
3025	Bob Hope Airport	Burbank	BUR		USA	US	34.196190000000	-118.354110000000	USD
3026	Miandrivazo	Miandrivazo	ZVA		Madagascar	MG	-19.550000000000	45.450000000000	MGA
3027	Anglesey	Anglesey	VLY		United Kingdom	GB	53.248333000000	-4.535278000000	GBP
3028	Kolobrzeg Bus Station	Kolobrzeg Bus Station	QJY		Poland	PL	54.166667000000	15.583333000000	PLN
3029	Ejina Banner	Ejina Banner	EJN		China	CN	42.014722000000	101.002222000000	RMB
3030	Jumla	Jumla	JUM		Nepal	NP	29.274444000000	82.193611000000	NPR
3031	Awaba	Awaba	AWB		Papua New Guinea	PG	-8.014444000000	142.751111000000	PGK
3032	Popondetta	Popondetta	PNP		Papua New Guinea	PG	-8.804444000000	148.309167000000	PGK
3033	Sunyani	Sunyani	NYI		Ghana	GH	7.361944000000	-2.328889000000	GHC
3034	Wolf Point	Wolf Point	OLF		USA	US	48.094722000000	-105.575833000000	USD
3035	Ogoki	Ogoki	YOG		Canada	CA	51.658056000000	-85.901944000000	CAD
3117	Nowata	Nowata	NWT		Papua New Guinea	PG	-8.500000000000	143.166667000000	PGK
3036	Fitzroy Crossing	Fitzroy Crossing	FIZ		Australia	AU	-18.166667000000	125.550000000000	AUD
3037	Ulei	Ulei	ULB		Vanuatu	VU	-16.329722000000	168.301111000000	VUV
3038	Eek	Eek	EEK		USA	US	60.215000000000	-162.011944000000	USD
3039	Tununak	Tununak	TNK		USA	US	60.575556000000	-165.271111000000	USD
3040	Hampton Newport News Rail Station	Hampton Newport News Rail Station	ZWW		USA	US	36.988333000000	-76.416111000000	USD
3041	Yap Airport	Yap, Caroline Islands	YAP		Micronesia	FM	9.497715000000	138.086730000000	USD
3042	Juneau International Airport	Juneau	JNU		United States	US	58.359323000000	-134.583395000000	USD
3043	Gallivare Airport	Gallivare	GEV		Sweden	SE	67.134445000000	20.816668000000	SEK
3044	Limon	Limon	LIO		Costa Rica	CR	9.958056000000	-83.021944000000	CRC
3045	Saarbruecken HBF Rail Station	Saarbrucken	QFZ		Germany	DE	49.233333000000	7.000000000000	EUR
3046	Naples Beverello Harbour	Naples (IT)	ZMF		Italy	IT	40.839444000000	14.263611000000	EUR
3047	Hofuf	Hofuf	HOF		Saudi Arabia	SA	25.285278000000	49.485278000000	SAR
3048	Polokwane	Polokwane	PTG		South Africa	ZA	-23.845278000000	29.458611000000	ZAR
3049	Arutua	Arutua	AXR		French Polynesia	PF	-15.248333000000	-146.616667000000	XPF
3050	Motueka	Motueka	MZP		New Zealand	NZ	-41.116667000000	173.000000000000	NZD
3051	Korhogo	Korhogo	HGO		Cote D'Ivoire	CI	9.383333000000	-5.550000000000	XOF
3052	Kansas City Downtown Apt	Kansas City	MKC		USA	US	39.122778000000	-94.593333000000	USD
3053	Hornepayne	Hornepayne	YHN		Canada	CA	49.216667000000	-84.783333000000	CAD
3054	Zilina Airport	Zilina	ILZ		Slovakia	SK	49.233333000000	18.766667000000	EUR
3055	Alfonso B. Aragon Airport	Cali	CLO		Colombia	CO	3.543056000000	-76.381389000000	COP
3056	Wenchang Rail Station	Wenchang Rail Station	WEC		China	CN	19.607500000000	110.733056000000	RMB
3057	Dong Hoi	Dong Hoi	VDH		Viet Nam	VN	17.515278000000	106.590833000000	VND
3058	Kokoro	Kokoro	KOR		Papua New Guinea	PG	-7.816667000000	146.550000000000	PGK
3059	Pucallpa	Pucallpa	PCL		Peru	PE	-8.378056000000	-74.574167000000	PEN
3060	Qeqertarsuaq	Qeqertarsuaq	JGO		Greenland	GL	69.250833000000	-53.538056000000	DKK
3061	Sackville Rail Station	Sackville Rail Station	XKV		Canada	CA	45.889444000000	-64.368611000000	CAD
3062	Kavala International Airport	Kavala	KVA		Greece	GR	40.912994000000	24.619675000000	EUR
3063	Richards Field	Massena	MSS		United States	US	44.937778000000	-74.846667000000	USD
3064	Glenegedale Airport	Islay	ILY		United Kingdom	GB	55.681946000000	-6.254167000000	GBP
3065	Bugulma Airport	Bugulma	UUA		Russia	RU	54.616670000000	52.816666000000	RUB
3066	Majunga	Majunga	MJN		Madagascar	MG	-15.667222000000	46.351944000000	MGA
3067	York Rail Station	York Rail Station	QQY		United Kingdom	GB	53.966667000000	-1.083333000000	GBP
3068	Esbjerg Rail Station	Esbjerg	ZBB		Denmark	DK	55.466667000000	8.450000000000	DKK
3069	Mukalla (YE) 00	Mukalla (YE) 00	MKX		Yemen	YE	14.533333000000	49.133333000000	YER
3070	Karonga	Karonga	KGJ		Malawi	MW	-9.950000000000	33.916667000000	MWK
3071	Tacloban	Tacloban	TAC		Philippines	PH	11.227500000000	125.027778000000	PHP
3072	Scone	Scone	NSO		Australia	AU	-32.037778000000	150.831667000000	AUD
3073	Kayes	Kayes	KYS		Mali	ML	14.481667000000	-11.404722000000	XOF
3074	Kamuela	Kamuela	MUE		USA	US	20.001389000000	-155.668056000000	USD
3075	Klemtu	Klemtu	YKT		Canada	CA	52.593056000000	-128.521111000000	CAD
3076	Falconara Airport	Ancona	AOI		Italy	IT	43.606911000000	13.355723000000	EUR
3077	East Midlands Airport	Leicestershire	EMA		United Kingdom	GB	52.825872000000	-1.330595000000	GBP
3078	Agadir Almassira Airport	Agadir	AGA		Morocco	MA	30.378327000000	-9.555895000000	MAD
3079	Chennai Airport	Chennai	MAA		India	IN	12.982267000000	80.163782000000	INR
3080	Gloucestershire Airport	Gloucester	GLO		United Kingdom	GB	51.883330000000	-2.233333000000	GBP
3081	Cano Airport	Pasto	PSO		Colombia	CO	1.466667000000	-77.250000000000	COP
3082	Lodwar	Lodwar	LOK		Kenya	KE	3.121667000000	35.605556000000	KES
3083	The Hague	The Hague	HAG		Netherlands	NL	52.150000000000	4.291667000000	EUR
3084	Derby Rail Station	Nottingham	XQH		United Kingdom	GB	52.916667000000	-1.500000000000	GBP
3085	Concordia	Concordia	COC		Argentina	AR	-31.300000000000	-58.016667000000	ARS
3086	Gunsan	Gunsan	KUV		Korea Republic of	KR	35.903889000000	126.615833000000	KRW
3087	Attopeu	Attopeu	AOU		Lao People's Democratic Republic	LA	14.800000000000	106.816667000000	LAK
3088	Alotau	Alotau	GUR		Papua New Guinea	PG	-10.311389000000	150.339167000000	PGK
3089	Caucasia	Caucasia	CAQ		Colombia	CO	7.600000000000	-75.250000000000	COP
3090	Fort Yukon	Fort Yukon	FYU		USA	US	66.571389000000	-145.250556000000	USD
3091	Boulder Hiltons Harvest House Apt	Boulder	WHH		USA	US	40.016667000000	-105.283333000000	USD
3092	Tours Rail Station	Tours	XJT		France	FR	47.383333000000	0.683333000000	EUR
3093	Aminu Kano International Airport	Kano	KAN		Nigeria	NG	12.045549000000	8.522271000000	NGN
3094	Mosul Airport	Mosul	OSM		Iraq	IQ	36.307500000000	43.149444000000	NID
3095	Golden Triangle Regional Airport	Columbus	GTR		United States	US	33.451600000000	-88.587600000000	USD
3096	Fort William Heliport	Fort William Heliport	FWM		United Kingdom	GB	56.816667000000	-5.116667000000	GBP
3097	Stronsay	Stronsay	SOY		United Kingdom	GB	59.155278000000	-2.641944000000	GBP
3098	Lancaster Rail Station (GB)	Lancaster Rail Station (GB)	XQL		United Kingdom	GB	54.050000000000	-2.800000000000	GBP
3099	Itacoatiara	Itacoatiara	ITA		Brazil	BR	-3.200000000000	-58.500000000000	BRL
3100	Nan Sha	Nan Sha	NSZ		China	CN	22.777500000000	113.612500000000	RMB
3101	Enarotali	Enarotali	EWI		Indonesia	ID	-3.933333000000	136.366667000000	IDR
3102	Kabwum	Kabwum	KBM		Papua New Guinea	PG	-6.400000000000	147.366667000000	PGK
3103	Latacunga	Latacunga	LTX		Ecuador	EC	-0.907500000000	-78.615833000000	USD
3104	Kiana	Kiana	IAN		USA	US	66.975833000000	-160.436667000000	USD
3105	Senneterre Rail Station	Senneterre Rail Station	XFK		Canada	CA	48.383333000000	-77.250000000000	CAD
3106	Klagenfurt Airport	Klagenfurt	KLU		Austria	AT	46.650122000000	14.324192000000	EUR
3107	Leeds/Bradford Airport	Leeds	LBA		United Kingdom	GB	53.869339000000	-1.659985000000	GBP
3108	Cyril E. King Airport	Saint Thomas	STT		U.S. Virgin Islands	VI	18.337500000000	-64.969444000000	USD
3109	Zhengzhou Airport	Zhengzhou	CGO		China	CN	34.527519000000	113.840242000000	RMB
3110	Hancock County-Bar Harbor Airport	Ellsworth	BHB		United States	US	44.448890000000	-68.361664000000	USD
3111	Bury St Edmunds	Bury St Edmunds	BEQ		United Kingdom	GB	52.350000000000	0.766667000000	GBP
3112	Gijon	Gijon	QIJ		Spain	ES	43.537500000000	-5.676111000000	EUR
3113	Verdal Rail Station	Verdal Rail Station	XXG		Norway	NO	63.790833000000	11.484722000000	NOK
3114	Sao Miguel do Oeste	Sao Miguel do Oeste	SQX		Brazil	BR	-26.780556000000	-53.502778000000	BRL
3115	Likoma Island	Likoma Island	LIX		Malawi	MW	-12.080278000000	34.736389000000	MWK
3116	Tanjung Manis	Tanjung Manis	TGC		Malaysia	MY	2.177778000000	111.201944000000	MYR
3118	Bouar	Bouar	BOP		Central African Republic	CF	5.966667000000	15.633333000000	XAF
3119	Louisville Bowman Field Airport	Louisville	LOU		USA	US	38.236111000000	-85.666667000000	USD
3120	Iqaluit	Iqaluit	YFB		Canada	CA	63.756389000000	-68.555833000000	CAD
3121	Akureyri Airport	Akureyri	AEY		Iceland	IS	65.654567000000	-18.075068000000	ISK
3122	Belfast City Airport	Belfast	BHD		United Kingdom	GB	54.614520000000	-5.870215000000	GBP
3123	J Chavez International Airport	Lima	LIM		Peru	PE	-12.019421000000	-77.107666000000	PEN
3124	Vigo Airport	Vigo	VGO		Spain and Canary Islands	ES	42.224552000000	-8.634025000000	EUR
3125	St Francois	St Francois	SFC		Guadeloupe	GP	16.257778000000	-61.262500000000	EUR
3126	Albacete Rail Station	Albacete Rail Station	EEM		Spain	ES	38.999444000000	-1.848333000000	EUR
3127	Vaclav Havel Airport Prague	Prague	PRG		Czech Republic	CZ	50.106188000000	14.266638000000	CZK
3128	Pohnpei Airport	Pohnpei, Caroline Islands	PNI		Micronesia	FM	6.980947000000	158.203343000000	USD
3129	Belmonte Airport	Porto Velho	PVH		Brazil	BR	-8.714311000000	-63.898307000000	BRL
3130	Sion Airport	Sion	SIR		Switzerland	CH	46.250000000000	7.333333000000	CHF
3131	Tubala	Tubala	TUW		Panama	PA	8.733333000000	-77.683333000000	PAB
3132	Tekirdag	Tekirdag	TEQ		Turkey	TR	41.138889000000	27.919444000000	USD
3133	Alicante Rail Stn	Alicante Rail Stn	YJE		Spain	ES	38.344722000000	-0.495833000000	EUR
3134	Vallenar	Vallenar	VLR		Chile	CL	-28.600000000000	-70.766667000000	CLP
3135	Dundo	Dundo	DUE		Angola	AO	-7.400556000000	20.818889000000	AOA
3136	San Jose	San Jose (PH)	SJI		Philippines	PH	12.361389000000	121.046667000000	PHP
3137	Niuafo'ou	Niuafo'ou	NFO		Tonga	TO	-15.571111000000	-175.629722000000	TOP
3138	Yurimaguas	Yurimaguas	YMS		Peru	PE	-5.900000000000	-76.100000000000	PEN
3139	Mammoth Lakes	Mammoth Lakes	MMH		USA	US	37.624444000000	-118.840556000000	USD
3140	Atikokan	Atikokan	YIB		Canada	CA	48.750000000000	-91.616667000000	CAD
3141	Makedonia Airport	Thessaloniki	SKG		Greece	GR	40.520833000000	22.972222000000	EUR
3142	Le Raizet Airport	Pointe A Pitre	PTP		Guadeloupe	GP	16.267500000000	-61.526389000000	EUR
3143	Costa Brava Airport	Girona	GRO		Spain and Canary Islands	ES	41.898041000000	2.766383000000	EUR
3144	Reao	Reao	REA		French Polynesia	PF	-18.466111000000	-136.439444000000	XPF
3145	North Bay Airport	Barra	BRR		United Kingdom	GB	57.023335000000	-7.440278000000	GBP
3146	San Pedro Airport	Sao Vicente	VXE		Cape Verde	CV	16.835613000000	-25.057571000000	CVE
3147	Dodoma	Dodoma	DOD		Tanzania United Republic of	TZ	-6.183333000000	35.750000000000	TZS
3148	Merida Rail Station	Merida Rail Station	QWX		Spain	ES	38.921667000000	-6.343333000000	EUR
3149	Gyor Bus Station	Gyor Bus Station	QGY		Hungary	HU	47.683333000000	17.633333000000	HUF
3150	Yeniseysk	Yeniseysk	EIE		Russian Federation	RU	58.473333000000	92.112778000000	RUB
3151	Jessore	Jessore	JSR		Bangladesh	BD	23.183889000000	89.160833000000	BDT
3152	Kundiawa	Kundiawa	CMU		Papua New Guinea	PG	-6.023889000000	144.970833000000	PGK
3153	Nuku	Nuku	UKU		Papua New Guinea	PG	-3.683333000000	142.466667000000	PGK
3154	Cedar City	Cedar City	CDC		USA	US	37.700833000000	-113.098889000000	USD
3155	Spokane Felts Field	Spokane	SFF		USA	US	47.666667000000	-117.325000000000	USD
3156	Bathurst (CA)	Bathurst (CA)	ZBF		Canada	CA	47.629722000000	-65.738889000000	CAD
3157	Alicante Airport	Alicante	ALC		Spain and Canary Islands	ES	38.287098000000	-0.557381000000	EUR
3158	Washington Dulles International Airport	Washington	IAD		United States	US	38.953150000000	-77.447735000000	USD
3159	Ostend Airport	Ostend	OST		Belgium	BE	51.199722000000	2.863611000000	EUR
3160	Achutupo	Achutupo	ACU		Panama	PA	8.433333000000	-77.966667000000	PAB
3161	Coll	Coll	COL		United Kingdom	GB	56.601944000000	-6.617778000000	GBP
3162	Kristinehamn Rail Station	Kristinehamn Rail Station	XYN		Sweden	SE	59.316667000000	14.141667000000	SEK
3163	President Roque Saenz Pena	President Roque Saenz Pena	PRQ		Argentina	AR	-26.766667000000	-60.266667000000	ARS
3164	Uray	Uray	URJ		Russian Federation	RU	60.116111000000	64.830000000000	RUB
3165	Manokwari	Manokwari	MKW		Indonesia	ID	-0.891944000000	134.049167000000	IDR
3166	Grand Bahama International Airport	Freeport	FPO		Bahamas	BS	26.547292000000	-78.705197000000	BSD
3167	Sultan Abdul Aziz Shah Airport	Kuala Lumpur	SZB		Malaysia	MY	3.130644000000	101.558078000000	MYR
3168	Pierre Regional Airport	Pierre	PIR		United States	US	44.380363000000	-100.293190000000	USD
3169	Vipingo	Vipingo	VPG		Kenya	KE	-3.842778000000	39.805000000000	KES
3170	Bath Rail Station	Bath Rail Station	QQX		United Kingdom	GB	51.383333000000	-2.366667000000	GBP
3171	Utrecht Central Rail Station	Utrecht	ZYU		Netherlands	NL	52.083333000000	5.133333000000	EUR
3172	Turaif	Turaif	TUI		Saudi Arabia	SA	31.692778000000	38.731111000000	SAR
3173	Sun City	Sun City	NTY		South Africa	ZA	-25.333889000000	27.173333000000	ZAR
3174	Ruteng	Ruteng	RTG		Indonesia	ID	-8.600000000000	120.450000000000	IDR
3175	Lizard Island	Lizard Island	LZR		Australia	AU	-14.666667000000	145.466667000000	AUD
3176	Paramaribo Zorg En Hoop Apt	Paramaribo	ORG		Suriname	SR	5.433333000000	-55.200000000000	SRG
3177	Qasigiannguit	Qasigiannguit	JCH		Greenland	GL	68.820556000000	-51.172222000000	DKK
3178	Woodstock Rail Station	Woodstock Rail Station	XIP		Canada	CA	43.133333000000	-80.750000000000	CAD
3179	Tawitawi	Tawitawi	TWT		Philippines	PH	5.045000000000	119.742500000000	PHP
3180	Pacific Harbour	Pacific Harbour	PHR		Fiji	FJ	-18.256667000000	178.050000000000	FJD
3181	Mopti	Mopti	MZI		Mali	ML	14.512778000000	-4.079444000000	XOF
3182	Willow Grove	Willow Grove	NXX		USA	US	40.200000000000	-75.133333000000	USD
3183	Points North Landing	Points North Landing	YNL		Canada	CA	58.275000000000	-104.081111000000	CAD
3184	Arkhangelsk Airport	Arkhangelsk	ARH		Russian Federation	RU	64.594799000000	40.711903000000	RUB
3185	Nouakchott Airport	Nouakchott	NKC		Mauritania	MR	18.098149000000	-15.952041000000	MRO
3186	Sanganeer Airport	Jaipur	JAI		India	IN	26.820772000000	75.801515000000	INR
3187	Emmonak Airport	Alakanuk	EMK		United States	US	62.785000000000	-164.491000000000	USD
3188	Tabora	Tabora	TBO		Tanzania United Republic of	TZ	-5.076667000000	32.831111000000	TZS
3189	Penzance	Penzance	PZE		United Kingdom	GB	50.128056000000	-5.518611000000	GBP
3190	Westray	Westray	WRY		United Kingdom	GB	59.350278000000	-2.950000000000	GBP
3191	Peterborough Rail Station	Peterborough Rail Station	XVH		United Kingdom	GB	52.583333000000	-1.250000000000	GBP
3192	Koszalin	Koszalin	OSZ		Poland	PL	54.050000000000	16.266667000000	PLN
3193	Ouargla	Ouargla	OGX		Algeria	DZ	31.923889000000	5.410556000000	DZD
3194	Bajura	Bajura	BJU		Nepal	NP	29.350000000000	81.300000000000	NPR
3195	Atuona	Atuona	AUQ		French Polynesia	PF	-9.768889000000	-139.011389000000	XPF
3196	Puka Puka	Puka Puka	PKP		French Polynesia	PF	-14.809444000000	-138.812778000000	XPF
3197	Faya	Faya	FYT		Chad	TD	17.933333000000	19.133333000000	XAF
3198	Arrabury	Arrabury	AAB		Australia	AU	-26.750000000000	141.000000000000	AUD
3199	Makemo	Makemo	MKP		French Polynesia	PF	-16.583889000000	-143.658333000000	XPF
3200	San Fernando de Apure	San Fernando de Apure	SFD		Venezuela	VE	7.883333000000	-67.443889000000	VEB
3201	Chignik Lake Apt	Chignik	KCQ		USA	US	56.255556000000	-158.779444000000	USD
3202	Rail (generic) Rail Station (CA)	Rail (generic) Rail Station (CA)	XZR		Canada	CA	46.803611000000	-71.250556000000	CAD
3203	Dubbo	Dubbo	DBO		Australia	AU	-32.218889000000	148.575556000000	AUD
3204	Rangiroa Island	Rangiroa Island	RGI		French Polynesia	PF	-14.954167000000	-147.660833000000	XPF
3205	Kolwezi	Kolwezi	KWZ		Congo Democratic Republic of	CD	-10.765833000000	25.505833000000	CDF
3206	Punta Gorda (US)	Punta Gorda (US)	PGD		USA	US	26.917778000000	-81.995278000000	USD
3207	Quaqtaq	Quaqtaq	YQC		Canada	CA	61.046667000000	-69.618056000000	CAD
3208	Rotterdam The Hague Airport	Rotterdam	RTM		Netherlands	NL	51.948949000000	4.433606000000	EUR
3209	Cleveland Hopkins International Airport	Cleveland	CLE		United States	US	41.410856000000	-81.838210000000	USD
3210	Al Muthana Airport	Baghdad	SDA		Iraq	IQ	33.268460000000	44.230137000000	NID
3211	Fort Smith Municipal Airport	Fort Smith	FSM		USA	US	35.341240000000	-94.358900000000	USD
3212	Manakara	Manakara	WVK		Madagascar	MG	-22.119722000000	48.021667000000	MGA
3213	Harrogate	Harrogate	HRT		United Kingdom	GB	54.050000000000	-1.250000000000	GBP
3214	Thingeyri	Thingeyri	TEY		Iceland	IS	65.870278000000	-23.560000000000	ISK
3215	Dundee Rail Station	Dundee Rail Station	ZDU		United Kingdom	GB	56.466667000000	-2.966667000000	GBP
3216	Santiago del Estero	Santiago del Estero	SDE		Argentina	AR	-27.765556000000	-64.310000000000	ARS
3217	Yecheon	Yecheon	YEC		Korea Republic of	KR	36.625000000000	128.355000000000	KRW
3218	Natuna	Natuna	NTX		Indonesia	ID	3.906111000000	108.387778000000	IDR
3219	Moki	Moki	MJJ		Papua New Guinea	PG	-5.700000000000	145.250000000000	PGK
3220	Santa Ana	Santa Ana (BO)	SBL		Bolivia	BO	-13.762500000000	-65.434722000000	BOB
3221	Coffman Cove	Coffman Cove	KCC		USA	US	56.012500000000	-132.833889000000	USD
3222	Glencoe Rail Station	Glencoe Rail Station	XZC		Canada	CA	42.766667000000	-81.733333000000	CAD
3223	Cote D'Azur Airport	Nice	NCE		France	FR	43.660488000000	7.205232000000	EUR
3224	Palma de Mallorca Airport	Palma Mallorca	PMI		Spain and Canary Islands	ES	39.547654000000	2.730388000000	EUR
3225	Golden Rock Airport	Saint Kitts	SKB		St. Kitts and Nevis	KN	17.310843000000	-62.713970000000	XCD
3226	Siem Reap Airport	Siem Reap	REP		Cambodia	KH	13.408436000000	103.815927000000	KHR
3227	Loudes Airport	Le Puy	LPY		France	FR	45.083332000000	3.766667000000	EUR
3228	Rock Springs Sweetwater County Airport	Rock Springs	RKS		United States	US	41.596390000000	-109.065834000000	USD
3229	Caye Caulker	Caye Caulker	CUK		Belize	BZ	17.735278000000	-88.032500000000	BZD
3230	Ipswich	Ipswich	IPW		United Kingdom	GB	52.033333000000	1.200000000000	GBP
3231	Hedemora Rail Station	Hedemora Rail Station	XXU		Sweden	SE	60.274167000000	15.980556000000	SEK
3232	Trombetas	Trombetas	TMT		Brazil	BR	-1.488611000000	-56.392222000000	BRL
3233	Masvingo	Masvingo	MVZ		Zimbabwe	ZW	-20.055278000000	30.859167000000	ZWD
3234	Tioman	Tioman	TOD		Malaysia	MY	2.819167000000	104.160000000000	MYR
3235	Balimo	Balimo	OPU		Papua New Guinea	PG	-8.051944000000	142.939722000000	PGK
3236	Moundou	Moundou	MQQ		Chad	TD	8.633333000000	16.066667000000	XAF
3237	Exeter Airport	Exeter	EXT		United Kingdom	GB	50.731109000000	-3.410968000000	GBP
3238	Canouan Island Airport	Canouan Island	CIW		Saint Vincent and the Grenadines	VC	12.700000000000	-61.316667000000	XCD
3239	Heydar Aliyev International Airport	Baku	GYD		Azerbaijan	AZ	40.462487000000	50.050390000000	AZM
3240	Lafayette Regional Airport	Lafayette	LFT		United States	US	30.208510000000	-91.993270000000	USD
3241	Bingol	Bingol	BGG		Turkey	TR	38.861389000000	40.592500000000	USD
3242	Burgos	Burgos	RGS		Spain	ES	42.357500000000	-3.620833000000	EUR
3243	Nottingham Rail Station	Nottingham	XNM		United Kingdom	GB	52.969444000000	-1.166667000000	GBP
3244	Gorna Oryahovitsa	Gorna Oryahovitsa	GOZ		Bulgaria	BG	43.151389000000	25.712778000000	EUR
3245	Ankang	Ankang	AKA		China	CN	32.707778000000	108.932222000000	RMB
3246	Farah	Farah	FAH		Afghanistan	AF	32.366111000000	62.165556000000	USD
3247	Bikini Atoll	Bikini Atoll	BII		Marshall Islands	MH	11.583333000000	165.383333000000	USD
3248	Telfer	Telfer	TEF		Australia	AU	-21.700000000000	122.216667000000	AUD
3249	Augusta	Augusta (US) ME	AUG		USA	US	44.318056000000	-69.796944000000	USD
3250	Saarloq Heliport	Saarloq Heliport	QOQ		Greenland	GL	66.166667000000	-53.500000000000	DKK
3251	Qikiqtarjuaq	Qikiqtarjuaq	YVM		Canada	CA	67.545833000000	-64.031389000000	CAD
3252	Asturias Airport	Asturias	OVD		Spain and Canary Islands	ES	43.558910000000	-6.032094000000	EUR
3253	Minneapolis-St. Paul International Airport	Minneapolis	MSP		United States	US	44.883016000000	-93.210922000000	USD
3254	Kalmar Oland Airport	Kalmar	KLR		Sweden	SE	56.685000000000	16.287222000000	SEK
3255	Tirgu Mures Airport	Tirgu Mures	TGM		Romania	RO	46.533333000000	24.533333000000	ROL
3256	Tsiroanomandidy	Tsiroanomandidy	WTS		Madagascar	MG	-18.750000000000	46.050000000000	MGA
3257	Wolverhampton Rail Station	Wolverhampton Rail Station	XVW		United Kingdom	GB	52.600000000000	-2.133333000000	GBP
3258	Cherepovets	Cherepovets	CEE		Russian Federation	RU	59.278056000000	38.022500000000	RUB
3259	Dubai (AE) 00	Dubai	ZJF		United Arab Emirates	AE	24.967778000000	55.035278000000	AED
3260	Lubango	Lubango	SDD		Angola	AO	-14.924722000000	13.575000000000	AOA
3261	W. A. Mozart Airport	Salzburg	SZG			AT	47.791226000000	12.997331000000	EUR
3262	Bristol Airport	Bristol	BRS		United Kingdom	GB	51.386756000000	-2.710659000000	GBP
3263	El Alto Airport	La Paz	LPB		Bolivia	BO	-16.508891000000	-68.176903000000	BOB
3264	Francisco Mendes Airport	Praia	RAI		Cape Verde	CV	14.945321000000	-23.486567000000	CVE
3265	Arecibo	Arecibo	ARE		Puerto Rico	PR	18.450000000000	-66.666667000000	USD
3266	Leon Rail Station	Leon Rail Station	EEU		Spain	ES	42.596111000000	-5.582778000000	EUR
3267	Zaragoza Delicias Rail Station	Zaragoza Delicias Rail Station	XZZ		Spain	ES	41.651389000000	-0.895000000000	EUR
3268	Antalya Airport	Antalya	AYT		Turkey	TR	36.899282000000	30.801349000000	USD
3269	Oita Airport	Oita	OIT		Japan	JP	33.477237000000	131.732362000000	JPY
3270	Magas Airport	Ordzhonikidzevskaya	IGT		Russia	RU	43.322124000000	45.012610000000	RUB
3271	Samburu	Samburu	UAS		Kenya	KE	0.533333000000	37.533333000000	KES
3272	London Paddington Rail Station	London (GB)	QQP		United Kingdom	GB	51.517222000000	-0.177778000000	GBP
3273	Berwick-upon-Tweed Rail Station	Berwick-upon-Tweed Rail Station	XQG		United Kingdom	GB	55.766667000000	-2.000000000000	GBP
3274	Ust-Kuyga	Ust-Kuyga	UKG		Russian Federation	RU	70.010556000000	135.642500000000	RUB
3275	Hengchun	Hengchun	HCN		Chinese Taipei	TW	22.041111000000	120.730278000000	TWD
3276	Mohenjodaro	Mohenjodaro	MJD		Pakistan	PK	27.335278000000	68.143056000000	PKR
3277	Great Keppel Island	Great Keppel Island	GKL		Australia	AU	-23.183333000000	150.950000000000	AUD
3278	Andahuaylas	Andahuaylas	ANS		Peru	PE	-13.706389000000	-73.350278000000	PEN
3279	Roma (US)	Roma (US)	FAL		USA	US	26.586111000000	-99.137500000000	USD
3280	Venetie	Venetie	VEE		USA	US	67.006389000000	-146.378333000000	USD
3281	Colmar	Colmar	CMR		France	FR	48.110278000000	7.359167000000	EUR
3282	London Southend Airport	Southend	SEN		United Kingdom	GB	51.572778000000	0.701389000000	GBP
3283	Portland International Jetport	Portland	PWM		United States	US	43.647492000000	-70.310307000000	USD
3284	Sandane Airport	Sandane	SDN		Norway	NO	61.766666000000	6.216667000000	NOK
3285	San Jose Tobias Bolanos Apt	San Jose	SYQ		Costa Rica	CR	9.957222000000	-84.139722000000	CRC
3286	Fair Isle	Fair Isle	FIE		United Kingdom	GB	59.534722000000	-1.628611000000	GBP
3287	Rail (generic) Rail Station (DE)	Rail (generic) Rail Station (DE)	XZE		Germany	DE	50.000000000000	10.000000000000	EUR
3288	San Rafael	San Rafael	AFA		Argentina	AR	-34.588611000000	-68.402778000000	ARS
3289	Dongying	Dongying	DOY		China	CN	37.507778000000	118.789444000000	RMB
3290	Jiwani	Jiwani	JIW		Pakistan	PK	25.083333000000	61.816667000000	PKR
3291	Freida River	Freida River	FAQ		Papua New Guinea	PG	-4.616667000000	141.958333000000	PGK
3292	Mabuiag Island	Mabuiag Island	UBB		Australia	AU	-9.950000000000	142.183333000000	AUD
3293	Cadillac	Cadillac	CAD		USA	US	44.275833000000	-85.422222000000	USD
3294	Smith Cove	Smith Cove	SCJ		USA	US	55.437500000000	-132.341667000000	USD
3295	Sarnia	Sarnia	YZR		Canada	CA	42.999444000000	-82.308889000000	CAD
3296	Madeira Airport	Funchal	FNC		Portugal	PT	32.693121000000	-16.775635000000	EUR
3297	Chlef Airport	Chlef	CFK		Algeria	DZ	36.212222000000	1.331667000000	DZD
3298	Laishan Airport	Yantai	YNT		China	CN	37.407326000000	121.371105000000	RMB
3299	Chester Airport	Chester	CEG		United Kingdom	GB	53.166668000000	-2.916667000000	GBP
3300	Northern Maine Regional Airport at Presque Isle	Presque Isle	PQI		United States	US	46.685000000000	-68.047500000000	USD
3301	Farafangana	Farafangana	RVA		Madagascar	MG	-22.805278000000	47.820556000000	MGA
3302	Lindau Rail Station	Lindau Rail Station	QII		Germany	DE	47.550000000000	9.683333000000	EUR
3303	Sumy	Sumy	UMY		Ukraine	UA	50.933333000000	34.783333000000	UAH
3304	Shi-quan-He	Shi-quan-He	NGQ		China	CN	32.099722000000	80.053333000000	RMB
3305	Daet	Daet	DTE		Philippines	PH	14.133333000000	122.983333000000	PHP
3306	Gambier Island	Gambier Island	GMR		French Polynesia	PF	-23.080000000000	-134.890278000000	XPF
3307	Arauca	Arauca	AUC		Colombia	CO	7.068889000000	-70.736944000000	COP
3308	Fort Huachuca/Sierra Vista	Fort Huachuca/Sierra Vista	FHU		USA	US	31.588611000000	-110.344444000000	USD
3309	Visalia	Visalia	VIS		USA	US	36.321111000000	-119.395833000000	USD
3310	Albert	Albert	BYF		France	FR	49.970000000000	2.692500000000	EUR
3311	Moshoeshoe International Airport	Maseru	MSU		Lesotho	LS	-29.301389000000	27.505556000000	LSL
3312	Shantou Airport	Shantou	SWA		China	CN	23.430236000000	116.758587000000	RMB
3313	Tyumen Airport	Tyumen	TJM		Russian Federation	RU	57.181828000000	65.350240000000	RUB
3314	Playa del Carmen	Playa del Carmen	PCM		Mexico	MX	20.550000000000	-87.116667000000	MXN
3315	Hilversum Rail Station	Hilversum Rail Station	QYI		Netherlands	NL	52.233333000000	5.166667000000	EUR
3316	Amsterdam Central Rail Station	Amsterdam Central Rail Station	ZYA		Netherlands	NL	52.378889000000	4.900556000000	EUR
3317	Laghouat	Laghouat	LOO		Algeria	DZ	33.764722000000	2.927500000000	DZD
3318	Bellary	Bellary	BEP		India	IN	15.183333000000	76.900000000000	INR
3319	Alice Springs Airport	Alice Springs	ASP		Australia	AU	-23.806667000000	133.902222000000	AUD
3320	Sila	Sila	SIL		Papua New Guinea	PG	-9.116667000000	148.400000000000	PGK
3321	Athens (US)	Athens (US)	AHN		USA	US	33.949444000000	-83.321944000000	USD
3322	Qeqertaq	Qeqertaq	PQT		Greenland	GL	69.996944000000	-51.305000000000	DKK
3323	Sherbrooke	Sherbrooke	YSC		Canada	CA	45.433333000000	-71.683333000000	CAD
3324	Nis Airport	Nis	INI		Republic of Serbia	RS	43.333889000000	21.851667000000	EUR
3325	Changsha Airport	Changsha	CSX		China	CN	28.193336000000	113.214592000000	RMB
3326	Sveg Airport	Sveg	EVG		Sweden	SE	62.033333000000	14.350000000000	SEK
3327	Nosara Beach	Nosara Beach	NOB		Costa Rica	CR	9.976389000000	-85.653056000000	CRC
3328	London Euston Rail Station	London (GB)	QQU		United Kingdom	GB	51.533333000000	-0.133333000000	GBP
3329	Nuremberg Railway Station	Nuremberg Railway Station	ZAQ		Germany	DE	49.447778000000	11.068333000000	EUR
3330	Boussaada	Boussaada	BUJ		Algeria	DZ	35.333333000000	4.200000000000	DZD
3331	Uige	Uige	UGO		Angola	AO	-7.616667000000	15.066667000000	AOA
3332	Savannakhet	Savannakhet	ZVK		Lao People's Democratic Republic	LA	16.560833000000	104.763889000000	LAK
3333	Raiatea Island	Raiatea Island	RFP		French Polynesia	PF	-16.722778000000	-151.465833000000	XPF
3334	Kongolo	Kongolo	KOO		Congo Democratic Republic of	CD	-5.394167000000	26.991111000000	CDF
3335	Marathon	Marathon	MTH		USA	US	24.725833000000	-81.052778000000	USD
3336	Schefferville	Schefferville	YKL		Canada	CA	54.805278000000	-66.805278000000	CAD
3337	Jersey Airport	Jersey	JER		United Kingdom	GB	49.205297000000	-2.194344000000	GBP
3338	Menara Airport	Marrakech	RAK		Morocco	MA	31.601875000000	-8.026902000000	MAD
3339	Glenegedale Airport	Islay	ILY		United Kingdom	GB	55.681946000000	-6.254167000000	GBP
3340	Santa Maria Pub/Capt G Allan Hancock Field	Santa Maria	SMX		United States	US	34.905000000000	-120.457780000000	USD
3341	Comiso	Comiso	CIY		Italy	IT	36.994722000000	14.606944000000	EUR
3342	York Rail Station	York Rail Station	QQY		United Kingdom	GB	53.966667000000	-1.083333000000	GBP
3343	Elista	Elista	ESL		Russian Federation	RU	46.373889000000	44.330833000000	RUB
3344	Anqing	Anqing	AQG		China	CN	30.582500000000	117.050278000000	RMB
3345	Kooddoo Atoll	Kooddoo Atoll	GKK		Maldives	MV	0.733056000000	73.434167000000	MVR
3346	Brampton Island	Brampton Island	BMP		Australia	AU	-20.783333000000	149.233333000000	AUD
3347	Tufi	Tufi	TFI		Papua New Guinea	PG	-9.076389000000	149.320000000000	PGK
3348	Shreveport Barksdale AFB	Shreveport	BAD		USA	US	32.766667000000	-93.816667000000	USD
3349	Ammassivik Heliport	Ammassivik Heliport	QUW		Greenland	GL	60.593889000000	-45.382778000000	DKK
3350	Deer Lake (CA) ON	Deer Lake (CA) ON	YVZ		Canada	CA	52.655278000000	-94.061111000000	CAD
3351	Santander Airport	Santander	SDR		Spain and Canary Islands	ES	43.423086000000	-3.824453000000	EUR
3352	Bujumbura International Airport	Bujumbura	BJM		Burundi	BI	-3.383333000000	29.366667000000	BIF
3353	Guilin Airport	Guilin	KWL		China	CN	25.133333000000	110.316667000000	RMB
3354	Ukhta Airport	Ukhta	UCT		Russia	RU	63.566666000000	53.800000000000	RUB
3355	Besalampy	Besalampy	BPY		Madagascar	MG	-16.741944000000	44.481389000000	MGA
3356	Oban	Oban	OBN		United Kingdom	GB	56.466667000000	-5.400000000000	GBP
3357	Skive Rail Station	Skive	ZKN		Denmark	DK	56.633333000000	9.016667000000	DKK
3358	Sayun	Sayun	GXF		Yemen	YE	15.966111000000	48.788333000000	YER
3359	Buffalo Range	Buffalo Range	BFO		Zimbabwe	ZW	-21.008056000000	31.578611000000	ZWD
3360	Quinhon	Quinhon	UIH		Viet Nam	VN	13.953889000000	109.043333000000	VND
3361	Palm Island	Palm Island	PMK		Australia	AU	-18.755278000000	146.581389000000	AUD
3362	Nioro	Nioro	NIX		Mali	ML	15.236111000000	-9.583333000000	XOF
3363	Oak Harbor	Oak Harbor	ODW		USA	US	48.283333000000	-122.616667000000	USD
3364	Snap Lake	Snap Lake	YNX		Canada	CA	63.593611000000	-110.905278000000	CAD
3365	Vilnius Airport	Vilnius	VNO		Lithuania	LT	54.643079000000	25.279605000000	LTL
3366	Pres Ibanez Airport	Punta Arenas	PUQ		Chile	CL	-53.005357000000	-70.843074000000	CLP
3367	SundsvallHarnosand Airport	Sundsvall	SDL		Sweden	SE	62.521650000000	17.438147000000	SEK
3368	San Miguel	San Miguel	NMG		Panama	PA	8.450000000000	-78.916667000000	PAB
3369	Hannover Bus Station	Hannover Bus Station	HBZ		Germany	DE	52.632778000000	9.736667000000	EUR
3370	Alvdal Rail Station	Alvdal Rail Station	XJA		Norway	NO	62.109444000000	10.638889000000	NOK
3371	Aberdeen Rail Station	Aberdeen Rail Station	ZXA		United Kingdom	GB	57.166667000000	-2.066667000000	GBP
3372	Juara	Juara	JUA		Brazil	BR	-12.833333000000	-58.916667000000	BRL
3373	Oki Island	Oki Island	OKI		Japan	JP	36.181111000000	133.324722000000	JPY
3374	Haiphong	Haiphong	HPH		Viet Nam	VN	20.819444000000	106.725000000000	VND
3375	Kosrae Airport	Kosrae, Caroline Islands	KSA		Micronesia	FM	5.352478000000	162.956603000000	USD
3376	Jackson International Airport	Jackson	JAN		United States	US	32.309896000000	-90.074955000000	USD
3377	Bringeland Airport	Forde	FDE		Norway	NO	61.391780000000	5.762073000000	NOK
3378	Robert Gray  Army Air Field Airport	Killeen	GRK		United States	US	31.061821000000	-97.820915000000	USD
3379	Tupile	Tupile	TUE		Panama	PA	9.250000000000	-78.366667000000	PAB
3380	Grimsby	Grimsby	GSY		United Kingdom	GB	53.583333000000	-0.033333000000	GBP
3381	London Kings Cross Rail Station	London Kings Cross Rail Station	QQK		United Kingdom	GB	51.533333000000	-0.116667000000	GBP
3382	Falkoping Rail Station	Falkoping Rail Station	XYF		Sweden	SE	58.175833000000	13.551667000000	SEK
3383	Talca	Talca	TLX		Chile	CL	-35.433333000000	-71.666667000000	CLP
3384	Zhuhai	Zhuhai	ZUH		China	CN	22.006667000000	113.376111000000	RMB
3385	Palu	Palu	PLW		Indonesia	ID	-0.918611000000	119.909722000000	IDR
3386	Lamap	Lamap	LPM		Vanuatu	VU	-16.457778000000	167.828889000000	VUV
3387	Tingo Maria	Tingo Maria	TGI		Peru	PE	-9.300000000000	-76.016667000000	PEN
3388	Knights Inlet	Knights Inlet	KNV		Canada	CA	50.683333000000	-125.833333000000	CAD
3389	Telegraph Harbour	Telegraph Harbour	YBQ		Canada	CA	48.983333000000	-123.650000000000	CAD
3390	April River	April River	APR		Papua New Guinea	PG	-4.300000000000	142.433333000000	PGK
3391	Sangapi	Sangapi	SGK		Papua New Guinea	PG	-5.083333000000	144.766667000000	PGK
3392	Tasiilaq	Tasiilaq	AGM		Greenland	GL	65.612500000000	-37.618611000000	DKK
3393	Parsons	Parsons	PPF		USA	US	37.333333000000	-95.500000000000	USD
3394	Rankin Inlet	Rankin Inlet	YRT		Canada	CA	62.811389000000	-92.115833000000	CAD
3395	Lamar Field	Lamar	LAA		United States	US	38.068611000000	-102.690278000000	USD
3396	Philip S.W. Goldson International Airport	Belize City	BZE		Belize	BZ	17.539167000000	-88.308333000000	BZD
3397	Jackson Field	Port Moresby	POM		Papua New Guinea	PG	-9.444308000000	147.214469000000	PGK
3398	Drake Bay	Drake Bay	DRK		Costa Rica	CR	8.719167000000	-83.641944000000	CRC
3399	Farnborough	Farnborough	FAB		United Kingdom	GB	51.275833000000	-0.776389000000	GBP
3400	Stjordal Rail Station	Stjordal Rail Station	XUU		Norway	NO	63.471111000000	10.912500000000	NOK
3401	Perito Moreno	Perito Moreno	PMQ		Argentina	AR	-46.538056000000	-70.978611000000	ARS
3402	Okinawa Naha Apt	Okinawa	OKA		Japan	JP	26.195833000000	127.645833000000	JPY
3403	Jakarta Halim Perdana Kusuma Apt	Jakarta	HLP		Indonesia	ID	-6.266667000000	106.891111000000	IDR
3404	Kagi	Kagi	KGW		Papua New Guinea	PG	-9.050000000000	146.833333000000	PGK
3405	Mitu	Mitu	MVP		Colombia	CO	1.253611000000	-70.233889000000	COP
3406	Winston-Salem	Winston-Salem	INT		USA	US	36.137500000000	-80.225278000000	USD
3407	Grimsby Rail Station	Grimsby Rail Station	XGY		Canada	CA	43.196389000000	-79.558333000000	CAD
3408	Friedrichshafen Airport	Friedrichshafen	FDH		Germany	DE	47.672775000000	9.523482000000	EUR
3409	Pohnpei Airport	Pohnpei, Caroline Islands	PNI		Micronesia	FM	6.980947000000	158.203343000000	USD
3410	Ronaldsway Airport	Isle Of Man	IOM		United Kingdom	GB	54.086769000000	-4.634730000000	GBP
3411	Durham Tees Valley Airport	Durham Tees Valley	MME		United Kingdom	GB	54.512226000000	-1.434013000000	GBP
3412	Manzanillo Airport	Manzanillo	ZLO		Mexico	MX	19.113333000000	-104.350556000000	MXN
3413	A.B. Won Pat International Airport	Guam	GUM		Guam	GU	13.492787000000	144.804849000000	USD
3414	Wick Airport	Wick	WIC		United Kingdom	GB	58.456944000000	-3.086667000000	GBP
3415	Dillingham Airport	Dillingham	DLG		United States	US	59.042460000000	-158.514720000000	USD
3416	Neghelli	Neghelli	EGL		Ethiopia	ET	5.283333000000	39.700000000000	ETB
3417	Ipswich	Ipswich	IPW		United Kingdom	GB	52.033333000000	1.200000000000	GBP
3418	Antwerp Central Rail Station	Antwerp Central Rail Station	ZWE		Belgium	BE	51.217778000000	4.420833000000	EUR
3419	Chersky	Chersky	CYX		Russian Federation	RU	68.741667000000	161.337500000000	RUB
3420	Madurai	Madurai	IXM		India	IN	9.834444000000	78.093333000000	INR
3421	Bankstown	Bankstown	BWU		Australia	AU	-33.916667000000	150.983333000000	AUD
3422	Tapini	Tapini	TPI		Papua New Guinea	PG	-8.366667000000	146.983333000000	PGK
3423	Bloomington	Bloomington	BMG		USA	US	39.142500000000	86.615278000000	USD
3424	Russian Mission	Russian Mission	RSH		USA	US	61.778333000000	-161.319722000000	USD
3425	Nea Anchialos Airport	Volos	VOL		Greece	GR	39.383333000000	22.931111000000	EUR
3426	Campeche International Airport	Campeche	CPE		Mexico	MX	19.835000000000	-90.509444000000	MXN
3427	Chiang Rai Airport	Chiang Rai	CEI		Thailand	TH	19.954608000000	99.878811000000	THB
3428	Le Bourget Airport	Paris	LBG		France	FR	48.971943000000	2.442500000000	EUR
3429	San Juan Isla Grande Apt	San Juan (PR)	SIG		Puerto Rico	PR	18.456944000000	-66.098056000000	USD
3430	Milan Rogoredo Rail Stn	Milan Rogoredo Rail Stn	IMR		Italy	IT	45.433333000000	9.238333000000	EUR
3431	Harnosand Rail Station	Harnosand Rail Station	XYZ		Sweden	SE	62.635278000000	17.928611000000	SEK
3432	Montevideo Bus Station	Montevideo Bus Station	VDT		Uruguay	UY	-34.893611000000	-56.166667000000	UYU
3433	Chelinda	Chelinda	CEH		Malawi	MW	-10.557222000000	33.798056000000	MWK
3434	San Fernando	San Fernando	SFE		Philippines	PH	16.595556000000	120.303333000000	PHP
3435	Naracoorte	Naracoorte	NAC		Australia	AU	-36.980556000000	140.723333000000	AUD
3436	Ilorin	Ilorin	ILR		Nigeria	NG	8.440278000000	4.493889000000	NGN
3437	Mankato Municipal Apt	Mankato	MKT		USA	US	44.150000000000	-93.983333000000	USD
3438	Poplar Hill	Poplar Hill	YHP		Canada	CA	52.113333000000	-94.255556000000	CAD
3439	Mytilene Airport	Mytilene	MJT		Greece	GR	39.056111000000	26.599444000000	EUR
3440	Kangerlussuaq Airport	Kangerlussuaq	SFJ		Greenland	GL	67.012222000000	-50.719722000000	DKK
3441	Sharjah Airport	Sharjah	SHJ		United Arab Emirates	AE	25.320873000000	55.520290000000	AED
3442	Jack Mc Namara Field Airport	Crescent City	CEC		United States	US	41.780000000000	-124.235830000000	USD
3443	Coll	Coll	COL		United Kingdom	GB	56.601944000000	-6.617778000000	GBP
3444	Burgos Bus Station	Burgos Bus Station	XJU		Spain	ES	42.337778000000	-3.701111000000	EUR
3445	Araxa	Araxa	AAX		Brazil	BR	-19.563333000000	-46.960278000000	BRL
3446	Igrim	Igrim	IRM		Russian Federation	RU	63.197222000000	64.441389000000	RUB
3447	Rukumkot	Rukumkot	RUK		Nepal	NP	28.950000000000	82.266667000000	NPR
3448	Istanbul Ataturk Airport	Istanbul	IST		Turkey	TR	40.976667000000	28.815278000000	USD
3449	Sao Paulo/Congonhas Airport	Sao Paulo	CGH		Brazil	BR	-23.626902000000	-46.659556000000	BRL
3450	Sorkjosen Airport	Sorkjosen	SOJ		Norway	NO	69.783330000000	20.933332000000	NOK
3451	Mulatupo	Mulatupo	MPP		Panama	PA	8.946389000000	-77.750833000000	PAB
3452	Norderney	Norderney	NRD		Germany	DE	53.716667000000	7.233333000000	EUR
3453	Snartemo Rail Station	Snartemo Rail Station	XUS		Norway	NO	58.331944000000	7.211667000000	NOK
3454	Lages	Lages	LAJ		Brazil	BR	-27.800000000000	-50.316667000000	BRL
3455	Sovetsky	Sovetsky	OVS		Russian Federation	RU	61.325278000000	63.603611000000	RUB
3456	Illaga	Illaga	ILA		Indonesia	ID	-3.833333000000	137.583333000000	IDR
3457	Faaite	Faaite	FAC		French Polynesia	PF	-16.686667000000	-145.329722000000	XPF
3458	Ua Pou	Ua Pou	UAP		French Polynesia	PF	-9.347500000000	-140.079722000000	XPF
3459	Bozeman	Bozeman	BZN		USA	US	45.777500000000	-111.153056000000	USD
3460	Schenectady	Schenectady	SCH		USA	US	42.850000000000	-73.616667000000	USD
3461	Sandspit	Sandspit	YZP		Canada	CA	53.254444000000	-131.813889000000	CAD
3462	Kerikeri	Kerikeri	KKE		New Zealand	NZ	-35.257778000000	173.911944000000	NZD
3463	Nuqui	Nuqui	NQU		Colombia	CO	5.710000000000	-77.262778000000	COP
3464	Kinston	Kinston	ISO		USA	US	35.333333000000	-77.616667000000	USD
3465	Ingersoll Rail Station	Ingersoll Rail Station	XIB		Canada	CA	43.033333000000	-80.883333000000	CAD
3466	Bourgas Airport	Bourgas	BOJ		Bulgaria	BG	42.416667000000	27.283333000000	EUR
3467	St Mawgan Airport	Newquay	NQY		United Kingdom	GB	50.437450000000	-4.997922000000	GBP
3468	Eduardo Gomes International Airport	Manaus	MAO		Brazil	BR	-3.031327000000	-60.046092000000	BRL
3469	Joshkar-Ola Airport	Joshkar-Ola	JOK		Russia	RU	56.716667000000	47.900000000000	RUB
3470	Hermosillo	Hermosillo	HMO		Mexico	MX	29.095833000000	-111.047778000000	MXN
3471	Foula	Foula	FOA		United Kingdom	GB	60.122222000000	-2.053611000000	GBP
3472	Rost	Rost	RET		Norway	NO	67.527500000000	12.103056000000	NOK
3473	Newport Rail Station	Newport Rail Station	XNE		United Kingdom	GB	51.583333000000	-3.000000000000	GBP
3474	Oslo Central Rail Station	Oslo	XZO		Norway	NO	59.910556000000	10.752778000000	NOK
3475	Uberaba	Uberaba	UBA		Brazil	BR	-19.765000000000	-47.964722000000	BRL
3476	Ulaangom	Ulaangom	ULO		Mongolia	MN	49.970556000000	92.081111000000	MNT
3477	Mamuju	Mamuju	MJU		Indonesia	ID	-2.588333000000	119.027778000000	IDR
3478	Kerema	Kerema	KMA		Papua New Guinea	PG	-7.963611000000	145.771389000000	PGK
3479	Cuenca	Cuenca	CUE		Ecuador	EC	-2.889444000000	-78.984444000000	USD
3480	New London/Groton	New London/Groton	GON		USA	US	41.333333000000	-72.050000000000	USD
3481	Westsound	Westsound	WSX		USA	US	48.618889000000	-122.957500000000	USD
3482	Mitchell	Mitchell	MHE		USA	US	43.766667000000	-98.033333000000	USD
3483	Port Hope Simpson	Port Hope Simpson	YHA		Canada	CA	52.528333000000	-56.284722000000	CAD
3484	Ufa Airport	Ufa	UFA		Russian Federation	RU	54.565403000000	55.884543000000	RUB
3485	John Wayne Airport	Santa Ana	SNA		United States	US	33.680201000000	-117.860538000000	USD
3486	Murmansk Airport	Murmansk	MMK		Russian Federation	RU	68.785095000000	32.759155000000	RUB
3487	Mary	Mary	MYP		Turkmenistan	TM	37.600000000000	61.833333000000	TMM
3488	Shetland Islands Lerwick/Tingwall Apt	Shetland Islands	LWK		United Kingdom	GB	60.192222000000	-1.243611000000	GBP
3489	Manchester Piccadilly Rail Station	Manchester (GB)	QQM		United Kingdom	GB	53.466667000000	-2.233333000000	GBP
3490	Evensk	Evensk	SWV		Russian Federation	RU	61.921389000000	159.229722000000	RUB
3491	Chizhou	Chizhou	JUH		China	CN	30.740278000000	117.686667000000	RMB
3492	Tirinkot	Tirinkot	TII		Afghanistan	AF	32.866667000000	65.633333000000	USD
3493	Great Barrier Island	Great Barrier Island	GBZ		New Zealand	NZ	-36.166667000000	175.333333000000	NZD
3494	Yasawa Island	Yasawa Island	YAS		Fiji	FJ	-16.759722000000	177.546111000000	FJD
3495	Hobbs Lea County Apt	Hobbs	HOB		USA	US	32.683333000000	-103.216667000000	USD
3496	Prince George Rail Station	Prince George	XDV		Canada	CA	53.921667000000	-122.753056000000	CAD
3497	Peretola Airport	Florence	FLR		Italy	IT	43.802126000000	11.201989000000	EUR
3498	Setif Airport	Setif	QSF		Algeria	DZ	36.181389000000	5.331111000000	DZD
3499	Taitung Airport	Taitung	TTT		Republic of China Taiwan	TW	22.750000000000	121.100000000000	TWD
3500	Kursk Airport	Kursk	URS		Russia	RU	51.750000000000	36.266666000000	RUB
3501	Jimma	Jimma	JIM		Ethiopia	ET	7.662778000000	36.818056000000	ETB
3502	Forres	Forres	FSS		United Kingdom	GB	57.650000000000	-3.566667000000	GBP
3503	Braintree	Braintree	WXF		United Kingdom	GB	51.966667000000	0.516667000000	GBP
3504	Frankfurt Hauptbahnhof Rail Station	Frankfurt	ZRB		Germany	DE	50.106667000000	8.663056000000	EUR
3505	Arvaikheer	Arvaikheer	AVK		Mongolia	MN	46.266667000000	102.783333000000	MNT
3506	Hanimaadhoo	Hanimaadhoo	HAQ		Maldives	MV	6.746389000000	73.168611000000	MVR
3507	Dodoima	Dodoima	DDM		Papua New Guinea	PG	-8.750000000000	147.450000000000	PGK
3508	Wapolu	Wapolu	WBC		Papua New Guinea	PG	-9.316667000000	150.350000000000	PGK
3509	St Louis Bi-State Parks Airport	St Louis	CPS		USA	US	38.566667000000	-90.166667000000	USD
3510	Spencer	Spencer	SPW		USA	US	43.166667000000	-95.183333000000	USD
3511	Milwaukee Rail Station	Milwaukee	ZML		USA	US	42.952778000000	-87.902778000000	USD
3512	Dyce Airport	Aberdeen	ABZ		United Kingdom	GB	57.200253000000	-2.204186000000	GBP
3513	Cozumel Airport	Cozumel	CZM		Mexico	MX	20.511200000000	-86.930462000000	MXN
3514	Sydney (Kingsford Smith) Airport	Sydney	SYD		Australia	AU	-33.932922000000	151.179898000000	AUD
3515	Pico Island Airport	Pico Island (Azores)	PIX		Portugal	PT	38.466667000000	-28.300000000000	EUR
3516	Ciudad Obregon	Ciudad Obregon	CEN		Mexico	MX	27.392778000000	-109.833056000000	MXN
3517	Papa Stour	Papa Stour	PSV		United Kingdom	GB	60.321944000000	-1.693333000000	GBP
3518	Basel Bad Rail Station	Basel/Mulhouse	ZBA		Switzerland	CH	47.567778000000	7.608333000000	CHF
3519	Sena Madureira	Sena Madureira	ZMD		Brazil	BR	-9.066667000000	-68.666667000000	BRL
3520	Xichang	Xichang	XIC		China	CN	27.989167000000	102.184444000000	RMB
3521	Nabire	Nabire	NBX		Indonesia	ID	-3.368056000000	135.496667000000	IDR
3522	Glasgow International Airport	Glasgow	GLA		United Kingdom	GB	55.864213000000	-4.431782000000	GBP
3523	Gen Mariano Escobedo Airport	Monterrey	MTY		Mexico	MX	25.776569000000	-100.114395000000	MXN
3524	Saipan International Airport	Saipan	SPN		Northern Mariana Islands	MP	15.122178000000	145.723257000000	USD
3525	Dane County Regional Truax Field	Madison	MSN		United States	US	43.136375000000	-89.346500000000	USD
3526	Gode	Gode	GDE		Ethiopia	ET	5.935000000000	43.578611000000	ETB
3527	Shoreham By Sea	Shoreham By Sea	ESH		United Kingdom	GB	50.835556000000	-0.297222000000	GBP
3528	Northallerton Rail Station	Northallerton Rail Station	XNO		United Kingdom	GB	54.333333000000	-1.433333000000	GBP
3529	Koblenz Bus Station	Koblenz Bus Station	ZNV		Germany	DE	50.350278000000	7.590278000000	EUR
3530	Tripoli (LB)	Tripoli (LB)	KYE		Lebanon	LB	34.586111000000	36.002778000000	LBP
3531	Inhambane	Inhambane	INH		Mozambique	MZ	-23.876389000000	35.408611000000	MZM
3532	Sarmi	Sarmi	ZRM		Indonesia	ID	-1.883333000000	138.766667000000	IDR
3533	Richmond (AU)	Richmond (AU)	RCM		Australia	AU	-20.701389000000	143.114167000000	AUD
3534	Kenieba	Kenieba	KNZ		Mali	ML	12.833333000000	-11.250000000000	XOF
3535	Muscle Shoals	Muscle Shoals	MSL		USA	US	34.746389000000	-87.610000000000	USD
3536	Kitkatla	Kitkatla	YKK		Canada	CA	53.000000000000	-130.000000000000	CAD
3537	Goulburn Island	Goulburn Island	GBL		Australia	AU	-11.666667000000	133.416667000000	AUD
3538	Rail (generic) Rail Station	Rail (generic) Rail Station	XZX		Australia	AU	-33.916667000000	151.166667000000	AUD
3539	Wellsville	Wellsville	ELZ		USA	US	42.116667000000	-77.933333000000	USD
3540	Pilot Point Ugashik Bay Apt	Pilot Point	UGB		USA	US	57.424722000000	-157.744722000000	USD
3541	Pula Airport	Pula	PUY		Croatia	HR	44.891667000000	13.923611000000	EUR
3542	Libreville Airport	Libreville	LBV		Gabon	GA	0.456963000000	9.409852000000	XAF
3543	Fuzhou Airport	Fuzhou	FOC		China	CN	25.931231000000	119.669230000000	RMB
3544	St. Mary's Airport	Isles Of Scilly	ISC		United Kingdom	GB	49.913334000000	-6.291667000000	GBP
3545	 Siegerland Airport	Siegen	SGE		Germany	DE	50.850000000000	8.000000000000	EUR
3546	Lydd	Lydd	LYX		United Kingdom	GB	50.956111000000	0.939167000000	GBP
3547	London Ebbsfleet Intl Rail Station	London (GB)	XQE		United Kingdom	GB	51.443056000000	0.321111000000	GBP
3548	Gabala	Gabala	GBB		Azerbaijan	AZ	40.809167000000	47.725000000000	AZM
3549	Asyut	Asyut	ATZ		Egypt	EG	27.046389000000	31.011944000000	EGP
3550	Tete	Tete	TET		Mozambique	MZ	-16.104722000000	33.640278000000	MZM
3551	Senggo	Senggo	ZEG		Indonesia	ID	-5.983333000000	139.366667000000	IDR
3552	Rabaraba	Rabaraba	RBP		Papua New Guinea	PG	-9.983333000000	149.833333000000	PGK
3553	Zaragoza Delicias Rail Station	Zaragoza Delicias Rail Station	XZZ		Spain	ES	41.651389000000	-0.895000000000	EUR
3554	Resende	Resende	REZ		Brazil	BR	-22.478056000000	-44.481111000000	BRL
3555	Cuamba	Cuamba	FXO		Mozambique	MZ	-14.815278000000	36.530556000000	MZM
3556	Wagethe	Wagethe	WET		Indonesia	ID	-4.050000000000	136.266667000000	IDR
3557	Puas	Puas	PUA		Papua New Guinea	PG	-2.400000000000	150.233333000000	PGK
3558	Oyem	Oyem	OYE		Gabon	GA	1.543056000000	11.581389000000	XAF
3559	Orlando Herndon Apt	Orlando	ORL		USA	US	28.546111000000	-81.331667000000	USD
3560	Peace River	Peace River	YPE		Canada	CA	56.226944000000	-117.447222000000	CAD
3561	Flora Valley	Flora Valley	FVL		Australia	AU	-18.283333000000	128.416667000000	AUD
3562	Helicopter Scenic	Helicopter Scenic	XXH		New Zealand	NZ	-39.869444000000	176.769444000000	NZD
3563	Elim	Elim	ELI		USA	US	64.615556000000	-162.270278000000	USD
3564	Lake Tahoe	Lake Tahoe	TVL		USA	US	38.883333000000	-120.000000000000	USD
3565	Schenectady Rail Station	Schenectady Rail Station	ZZM		USA	US	42.850000000000	-73.983333000000	USD
3566	Grantley Adams International Airport	Bridgetown	BGI		Barbados	BB	13.080732000000	-59.487835000000	BBD
3567	Kuantan Airport	Kuantan	KUA		Malaysia	MY	3.780765000000	103.215182000000	MYR
3568	Florence Regional Airport	Florence	FLO		United States	US	34.188890000000	-79.724440000000	USD
3569	Kebri Dehar	Kebri Dehar	ABK		Ethiopia	ET	6.733889000000	44.255278000000	ETB
3570	Land's End	Land's End	LEQ		United Kingdom	GB	50.102778000000	-5.670556000000	GBP
3571	Ylivieska	Ylivieska	YLI		Finland	FI	64.054444000000	24.728889000000	EUR
3572	Villa Mercedes	Villa Mercedes	VME		Argentina	AR	-33.725278000000	-65.378056000000	ARS
3573	East London	East London	ELS		South Africa	ZA	-33.035556000000	27.825833000000	ZAR
3574	Wamena	Wamena	WMX		Indonesia	ID	-4.100000000000	138.953611000000	IDR
3575	Pukarua	Pukarua	PUK		French Polynesia	PF	-18.296111000000	-137.015833000000	XPF
3576	Kaduna	Kaduna	KAD		Nigeria	NG	10.696111000000	7.320000000000	NGN
3577	Marshall (US) MN	Marshall (US) MN	MML		USA	US	44.444167000000	-95.820000000000	USD
3578	Pakuashipi	Pakuashipi	YIF		Canada	CA	51.210000000000	-58.657500000000	CAD
3579	Maastricht/Aachen Airport	Maastricht	MST		Netherlands	NL	50.915619000000	5.768827000000	EUR
3580	Alvarez International Airport	Acapulco	ACA		Mexico	MX	16.762403000000	-99.754592000000	MXN
3581	Brisbane Airport	Brisbane	BNE		Australia	AU	-27.403031000000	153.109058000000	AUD
3582	Elko Regional Airport	Elko	EKO		United States	US	40.823890000000	-115.789720000000	USD
3583	Coventry	Coventry	CVT		United Kingdom	GB	52.369722000000	-1.479722000000	GBP
3584	North Ronaldsay	North Ronaldsay	NRL		United Kingdom	GB	59.367500000000	-2.434444000000	GBP
3585	Trier Rail Station	Trier Rail Station	ZQF		Germany	DE	49.756389000000	6.652222000000	EUR
3586	El Golea	El Golea	ELG		Algeria	DZ	30.581667000000	2.861667000000	DZD
3587	Pretoria	Pretoria (ZA) 00	WKF		South Africa	ZA	-25.830000000000	28.222500000000	ZAR
3588	Ahe	Ahe	AHE		French Polynesia	PF	-14.428056000000	-146.256944000000	XPF
3589	Nyngan	Nyngan	NYN		Australia	AU	-31.550000000000	147.183333000000	AUD
3590	Salinas	Salinas	SNC		Ecuador	EC	-2.205000000000	-80.988889000000	USD
3591	Keewaywin	Keewaywin	KEW		Canada	CA	52.992222000000	-92.838889000000	CAD
3592	Cat Lake	Cat Lake	YAC		Canada	CA	51.727778000000	-91.827500000000	CAD
3593	Irkutsk Airport	Irkutsk	IKT		Russian Federation	RU	52.273309000000	104.356071000000	RUB
3594	Abuja International Airport	Abuja	ABV		Nigeria	NG	9.004614000000	7.270447000000	NGN
3595	Luang Prabang Airport	Luang Prabang	LPQ		Lao People's Democratic Republic	LA	19.897055000000	102.163709000000	LAK
3596	Abilene Regional Airport	Abilene	ABI		United States	US	32.409443000000	-99.679726000000	USD
3597	Ukunda	Ukunda	UKA		Kenya	KE	-4.296667000000	39.571389000000	KES
3758	Barquisimeto	Barquisimeto	BRM		Venezuela	VE	10.042778000000	-69.358611000000	VEB
3598	Shetland Islands Scatsta Apt	Shetland Islands	SCS		United Kingdom	GB	60.433333000000	-1.283333000000	GBP
3599	Alvesta Rail Station	Alvesta Rail Station	XXA		Sweden	SE	56.898889000000	14.557778000000	SEK
3600	Santarem	Santarem	STM		Brazil	BR	-2.422500000000	-54.792778000000	BRL
3601	Yancheng	Yancheng	YNZ		China	CN	33.426111000000	120.203056000000	RMB
3602	Ailuk Island	Ailuk Island	AIM		Marshall Islands	MH	10.200000000000	169.983333000000	USD
3603	Rotuma Island	Rotuma Island	RTA		Fiji	FJ	-12.482778000000	177.071667000000	FJD
3604	Moanda	Moanda	MFF		Gabon	GA	-1.536944000000	13.270833000000	XAF
3605	Qaanaaq	Qaanaaq	NAQ		Greenland	GL	77.488611000000	-69.387778000000	DKK
3606	La Tuque	La Tuque	YLQ		Canada	CA	47.408889000000	-72.789167000000	CAD
3607	Napoca Airport	Cluj	CLJ		Romania	RO	46.782061000000	23.687014000000	ROL
3608	Kotoka Airport	Accra	ACC		Ghana	GH	5.607370000000	-0.171769000000	GHC
3609	Mahmud Badaruddin Ii Airport	Palembang	PLM		Indonesia	ID	-2.900146000000	104.698607000000	IDR
3610	Barkley Regional Airport	West Paducah	PAH		United States	US	37.061110000000	-88.772500000000	USD
3611	Cuxhaven	Cuxhaven	FCN		Germany	DE	53.767778000000	8.658611000000	EUR
3612	Ski Rail Station	Ski Rail Station	YVS		Norway	NO	59.720833000000	10.834167000000	NOK
3613	Al Kharj	Al Kharj	AKH		Saudi Arabia	SA	24.063333000000	47.580556000000	SAR
3614	Keetmanshoop	Keetmanshoop	KMP		Namibia	NA	-26.533333000000	18.100000000000	NAD
3615	Tandag	Tandag	TDG		Philippines	PH	9.072222000000	126.171389000000	PHP
3616	Doncaster Sheffield Airport	Doncaster	DSA		United Kingdom	GB	53.481004000000	-1.011550000000	GBP
3617	Loreto Airport	Loreto	LTO		Mexico	MX	25.983333000000	-111.350000000000	MXN
3618	Faaa Airport	Papeete	PPT		French Polynesia	PF	-17.559629000000	-149.609375000000	XPF
3619	Worcester Regional Airport	Worcester	ORH		United States	US	42.269170000000	-71.874440000000	USD
3620	Neumunster	Neumunster	EUM		Germany	DE	54.079722000000	9.941944000000	EUR
3621	Berne Rail Station	Berne	ZDJ		Switzerland	CH	46.919444000000	7.500000000000	CHF
3622	Mitspeh Ramon	Mitspeh Ramon	MIP		Israel	IL	30.650000000000	34.800000000000	ILS
3623	Karasburg	Karasburg	KAS		Namibia	NA	28.029722000000	18.738611000000	NAD
3624	Sahabat 16	Sahabat 16	SXS		Malaysia	MY	5.089722000000	119.091667000000	MYR
3625	Chillan	Chillan	YAI		Chile	CL	-36.566667000000	-72.033333000000	CLP
3626	Swakopmund Airport	Swakopmund	SWP		Namibia	NA	-22.666667000000	14.566667000000	NAD
3627	Balalae	Balalae	BAS		Solomon Islands	SB	-6.973889000000	155.885833000000	SBD
3628	Sauren	Sauren	SXW		Papua New Guinea	PG	-5.969444000000	148.952778000000	PGK
3629	Amook	Amook	AOS		USA	US	57.471111000000	-153.815556000000	USD
3630	Narsaq Kujalleq Heliport	Narsaq Kujalleq Heliport	QFN		Greenland	GL	60.004444000000	-44.655278000000	DKK
3631	Big Trout Lake	Big Trout Lake	YTL		Canada	CA	53.817500000000	-89.896667000000	CAD
3632	Iokea	Iokea	IOK		Papua New Guinea	PG	-8.400000000000	146.266667000000	PGK
3633	Guayaramerin	Guayaramerin	GYA		Bolivia	BO	-10.817778000000	-65.347222000000	BOB
3634	Healy Lake	Healy Lake	HKB		USA	US	63.867500000000	-148.970278000000	USD
3635	Moncton Rail Station	Moncton	XDP		Canada	CA	46.083611000000	-64.785556000000	CAD
3636	Kittila Airport	Kittila	KTT		Finland	FI	67.695949000000	24.859027000000	EUR
3637	Quebec City Jean Lesage International Airport	Quebec	YQB		Canada	CA	46.792037000000	-71.383388000000	CAD
3638	King Hussein International Airport	Aqaba	AQJ		Jordan	JO	29.610074000000	35.021511000000	JOD
3639	Augusta Regional At Bush Field	Augusta	AGS		United States	US	33.373665000000	-81.973434000000	USD
3640	Lake Manyara	Lake Manyara	LKY		Tanzania United Republic of	TZ	-3.375556000000	35.818056000000	TZS
3641	Land's End	Land's End	LEQ		United Kingdom	GB	50.102778000000	-5.670556000000	GBP
3642	Bjerka Rail Station	Bjerka Rail Station	ZMZ		Norway	NO	66.149444000000	13.831667000000	NOK
3643	Abu Dhabi Bus Station	Abu Dhabi Bus Station	ZVJ		United Arab Emirates	AE	24.470000000000	54.330000000000	AED
3644	Menongue	Menongue	SPP		Angola	AO	-14.658611000000	17.721389000000	AOA
3645	Barcaldine	Barcaldine	BCI		Australia	AU	-23.560833000000	145.304167000000	AUD
3646	Pukarua	Pukarua	PUK		French Polynesia	PF	-18.296111000000	-137.015833000000	XPF
3647	Port Harcourt City	Port Harcourt City	PHG		Nigeria	NG	4.845278000000	7.021111000000	NGN
3648	Northway	Northway	ORT		USA	US	62.950000000000	-141.950000000000	USD
3649	Inukjuak	Inukjuak	YPH		Canada	CA	58.471111000000	-78.078333000000	CAD
3650	Maastricht/Aachen Airport	Maastricht	MST		Netherlands	NL	50.915619000000	5.768827000000	EUR
3651	Cincinnati/Northern Kentucky Airport	Cincinnati	CVG		United States	US	39.055500000000	-84.661450000000	USD
3652	Talaveral La Real Airport	Badajoz	BJZ		Spain and Canary Islands	ES	38.891666000000	-6.820000000000	EUR
3653	Phoenix-Mesa-Gateway Airport	Phoenix	AZA		United States	US	33.307777000000	-111.655556000000	USD
3654	Coventry	Coventry	CVT		United Kingdom	GB	52.369722000000	-1.479722000000	GBP
3655	North Ronaldsay	North Ronaldsay	NRL		United Kingdom	GB	59.367500000000	-2.434444000000	GBP
3656	Izhevsk	Izhevsk	IJK		Russian Federation	RU	56.829167000000	53.457778000000	RUB
3657	Beihai	Beihai	BHY		China	CN	21.539444000000	109.293889000000	RMB
3658	Khajuraho	Khajuraho	HJR		India	IN	24.817222000000	79.918611000000	INR
3659	Ahe	Ahe	AHE		French Polynesia	PF	-14.428056000000	-146.256944000000	XPF
3660	Rockhampton	Rockhampton	ROK		Australia	AU	-23.381944000000	150.475278000000	AUD
3661	Bamenda	Bamenda	BPC		Cameroon	CM	6.050000000000	10.116667000000	XAF
3662	Lopez Island	Lopez Island	LPS		USA	US	48.483333000000	-122.937778000000	USD
3663	Fredericton	Fredericton	YFC		Canada	CA	45.868889000000	-66.530000000000	CAD
3664	Souda Airport	Chania	CHQ		Greece	GR	35.540200000000	24.140374000000	EUR
3665	Binghamton Airport	Binghamton	BGM		United States	US	42.208533000000	-75.982944000000	USD
3666	Hof Airport	Hof	HOQ		Germany	DE	50.289165000000	11.862222000000	EUR
3667	Modesto City Co-Harry Sham Field	Modesto	MOD		United States	US	37.626945000000	-120.955280000000	USD
3668	Sindal	Sindal	CNL		Denmark	DK	57.503611000000	10.229444000000	DKK
3669	Siirt	Siirt	SXZ		Turkey	TR	37.980556000000	41.838889000000	USD
3670	Caravelas	Caravelas	CRQ		Brazil	BR	-17.650000000000	-39.250000000000	BRL
3671	Liping	Liping	HZH		China	CN	26.323056000000	109.151667000000	RMB
3672	Zhob	Zhob	PZH		Pakistan	PK	31.358333000000	69.463611000000	PKR
3673	Hughenden	Hughenden	HGD		Australia	AU	-20.813056000000	144.225278000000	AUD
3674	Wipim	Wipim	WPM		Papua New Guinea	PG	-8.750000000000	142.850000000000	PGK
3675	Delta Junction	Delta Junction	DJN		USA	US	64.033333000000	-145.683333000000	USD
3676	Fort Leonard Wood	Fort Leonard Wood	TBN		USA	US	37.741667000000	-92.140833000000	USD
3677	Telluride Bus Station	Telluride Bus Station	ZTL		USA	US	37.938056000000	-107.813889000000	USD
3678	Auckland Airport	Auckland	AKL		New Zealand	NZ	-37.004786000000	174.783524000000	NZD
3679	Kansai International Airport	Osaka	KIX		Japan	JP	34.435330000000	135.243977000000	JPY
3680	Kithira Airport	Kithira	KIT		Greece	GR	36.291668000000	23.025000000000	EUR
3681	Uruapan	Uruapan	UPN		Mexico	MX	19.396667000000	-102.039167000000	MXN
3682	Milton Keynes	Milton Keynes	KYN		United Kingdom	GB	52.033333000000	-0.700000000000	GBP
3683	Salisbury Rail Station	Salisbury Rail Station	XSR		United Kingdom	GB	51.083333000000	-1.800000000000	GBP
3684	San Martin de Los Andes	San Martin de Los Andes	CPC		Argentina	AR	-40.075278000000	-71.137222000000	ARS
3685	Gunsan (KR) 00	Gunsan (KR) 00	KUZ		Korea Republic of	KR	65.863889000000	-36.995556000000	KRW
3686	Alor Island	Alor Island	ARD		Indonesia	ID	-8.250000000000	124.750000000000	IDR
3687	Manchester Airport	Manchester	MAN		United Kingdom	GB	53.362908000000	-2.273354000000	GBP
3688	Toluca Airport	Toluca	TLC		Mexico	MX	19.283333000000	-99.666667000000	MXN
3689	Mannheim Airport	Mannheim	MHG		Germany	DE	49.476578000000	8.521081000000	EUR
3690	Tapachula	Tapachula	TAP		Mexico	MX	14.794444000000	-92.370000000000	MXN
3691	Leipzig/Halle Rail Station	Leipzig/Halle Rail Station	XIT		Germany	DE	51.300000000000	12.333333000000	EUR
3692	Stavanger Rail Station	Stavanger Rail Station	ZWC		Norway	NO	58.967222000000	5.732222000000	NOK
3693	Ghat	Ghat	GHT		Libya	LY	25.145556000000	10.142778000000	LYD
3694	Abbottabad	Abbottabad	AAW		Pakistan	PK	34.200000000000	73.250000000000	PKR
3695	Annanberg	Annanberg	AOB		Papua New Guinea	PG	-4.916667000000	144.666667000000	PGK
3696	Makemo	Makemo	MKP		French Polynesia	PF	-16.583889000000	-143.658333000000	XPF
3697	Leguizamo	Leguizamo	LGZ		Colombia	CO	-0.183333000000	-74.750000000000	COP
3698	Terre Haute	Terre Haute	HUF		USA	US	39.450000000000	-87.300000000000	USD
3699	Melville Rail Station	Melville Rail Station	XEK		Canada	CA	50.916667000000	-102.800000000000	CAD
3700	Broome	Broome	BME		Australia	AU	-17.948889000000	122.228333000000	AUD
3701	Rangiroa Island	Rangiroa Island	RGI		French Polynesia	PF	-14.954167000000	-147.660833000000	XPF
3702	Bria	Bria	BIV		Central African Republic	CF	6.533333000000	21.983333000000	XAF
3703	Mattoon	Mattoon	MTO		USA	US	39.483333000000	-88.283333000000	USD
3704	Waskaganish	Waskaganish	YKQ		Canada	CA	51.473056000000	-78.758611000000	CAD
3705	Rotterdam The Hague Airport	Rotterdam	RTM		Netherlands	NL	51.948949000000	4.433606000000	EUR
3706	Aguascalients Airport	Aguascalientes	AGU		Mexico	MX	21.701416000000	-102.313744000000	MXN
3707	Cairns Airport	Cairns	CNS		Australia	AU	-16.876538000000	145.754041000000	AUD
3708	Grand Canyon National Park Airport	Grand Canyon Village,	GCN		United States	US	35.951942000000	-112.147500000000	USD
3709	Maintirano	Maintirano	MXT		Madagascar	MG	-18.050833000000	44.032222000000	MGA
3710	Harrogate	Harrogate	HRT		United Kingdom	GB	54.050000000000	-1.250000000000	GBP
3711	Birmingham New Street Rail Station	Birmingham (GB)	QQN		United Kingdom	GB	52.466667000000	-1.916667000000	GBP
3712	Dundee Rail Station	Dundee Rail Station	ZDU		United Kingdom	GB	56.466667000000	-2.966667000000	GBP
3713	Obidos	Obidos	OBI		Brazil	BR	-1.866667000000	-55.533333000000	BRL
3714	Tongren	Tongren	TEN		China	CN	27.883611000000	109.309444000000	RMB
3715	Labuha	Labuha	LAH		Indonesia	ID	-0.616667000000	127.483333000000	IDR
3716	Kaintiba	Kaintiba	KZF		Papua New Guinea	PG	-7.800000000000	145.883333000000	PGK
3717	Leticia	Leticia	LET		Colombia	CO	-4.193611000000	-69.943056000000	COP
3718	Huslia	Huslia	HSL		USA	US	65.697778000000	-156.351389000000	USD
3719	Kingston Rail Station	Kingston (CA)	XEG		Canada	CA	44.257222000000	-76.536944000000	CAD
3720	Carl R. Keller Field	Port Clinton	PCW		USA	US	41.523670000000	-82.855160000000	USD
3721	Palma de Mallorca Airport	Palma Mallorca	PMI		Spain and Canary Islands	ES	39.547654000000	2.730388000000	EUR
3722	Harare Airport	Harare	HRE		Zimbabwe	ZW	-17.918631000000	31.099249000000	ZWD
3723	Urumqi Airport	Urumqi	URC		China	CN	43.901260000000	87.475148000000	RMB
3724	Cambridge Airport	Cambridge	CBG		United Kingdom	GB	52.200000000000	0.183333000000	GBP
3725	Ikaria Airport	Ikaria Island	JIK		Greece	GR	37.666668000000	26.333332000000	EUR
3726	St Thomas SPB	St Thomas Island	SPB		Virgin Islands, US	VI	18.337778000000	-64.939722000000	USD
3727	Ipswich	Ipswich	IPW		United Kingdom	GB	52.033333000000	1.200000000000	GBP
3728	Tampere Bus Station	Tampere Bus Station	XTP		Finland	FI	61.492778000000	23.769444000000	EUR
3729	Ponta Pora	Ponta Pora	PMG		Brazil	BR	-22.533333000000	-55.733333000000	BRL
3730	Zhuhai (CN) 00	Zhuhai (CN) 00	ZUI		China	CN	22.236111000000	113.583333000000	RMB
3731	Pontianak	Pontianak	PNK		Indonesia	ID	-0.150833000000	109.403889000000	IDR
3732	Moree	Moree	MRZ		Australia	AU	-29.498889000000	149.844722000000	AUD
3733	Loubomo	Loubomo	DIS		Congo	CG	-4.216667000000	12.666667000000	XAF
3734	Merced Macready Regional Apt	Merced	MCE		USA	US	37.283333000000	-120.516667000000	USD
3735	Sepingan Airport	Balikpapan	BPN		Indonesia	ID	-1.260623000000	116.900817000000	IDR
3736	Nantucket Memorial Airport	Nantucket	ACK		United States	US	41.256668000000	-70.059720000000	USD
3737	Kars	Kars	KSY		Turkey	TR	40.562222000000	43.115000000000	USD
3738	Newark Northgate Rail Station	Newark Northgate Rail Station	XNK		United Kingdom	GB	53.083333000000	-0.013611000000	GBP
3739	Trondheim Central Rail Station	Trondheim	XZT		Norway	NO	63.436111000000	10.397500000000	NOK
3740	Viedma	Viedma	VDM		Argentina	AR	-40.870278000000	-62.996667000000	ARS
3741	Pietermaritzburg	Pietermaritzburg	PZB		South Africa	ZA	-29.648889000000	30.398611000000	ZAR
3742	Vinh City	Vinh City	VII		Viet Nam	VN	18.737500000000	105.670833000000	VND
3743	Narrabri	Narrabri	NAA		Australia	AU	-30.319167000000	149.827222000000	AUD
3744	Ibadan	Ibadan	IBA		Nigeria	NG	7.362500000000	3.978333000000	NGN
3745	Jackson	Jackson (US) TN	MKL		USA	US	35.602500000000	-88.913889000000	USD
3746	Hopedale	Hopedale	YHO		Canada	CA	55.448333000000	-60.229722000000	CAD
3747	Guernsey Airport	Guernsey	GCI		United Kingdom	GB	49.432756000000	-2.595044000000	GBP
3748	Entebbe Airport	Entebbe	EBB		Uganda	UG	0.045111000000	32.443183000000	UGX
3749	Mudanjiang Airport	Mudanjiang	MDG		China	CN	44.534943000000	129.583840000000	RMB
3750	Kirkwall Airport	Kirkwall	KOI		United Kingdom	GB	58.958057000000	-2.900556000000	GBP
3751	Easterwood Field,	College Station	CLL		USA	US	30.593842000000	-96.366820000000	USD
3752	Bobadilla Rail Station	Bobadilla Rail Station	OZI		Spain	ES	37.050000000000	-4.700000000000	EUR
3753	London Victoria Rail Station	London Victoria Rail Station	ZEP		United Kingdom	GB	51.495000000000	-0.144722000000	GBP
3754	Itaituba	Itaituba	ITB		Brazil	BR	-4.242222000000	-56.000556000000	BRL
3755	Tosontsengel	Tosontsengel	TNZ		Mongolia	MN	48.738333000000	98.296111000000	MNT
3756	Long Akah	Long Akah	LKH		Malaysia	MY	3.311944000000	114.786944000000	MYR
3757	Linga Linga	Linga Linga	LGN		Papua New Guinea	PG	-5.683333000000	149.416667000000	PGK
3759	Fort Myers Page Field	Fort Myers	FMY		USA	US	26.583333000000	-81.866667000000	USD
3760	Beaver	Beaver	WBQ		USA	US	66.361944000000	-147.409444000000	USD
3761	Le Mans Arnage Airport	Le Mans	LME		France	FR	47.948611000000	0.201667000000	EUR
3762	Almeria Airport	Almeria	LEI		Spain and Canary Islands	ES	36.847984000000	-2.371873000000	EUR
3763	West Palm Beach International Airport	West Palm Beach	PBI		United States	US	26.688885000000	-80.090438000000	USD
3764	Ouarzazate Airport	Ouarzazate	OZZ		Morocco	MA	30.916668000000	-6.916667000000	MAD
3765	Roswell International Air Center Airport	Roswell	ROW		United States	US	33.299720000000	-104.530000000000	USD
3766	Beica	Beica	BEI		Ethiopia	ET	9.391944000000	34.519444000000	ETB
3767	Zielona Gora	Zielona Gora	IEG		Poland	PL	52.138611000000	15.798611000000	PLN
3768	Anshan	Anshan	AOG		China	CN	41.105556000000	122.856111000000	RMB
3769	Sigiriya	Sigiriya	GIU		Sri Lanka	LK	7.956111000000	80.728333000000	LKR
3770	Albury	Albury	ABX		Australia	AU	-36.067778000000	146.958056000000	AUD
3771	Numbulwar	Numbulwar	NUB		Australia	AU	-14.266667000000	135.716667000000	AUD
3772	Beni	Beni	BNC		Congo Democratic Republic of	CD	0.577778000000	29.468889000000	CDF
3773	Lake Minchumina	Lake Minchumina	LMA		USA	US	63.884167000000	-152.305278000000	USD
3774	Inuvik	Inuvik	YEV		Canada	CA	68.304167000000	-133.482778000000	CAD
3775	Boigu Island	Boigu Island	GIC		Australia	AU	-9.266667000000	142.200000000000	AUD
3776	Te Anau	Te Anau	TEU		New Zealand	NZ	-45.466667000000	167.700000000000	NZD
3777	Sarh	Sarh	SRH		Chad	TD	9.150000000000	18.383333000000	XAF
3778	Aappilattoq Nanortalik Heliport	Aappilattoq Nanortalik Heliport	QUV		Greenland	GL	60.148333000000	-44.286944000000	DKK
3779	Buffalo Narrows	Buffalo Narrows	YVT		Canada	CA	55.850000000000	-108.483333000000	CAD
3780	Ciudad Real Airport	Ciudad Real	CQM		Spain and Canary Islands	ES	38.983333000000	-3.916667000000	EUR
3781	Sullivan County International Airport	Monticello	MSV		United States	US	41.701389000000	-74.795000000000	USD
3782	Kastelorizo Airport	Kastelorizo	KZS		Greece	GR	36.083332000000	29.333332000000	EUR
3783	North Sound	North Sound	NSX		Virgin Islands, British	VG	18.500000000000	-64.366667000000	USD
3784	Corvo Island	Corvo Island	CVU		Portugal	PT	39.671389000000	-31.113611000000	EUR
3785	La Palma Del Condada Rail Station	La Palma Del Condada Rail Station	NDO		Spain	ES	37.383333000000	-6.550000000000	EUR
3786	Valladolid Campo Grande Rail Station	Valladolid Campo Grande Rail Station	XIV		Spain	ES	41.641944000000	-4.726944000000	EUR
3787	Dundee Rail Station	Dundee Rail Station	ZDU		United Kingdom	GB	56.466667000000	-2.966667000000	GBP
3788	Abha	Abha	AHB		Saudi Arabia	SA	18.240278000000	42.656667000000	SAR
3789	Kimberley	Kimberley	KIM		South Africa	ZA	-28.802778000000	24.765278000000	ZAR
3790	Tagbilaran	Tagbilaran	TAG		Philippines	PH	9.660278000000	123.854167000000	PHP
3791	Newcastle Williamtown Apt	Newcastle (AU)	NTL		Australia	AU	-32.795000000000	151.834444000000	AUD
3792	Bumba	Bumba	BMB		Congo Democratic Republic of	CD	2.300000000000	22.550000000000	CDF
3793	Long Island (US)	Long Island (US)	LIJ		USA	US	54.900000000000	-132.750000000000	USD
3794	Arviat	Arviat	YEK		Canada	CA	61.094167000000	-94.070833000000	CAD
3795	Ronaldsway Airport	Isle Of Man	IOM		United Kingdom	GB	54.086769000000	-4.634730000000	GBP
3796	Durham Tees Valley Airport	Durham Tees Valley	MME		United Kingdom	GB	54.512226000000	-1.434013000000	GBP
3797	Golden Rock Airport	Saint Kitts	SKB		St. Kitts and Nevis	KN	17.310843000000	-62.713970000000	XCD
3798	Kandahar Airport	Kandahar	KDH		Afghanistan	AF	31.506944000000	65.847500000000	USD
3799	Tito Menniti Airport	Reggio Calabria	REG		Italy	IT	38.075280000000	15.650833000000	EUR
3800	Martha's Vineyard Airport	Vineyard Haven	MVY		United States	US	41.389336000000	-70.611820000000	USD
3801	Playon Chico	Playon Chico	PYC		Panama	PA	9.309722000000	-78.233611000000	PAB
3802	Ipswich	Ipswich	IPW		United Kingdom	GB	52.033333000000	1.200000000000	GBP
3803	Gerstungen Rail Station	Gerstungen Rail Station	ZGT		Germany	DE	50.966667000000	10.083333000000	EUR
3804	Dubai al Maktoum Intl	Dubai (AE) 00	DWC		United Arab Emirates	AE	24.896111000000	55.160000000000	AED
3805	Bhadrapur	Bhadrapur	BDP		Nepal	NP	26.570556000000	88.080278000000	NPR
3806	Armidale	Armidale	ARM		Australia	AU	-30.528056000000	151.617222000000	AUD
3807	St George (AU)	St George (AU)	SGO		Australia	AU	-28.049722000000	148.595278000000	AUD
3808	Angoon	Angoon	AGN		USA	US	59.503056000000	-139.648056000000	USD
3809	Vatry Airport	Chalons Sur Marne	XCR		France	FR	48.767778000000	4.201111000000	EUR
3810	Mais Gate Airport	Port Au Prince	PAP		Haiti	HT	18.575394000000	-72.294712000000	HTG
3811	Gwadar Airport	Gwadar	GWD		Pakistan	PK	25.230556000000	62.338889000000	PKR
3812	Khanty-Mansiysk	Khanty-Mansiysk	HMA		Russian Federation	RU	61.026130000000	69.097140000000	RUB
3813	Evansville Regional Airport	Evansville	EVV		USA	US	38.046165000000	-87.527960000000	USD
3814	Reus Rail Station	Reus Rail Station	EER		Spain	ES	41.160556000000	1.100278000000	EUR
3815	Storen Rail Station	Storen Rail Station	XUW		Norway	NO	63.053056000000	10.284167000000	NOK
3816	Sao Carlos	Sao Carlos	QSC		Brazil	BR	-21.876944000000	-47.904167000000	BRL
3817	Wuhu	Wuhu	WHU		China	CN	31.366667000000	118.366667000000	RMB
3818	Marinduque	Marinduque	MRQ		Philippines	PH	13.333333000000	121.850000000000	PHP
3819	Moorabbin	Moorabbin	MBW		Australia	AU	-37.975833000000	145.102222000000	AUD
3820	Valera	Valera	VLV		Venezuela	VE	9.340833000000	-70.584167000000	VEB
3821	Thorne Bay	Thorne Bay	KTB		USA	US	55.683333000000	-132.533333000000	USD
3822	Colville Lake	Colville Lake	YCK		Canada	CA	67.039722000000	-126.081111000000	CAD
3823	Beauvais-Tille Airport	Paris	BVA		France	FR	49.459488000000	2.110815000000	EUR
3824	Punta Cana International Airport	Punta Cana	PUJ		Dominican Republic	DO	18.562477000000	-68.363998000000	DOP
3825	Puerto Princesa Airport	Puerto Princesa	PPS		Philippines	PH	9.740198000000	118.756739000000	PHP
3826	Asheville Regional Airport	Fletcher	AVL		United States	US	35.435080000000	-82.537315000000	USD
3827	Coll	Coll	COL		United Kingdom	GB	56.601944000000	-6.617778000000	GBP
3828	Sivas	Sivas	VAS		Turkey	TR	39.813889000000	36.903611000000	USD
3829	Pecs	Pecs	PEV		Hungary	HU	45.989444000000	18.242222000000	HUF
3830	Dunhuang	Dunhuang	DNH		China	CN	40.092222000000	94.681667000000	RMB
3831	Jamnagar	Jamnagar	JGA		India	IN	22.465556000000	70.012500000000	INR
3832	Adler/Sochi Airport	Adler/Sochi	AER		Russian Federation	RU	43.448840000000	39.941106000000	RUB
3833	Norman Y. Mineta San Jose International Airport	San Jose	SJC		United States	US	37.366736000000	-121.926375000000	USD
3834	Augsburg - Muehlhausen Airport	Munich	AGB		Germany	DE	48.425278000000	10.931667000000	EUR
3835	Kzyl-Orda	Kzyl-Orda	KZO		Kazakhstan	KZ	45.516667000000	65.833333000000	KZT
3836	Helsinki Heliport	Helsinki Heliport	HEN		Finland	FI	60.147778000000	24.924444000000	EUR
3837	Isles of Scilly Tresco Heliport	Isles of Scilly	TSO		United Kingdom	GB	49.945556000000	-6.331389000000	GBP
3838	Chesterfield Bus Station	Chesterfield Bus Station	ZFI		United Kingdom	GB	53.250000000000	-1.416667000000	GBP
3839	Iquique	Iquique	IQQ		Chile	CL	-20.535278000000	-70.181389000000	CLP
3840	Miyazaki	Miyazaki	KMI		Japan	JP	31.877222000000	131.448611000000	JPY
3841	Zamzama	Zamzama	ZIZ		Pakistan	PK	26.711111000000	67.667500000000	PKR
3842	Gove	Gove	GOV		Australia	AU	-12.269444000000	136.818333000000	AUD
3843	Bahia de Caraquez	Bahia de Caraquez	BHA		Ecuador	EC	-0.583333000000	-80.400000000000	USD
3844	Fillmore	Fillmore	FIL		USA	US	38.966667000000	-112.333333000000	USD
3845	Camp Douglas	Camp Douglas	VOK		USA	US	43.916667000000	-90.266667000000	USD
3846	Strasbourg Bus Station	Strasbourg Bus Station	XER		France	FR	48.585278000000	7.735556000000	EUR
3847	Zaragoza Airport	Zaragoza	ZAZ		Spain and Canary Islands	ES	41.663862000000	-1.007466000000	EUR
3848	Henry E. Rohlsen Airport	Saint Croix	STX		U.S. Virgin Islands	VI	17.701944000000	-64.798611000000	USD
3849	Bishkek Airport	Bishkek	FRU		Kyrgyzstan	KG	43.053581000000	74.469449000000	KGS
3850	Shreveport Regional Airport	Shreveport	SHV		United States	US	32.454710000000	-93.828384000000	USD
3851	Songea	Songea	SGX		Tanzania United Republic of	TZ	-10.683333000000	35.583333000000	TZS
3852	Ceuta	Ceuta	JCU		Spain	ES	35.892222000000	-5.306944000000	EUR
3853	Interlaken Ost Bus Station	Interlaken Ost Bus Station	ZIN		Switzerland	CH	46.683333000000	7.850000000000	CHF
3854	Tabuk	Tabuk	TUU		Saudi Arabia	SA	28.365556000000	36.618889000000	SAR
3855	Ongavia Game Reserve	Ongavia Game Reserve	OGV		Namibia	NA	-19.321111000000	15.901944000000	NAD
3856	Agaun	Agaun	AUP		Papua New Guinea	PG	-9.916667000000	149.333333000000	PGK
3857	Parkes	Parkes	PKE		Australia	AU	-33.131389000000	148.239167000000	AUD
3858	Palese Airport	Bari	BRI		Italy	IT	41.133881000000	16.763910000000	EUR
3859	Exeter Airport	Exeter	EXT		United Kingdom	GB	50.731109000000	-3.410968000000	GBP
3860	Viracopos Airport	Campinas	VCP		Brazil	BR	-23.009892000000	-47.141673000000	BRL
3861	Matacan Airport	Salamanca	SLM		Spain and Canary Islands	ES	40.951942000000	-5.501944000000	EUR
3862	Fortuna	Fortuna	FON		Costa Rica	CR	10.400833000000	-84.487500000000	CRC
3863	Ashford International Rail Station	Ashford International Rail Station	QDH		United Kingdom	GB	51.143333000000	0.874722000000	GBP
3864	Nottingham Rail Station	Nottingham	XNM		United Kingdom	GB	52.969444000000	-1.166667000000	GBP
3865	Wakefield Westgate Rail Station	Wakefield Westgate Rail Station	XWD		United Kingdom	GB	53.700000000000	-1.483333000000	GBP
3866	Mucuri	Mucuri	MVS		Brazil	BR	-18.083333000000	-39.566667000000	BRL
3867	Simao	Simao	SYM		China	CN	22.794722000000	100.959167000000	RMB
3868	Kerteh	Kerteh	KTE		Malaysia	MY	4.540833000000	103.425833000000	MYR
3869	Kawito	Kawito	KWO		Papua New Guinea	PG	-7.983333000000	142.816667000000	PGK
3870	Riohacha	Riohacha	RCH		Colombia	CO	11.526111000000	-72.925833000000	COP
3871	Janesville	Janesville	JVL		USA	US	42.616667000000	-89.033333000000	USD
3872	South Indian Lake	South Indian Lake	XSI		Canada	CA	56.785000000000	-98.901111000000	CAD
3873	Biarritz Parme Airport	Biarritz	BIQ		France	FR	43.472416000000	-1.531242000000	EUR
3874	4 de Fevereiro Airport	Luanda	LAD		Angola	AO	-8.847951000000	13.234862000000	AOA
3875	Gan/Seenu Airport	Gan Island	GAN		Maldives	MV	-0.690003000000	73.156538000000	MVR
3876	Kidlington Airport	Oxford	OXF		United Kingdom	GB	51.766666000000	-1.250000000000	GBP
3877	Roosevelt Roads	Roosevelt Roads	NRR		Puerto Rico	PR	18.250000000000	-65.633333000000	USD
3878	Palencia Rail Station	Palencia Rail Station	PCI		Spain	ES	42.015556000000	-4.533611000000	EUR
3879	Wolverhampton Rail Station	Wolverhampton Rail Station	XVW		United Kingdom	GB	52.600000000000	-2.133333000000	GBP
3880	Mercedes	Mercedes	MDX		Argentina	AR	-29.216944000000	-58.083333000000	ARS
3881	Monbetsu	Monbetsu	MBE		Japan	JP	44.303889000000	143.404167000000	JPY
3882	Bade	Bade	BXD		Indonesia	ID	-7.166667000000	139.583333000000	IDR
3883	Madrid-Barajas Airport	Madrid	MAD		Spain and Canary Islands	ES	40.465150000000	-3.570209000000	EUR
3884	Borinquen Airport	Aguadilla	BQN		Puerto Rico	PR	18.495833000000	-67.130000000000	USD
3885	Noi Bai International Airport	Hanoi	HAN		Viet Nam	VN	21.214184000000	105.802827000000	VND
3886	Santa Cruz Airport	Flores Island	FLW		Portugal	PT	39.466667000000	-31.150000000000	EUR
3887	Dessie	Dessie	DSE		Ethiopia	ET	11.083333000000	39.716667000000	ETB
3888	Silkeborg Rail Station	Silkeborg Rail Station	XAH		Denmark	DK	56.166667000000	9.566667000000	DKK
3889	Balmaceda	Balmaceda	BBA		Chile	CL	-45.916111000000	-71.689444000000	CLP
3890	Minami Daito	Minami Daito	MMD		Japan	JP	25.833333000000	131.250000000000	JPY
3891	Camiguin	Camiguin	CGM		Philippines	PH	9.253611000000	124.706944000000	PHP
3892	Kar Kar	Kar Kar	KRX		Papua New Guinea	PG	-4.550000000000	145.933333000000	PGK
3893	Porlamar	Porlamar	PMV		Venezuela	VE	10.913056000000	-63.967500000000	VEB
3894	Jamestown (US) ND	Jamestown (US) ND	JMS		USA	US	46.929722000000	-98.678333000000	USD
3895	Niagara Falls Rail Station	Niagara Falls Rail Station	XLV		Canada	CA	43.100000000000	-79.066667000000	CAD
3896	Xieng Khouang	Xieng Khouang	XKH		Lao People's Democratic Republic	LA	19.450000000000	103.158333000000	LAK
3897	Leeton Bus Station	Leeton Bus Station	QLE		Australia	AU	-34.550000000000	146.400000000000	AUD
3898	Port Gentil	Port Gentil	POG		Gabon	GA	-0.711667000000	8.754444000000	XAF
3899	Yosemite National Park	Yosemite National Park	OYS		USA	US	37.850000000000	-119.550000000000	USD
3900	Pickle Lake	Pickle Lake	YPL		Canada	CA	51.446389000000	-90.214167000000	CAD
3901	Adnan Menderes Airport	Izmir	ADB		Turkey	TR	38.294403000000	27.147594000000	USD
3902	Cerro Moreno Airport	Antofagasta	ANF		Chile	CL	-23.449000000000	-70.440789000000	CLP
3903	Skagen Airport	Stokmarknes	SKN		Norway	NO	68.579150000000	15.032921000000	NOK
3904	Terre-de-Haut	Terre-de-Haut	LSS		Guadeloupe	GP	15.864444000000	-61.580556000000	EUR
3905	Land's End	Land's End	LEQ		United Kingdom	GB	50.102778000000	-5.670556000000	GBP
3906	Segovia Guiomar Rail Station	Segovia Guiomar Rail Station	XOU		Spain	ES	40.910000000000	-4.094722000000	EUR
3907	Helsinki-Vantaa Airport	Helsinki	HEL		Finland	FI	60.317953000000	24.966449000000	EUR
3908	Ottawa/Macdonald-Cartier International Airport	Ottawa	YOW		Canada	CA	45.320833000000	-75.672778000000	CAD
3909	King Fahad International Airport	Dammam	DMM		Saudi Arabia	SA	26.471111000000	49.797778000000	SAR
3910	Brunswick Golden Isles Airport	Brunswick	BQK		United States	US	31.166668000000	-81.483330000000	USD
3911	Laeso	Laeso	BYR		Denmark	DK	57.277222000000	11.000000000000	DKK
3912	Manchester Piccadilly Rail Station	Manchester (GB)	QQM		United Kingdom	GB	53.466667000000	-2.233333000000	GBP
3913	Jerez Rail Stn	Jerez Rail Stn	YJW		Spain	ES	36.680000000000	-6.126389000000	EUR
3914	Osorno	Osorno	ZOS		Chile	CL	-40.611389000000	-73.060556000000	CLP
3915	Tanda Tula	Tanda Tula	TDT		South Africa	ZA	-24.533333000000	31.300000000000	ZAR
3916	Sayaboury	Sayaboury	ZBY		Lao People's Democratic Republic	LA	19.233333000000	101.733333000000	LAK
3917	Rabi	Rabi	RBI		Fiji	FJ	-17.033333000000	178.916667000000	FJD
3918	Atqasuk	Atqasuk	ATK		USA	US	70.467222000000	-157.435833000000	USD
3919	Keystone Van Station	Keystone Van Station	QKS		USA	US	39.766667000000	-104.886111000000	USD
3920	Rouyn	Rouyn	YUY		Canada	CA	48.206111000000	-78.835556000000	CAD
3921	Lanzarote Airport	Lanzarote	ACE		Spain and Canary Islands	ES	28.950668000000	-13.609059000000	EUR
3922	London Heathrow Airport	London	LHR		United Kingdom	GB	51.469603000000	-0.453566000000	GBP
3923	Fairchild International Airport	Port Angeles	CLM		United States	US	48.121884000000	-123.495112000000	USD
3924	Sao Jorge Island Airport	Sao Jorge Island	SJZ		Portugal	PT	38.664616000000	-28.168430000000	EUR
3925	Bathpalathang	Bathpalathang	BUT		Bhutan	BT	27.563056000000	90.746667000000	BTN
3926	London Biggin Hill Apt	London (GB)	BQH		United Kingdom	GB	51.330833000000	0.032222000000	GBP
3927	Oshkosh	Oshkosh	OSH		USA	US	43.983333000000	-88.550000000000	USD
3928	Cordoba Rail Station	Cordoba Rail Station	XOJ		Spain	ES	37.888333000000	-4.789444000000	EUR
3929	Ourilandia	Ourilandia	OIA		Brazil	BR	-6.764167000000	-51.048333000000	BRL
3930	Yonago	Yonago	YGJ		Japan	JP	35.492222000000	133.236389000000	JPY
3931	Tablas	Tablas	TBH		Philippines	PH	12.311389000000	122.080000000000	PHP
3932	Niuatoputapu	Niuatoputapu	NTT		Tonga	TO	-15.976667000000	-174.755000000000	TOP
3933	Lisala	Lisala	LIQ		Congo Democratic Republic of	CD	2.166667000000	21.483333000000	CDF
3934	Mt Vernon	Mt Vernon	MVN		USA	US	38.316667000000	-88.866667000000	USD
3935	Toronto Buttonville Apt	Toronto	YKZ		Canada	CA	43.866667000000	-79.383333000000	CAD
3936	Oslo Gardermoen Airport	Oslo	OSL		Norway	NO	60.194192000000	11.100411000000	NOK
3937	Asmara International Airport	Asmara	ASM		Eritrea	ER	15.291111000000	38.910278000000	ERN
3938	Nanning Airport	Nanning	NNG		China	CN	22.613210000000	108.167501000000	RMB
3939	Blackpool Airport	Blackpool	BLK		United Kingdom	GB	53.778385000000	-3.041985000000	GBP
3940	Tupelo Regional Airport	Tupelo	TUP		United States	US	34.258890000000	-88.767220000000	USD
3941	Emden	Emden	EME		Germany	DE	53.391111000000	7.225556000000	EUR
3942	Vaeroy	Vaeroy	VRY		Norway	NO	67.666667000000	12.666667000000	NOK
3943	Santo Angelo	Santo Angelo	GEL		Brazil	BR	-28.282778000000	-54.170278000000	BRL
3944	Jinzhou	Jinzhou	JNZ		China	CN	41.102500000000	121.061944000000	RMB
3945	Trincomalee (LK) 00	Trincomalee (LK) 00	THW		Sri Lanka	LK	8.539722000000	81.181944000000	LKR
3946	Strachowice Airport	Wroclaw	WRO		Poland	PL	51.104822000000	16.899403000000	PLN
3947	Bejaia Airport	Bejaia	BJA		Algeria	DZ	36.750000000000	5.083333000000	DZD
3948	Xianyang Airport	Xian	XIY		China	CN	34.441156000000	108.756053000000	RMB
3949	Bierset Airport	Liege	LGG		Belgium	BE	50.643333000000	5.460149000000	EUR
3950	Treasure Cay	Treasure Cay	TCB		Bahamas	BS	26.745278000000	-77.391389000000	BSD
3951	Bembridge	Bembridge	BBP		United Kingdom	GB	50.678056000000	-1.109167000000	GBP
3952	Duesseldorf HBF Rail Station	Duesseldorf	QDU		Germany	DE	51.220278000000	6.793056000000	EUR
3953	Falun Rail Station	Falun Rail Station	XWF		Sweden	SE	60.603333000000	15.641389000000	SEK
3954	Sunchales	Sunchales	NCJ		Argentina	AR	-30.957778000000	-61.525000000000	ARS
3955	Miyake Jima	Miyake Jima	MYE		Japan	JP	34.073611000000	139.560278000000	JPY
3956	Cauayan	Cauayan	CYZ		Philippines	PH	16.928889000000	121.755278000000	PHP
3957	Kwailabesi	Kwailabesi	KWS		Solomon Islands	SB	-8.366667000000	160.783333000000	SBD
3958	Juanjui	Juanjui	JJI		Peru	PE	-7.150000000000	-76.716667000000	PEN
3959	Hooper Bay	Hooper Bay	HPB		USA	US	61.523889000000	-166.146667000000	USD
3960	The Pas Rail Station	The Pas	XDZ		Canada	CA	53.825000000000	-101.247778000000	CAD
3961	Singapore Seletar Apt	Singapore	XSP		Singapore	SG	1.416944000000	103.867778000000	SGD
3962	Arawa	Arawa	RAW		Papua New Guinea	PG	-6.233333000000	155.566667000000	PGK
3963	Uyo	Uyo	QUO		Nigeria	NG	4.873889000000	8.091389000000	NGN
3964	Portage Creek	Portage Creek	PCA		USA	US	60.833333000000	-150.000000000000	USD
3965	Peawanuck	Peawanuck	YPO		Canada	CA	54.987778000000	-85.442778000000	CAD
3966	Malta Luqa Airport	Malta	MLA		Malta	MT	35.849776000000	14.495401000000	EUR
3967	Miller International Airport	McAllen	MFE		United States	US	26.181295000000	-98.239775000000	USD
3968	St. Mary's Airport	Isles Of Scilly	ISC		United Kingdom	GB	49.913334000000	-6.291667000000	GBP
3969	Leon Airport	Leon	LEN		Spain	ES	42.590570000000	-5.646290000000	EUR
3970	Mandritsara	Mandritsara	WMA		Madagascar	MG	-15.833333000000	48.833333000000	MGA
3971	Mainz Rail Station	Mainz Rail Station	QMZ		Germany	DE	50.001667000000	8.259167000000	EUR
3972	Nassjo Rail Station	Nassjo Rail Station	XWX		Sweden	SE	57.651944000000	14.694722000000	SEK
3973	Merlo	Merlo	RLO		Argentina	AR	-32.384444000000	-65.552500000000	ARS
3974	Seoul Air Base	Seoul	SSN		Korea Republic of	KR	37.443611000000	127.112778000000	KRW
3975	Kapit	Kapit	KPI		Malaysia	MY	2.000000000000	112.916667000000	MYR
3976	Kavieng	Kavieng	KVG		Papua New Guinea	PG	-2.579444000000	150.808056000000	PGK
3977	Cravo Norte	Cravo Norte	RAV		Colombia	CO	6.316667000000	-70.183333000000	COP
3978	Nuugaatsiaq	Nuugaatsiaq	JUU		Greenland	GL	71.538889000000	-53.205278000000	DKK
3979	Sandnes Rail Station	Sandnes Rail Station	XKC		Norway	NO	58.847778000000	5.733889000000	NOK
3980	Santa Vitoria	Santa Vitoria	CTQ		Brazil	BR	-18.833333000000	-50.133333000000	BRL
3981	Lanzhou Zhongchuan Apt	Lanzhou	LHW		China	CN	36.516667000000	103.616667000000	RMB
3982	Bakalalan	Bakalalan	BKM		Malaysia	MY	3.973889000000	115.617222000000	MYR
3983	Faaite	Faaite	FAC		French Polynesia	PF	-16.686667000000	-145.329722000000	XPF
3984	Ua Pou	Ua Pou	UAP		French Polynesia	PF	-9.347500000000	-140.079722000000	XPF
3985	Anaktuvuk Pass	Anaktuvuk Pass	AKP		USA	US	68.133611000000	-151.743333000000	USD
3986	Oklahoma City Wiley Post Apt	Oklahoma City	PWA		USA	US	35.533333000000	-97.633333000000	USD
3987	Marathon (CA)	Marathon (CA)	YSP		Canada	CA	48.750000000000	-86.350000000000	CAD
3988	Hayman Island	Hayman Island	HIS		Australia	AU	-20.060000000000	148.883611000000	AUD
3989	Capurgana	Capurgana	CPB		Colombia	CO	8.633333000000	-77.333333000000	COP
3990	Golovin	Golovin	GLV		USA	US	64.548056000000	-163.011944000000	USD
3991	Washington	Washington (US) PA	WSG		USA	US	40.166667000000	-80.250000000000	USD
3992	Paris C de Gaulle Tgv Rail Service	Paris	XDT		France	FR	49.016667000000	2.550000000000	EUR
3993	St Mawgan Airport	Newquay	NQY		United Kingdom	GB	50.437450000000	-4.997922000000	GBP
3994	Port Townsend Airport	Port Townsend	TWD		United States	US	48.116667000000	-122.766667000000	USD
3995	Mehamn Airport	Mehamn	MEH		Norway	NO	71.033330000000	27.833332000000	NOK
3996	Arkalyk	Arkalyk	AYK		Kazakstan	KZ	50.316667000000	66.966667000000	KZT
3997	Foula	Foula	FOA		United Kingdom	GB	60.122222000000	-2.053611000000	GBP
3998	Penzance	Penzance	PZE		United Kingdom	GB	50.128056000000	-5.518611000000	GBP
3999	Newport Rail Station	Newport Rail Station	XNE		United Kingdom	GB	51.583333000000	-3.000000000000	GBP
4000	Peterborough Rail Station	Peterborough Rail Station	XVH		United Kingdom	GB	52.583333000000	-1.250000000000	GBP
4001	President Prudente	President Prudente	PPB		Brazil	BR	-22.175000000000	-51.424722000000	BRL
4002	Pevek	Pevek	PWE		Russian Federation	RU	69.783333000000	170.596944000000	RUB
4003	Ilu	Ilu	IUL		Indonesia	ID	-3.750000000000	138.083333000000	IDR
4004	Hokitika	Hokitika	HKK		New Zealand	NZ	-42.711389000000	170.984167000000	NZD
4005	Wotje Island	Wotje Island	WTE		Marshall Islands	MH	9.450000000000	170.033333000000	USD
4006	Delta	Delta	DTA		USA	US	39.383333000000	-112.500000000000	USD
4007	Telluride	Telluride	TEX		USA	US	37.952778000000	-107.902500000000	USD
4008	Utica Railway Station	Utica Railway Station	ZUA		USA	US	43.103889000000	-75.224444000000	USD
4009	South Eleuthera Airport	Rock Sound	RSD		Bahamas	BS	24.891667000000	-76.178056000000	BSD
4010	Miri Airport	Miri	MYY		Malaysia	MY	4.325261000000	113.983119000000	MYR
4011	Aberdeen Regional Airport	Aberdeen	ABR		United States	US	45.452500000000	-98.426110000000	USD
4012	Mahanoro	Mahanoro	VVB		Madagascar	MG	-19.833333000000	48.800000000000	MGA
4013	Manchester Piccadilly Rail Station	Manchester (GB)	QQM		United Kingdom	GB	53.466667000000	-2.233333000000	GBP
4014	Jerez Rail Stn	Jerez Rail Stn	YJW		Spain	ES	36.680000000000	-6.126389000000	EUR
4015	Rio Grande (BR)	Rio Grande (BR)	RIG		Brazil	BR	-32.081111000000	-52.164722000000	BRL
4016	Hoedspruit	Hoedspruit	HDS		South Africa	ZA	-24.348611000000	30.946944000000	ZAR
4017	Sanana	Sanana	SQN		Indonesia	ID	-2.066667000000	125.966667000000	IDR
4018	Nicholson	Nicholson	NLS		Australia	AU	-18.041667000000	128.900000000000	AUD
4019	Butembo	Butembo	RUE		Congo Democratic Republic of	CD	0.133333000000	29.266667000000	CDF
4020	Painter Creek	Painter Creek	PCE		USA	US	57.133333000000	-157.339444000000	USD
4021	Peterborough	Peterborough	YPQ		Canada	CA	44.300000000000	-78.316667000000	CAD
4022	Wiscasset	Wiscasset	ISS		USA	US	43.969444000000	-69.716667000000	USD
4023	Maxville Rail Station	Maxville Rail Station	XID		Canada	CA	45.283333000000	-74.850000000000	CAD
4024	North Perry Airport	Hollywood	HWO		USA	US	26.002428000000	-80.238914000000	USD
4025	Beef Island Airport	Beef Island	EIS		British Virgin Islands	VG	18.443889000000	-64.542778000000	USD
4026	Chinggis Khaan International Airport	Ulaanbaatar	ULN		Mongolia	MN	47.852749000000	106.763268000000	MNT
4027	Metropolitan Area Airport	London	YXU		Canada	CA	43.028020000000	-81.149650000000	CAD
4028	Lalibela	Lalibela	LLI		Ethiopia	ET	11.975000000000	38.980000000000	ETB
4029	Notodden	Notodden	NTB		Norway	NO	59.584167000000	9.135278000000	NOK
4030	Rugby Rail Station	Rugby Rail Station	XRU		United Kingdom	GB	52.383333000000	-1.250000000000	GBP
4031	Olavarria	Olavarria	OVR		Argentina	AR	-36.888889000000	-60.227778000000	ARS
4032	Tanegashima	Tanegashima	TNE		Japan	JP	30.550000000000	130.950000000000	JPY
4033	Mulia	Mulia	LII		Indonesia	ID	-3.166667000000	136.166667000000	IDR
4034	Bureta	Bureta	LEV		Fiji	FJ	-17.711111000000	178.760000000000	FJD
4035	Los Roques	Los Roques	LRV		Venezuela	VE	11.833333000000	-66.750000000000	VEB
4036	Hays	Hays	HYS		USA	US	38.850278000000	-99.275556000000	USD
4037	Parent Rail Station	Parent Rail Station	XFE		Canada	CA	47.916667000000	-74.616667000000	CAD
4038	Karlovy Vary Airport	Karlovy Vary	KLV		Czech Republic	CZ	50.200000000000	12.916667000000	CZK
4039	Bocas Del Toro Airport	Bocas Del Toro	BOC		Panama	PA	9.340000000000	-82.251944000000	PAB
4040	Kahului Airport	Kahului	OGG		United States	US	20.892883000000	-156.438630000000	USD
4041	Fajardo	Fajardo	FAJ		Puerto Rico	PR	18.383333000000	-65.750000000000	USD
4042	Bradford (GB)	Bradford (GB)	BRF		United Kingdom	GB	53.802778000000	-1.750000000000	GBP
4043	Kozani	Kozani	KZI		Greece	GR	40.286111000000	21.840833000000	EUR
4044	Ringebu Rail Station	Ringebu Rail Station	XUQ		Norway	NO	61.528889000000	10.138611000000	NOK
4045	Macapa	Macapa	MCP		Brazil	BR	0.050556000000	-51.072222000000	BRL
4046	Wakkanai	Wakkanai	WKJ		Japan	JP	45.404167000000	141.800833000000	JPY
4047	Sanga Sanga	Sanga Sanga	SGS		Philippines	PH	5.045556000000	119.742778000000	PHP
4048	Star Harbour	Star Harbour	NAZ		Solomon Islands	SB	-10.655556000000	162.205833000000	SBD
4049	Impfondo	Impfondo	ION		Congo	CG	1.616667000000	18.066667000000	XAF
4050	Marshall	Marshall	MLL		USA	US	61.864167000000	-162.026111000000	USD
4051	Gaya Airport	Gaya	GAY		India	IN	24.746667000000	84.945833000000	INR
4052	Satu Mare Airport	Satu Mare	SUJ		Romania	RO	47.700000000000	22.883333000000	ROL
4053	Lamu	Lamu	LAU		Kenya	KE	-2.252500000000	40.913056000000	KES
4054	London Waterloo Rail Station	London Waterloo Rail Station	QQW		United Kingdom	GB	51.500000000000	-0.116667000000	GBP
4055	Panarea Island	Panarea Island	ZJE		Italy	IT	38.636667000000	15.078333000000	EUR
4056	Fujairah	Fujairah	FJR		United Arab Emirates	AE	25.112222000000	56.323889000000	AED
4057	Santa Carolina	Santa Carolina	NTC		Mozambique	MZ	-21.666667000000	35.500000000000	MZM
4058	Ambunti	Ambunti	AUJ		Papua New Guinea	PG	-4.233333000000	142.833333000000	PGK
4059	Pindiu	Pindiu	PDI		Papua New Guinea	PG	-6.500000000000	147.583333000000	PGK
4060	Mitzic	Mitzic	MZC		Gabon	GA	0.783333000000	11.566667000000	XAF
4061	Port Alexander	Port Alexander	PTD		USA	US	56.250000000000	-134.650000000000	USD
4062	St John	St John	YSJ		Canada	CA	45.320556000000	-65.882222000000	CAD
4063	Charles de Gaulle Airport	Paris	CDG		France	FR	49.003196000000	2.567023000000	EUR
4064	East Midlands Airport	Leicestershire	EMA		United Kingdom	GB	52.825872000000	-1.330595000000	GBP
4065	Palm Springs Municipal Airport	Palm Springs	PSP		United States	US	33.822976000000	-116.508444000000	USD
4066	Leknes Airport	Leknes	LKN		Norway	NO	68.154210000000	13.614864000000	NOK
4067	Fort Dauphin	Fort Dauphin	FTU		Madagascar	MG	-25.038056000000	46.956111000000	MGA
4068	Ronda Rail Station	Ronda Rail Station	RRA		Spain	ES	36.733333000000	-5.166667000000	EUR
4069	Stevenage Rail Station	Stevenage Rail Station	XVJ		United Kingdom	GB	51.916667000000	-0.233333000000	GBP
4070	Araraquara	Araraquara	AQA		Brazil	BR	-21.811944000000	-48.133056000000	BRL
4071	Linyi	Linyi	LYI		China	CN	35.049444000000	118.411944000000	RMB
4072	Batam	Batam	BTH		Indonesia	ID	1.121111000000	104.118889000000	IDR
4073	Fakahina	Fakahina	FHZ		French Polynesia	PF	-15.992222000000	-140.164722000000	XPF
4074	Whyalla	Whyalla	WYA		Australia	AU	-33.059444000000	137.519444000000	AUD
4075	Edna Bay	Edna Bay	EDA		USA	US	55.950000000000	-133.666667000000	USD
4076	Tuluksak	Tuluksak	TLT		USA	US	61.097778000000	-160.968056000000	USD
4077	Washington Dc Rail Station	Washington	ZWU		USA	US	38.897500000000	-77.006389000000	USD
4078	Sandefjord Airport	Oslo	TRF		Norway	NO	59.178087000000	10.251807000000	NOK
4079	Dallas/Fort Worth International Airport	Dallas	DFW		United States	US	32.897462000000	-97.036128000000	USD
4080	Berlin Brandenburg Airport	Berlin	BER		Germany	DE	52.366670000000	13.503333000000	EUR
4081	Makhachkala Airport	Makhachkala	MCX		Russia	RU	42.820950000000	47.656110000000	RUB
4082	Mandera	Mandera	NDE		Kenya	KE	3.933333000000	41.866667000000	KES
4083	Sodertalje South Rail Station	Sodertalje South Rail Station	XEZ		Sweden	SE	59.150000000000	17.633333000000	SEK
4084	Rastatt Bus Station	Rastatt Bus Station	ZRW		Germany	DE	48.166667000000	8.166667000000	EUR
4085	Bratsk	Bratsk	BTK		Russian Federation	RU	56.370556000000	101.698333000000	RUB
4086	Ishurdi	Ishurdi	IRD		Bangladesh	BD	24.153611000000	89.048889000000	BDT
4087	Balgo Hills	Balgo Hills	BQW		Australia	AU	-20.133333000000	127.800000000000	AUD
4088	Rurutu	Rurutu	RUR		French Polynesia	PF	-22.434167000000	-151.360556000000	XPF
4089	Moabi	Moabi	MGX		Gabon	GA	-2.433333000000	11.000000000000	XAF
4090	Whitehouse	Whitehouse	NEN		USA	US	30.333333000000	-81.883333000000	USD
4091	Lebel-Sur-Quevillon	Lebel-Sur-Quevillon	YLS		Canada	CA	49.066667000000	-77.000000000000	CAD
4092	Diagoras Airport	Rhodes	RHO		Greece	GR	36.401866000000	28.090677000000	EUR
4093	La Union Airport	Puerto Plata	POP		Dominican Republic	DO	19.754942000000	-70.563150000000	DOP
4094	Mandurriao Airport	Iloilo	ILO		Philippines	PH	10.714312000000	122.543883000000	PHP
4095	Tiree Airport	Tiree	TRE		United Kingdom	GB	56.500557000000	-6.871389000000	GBP
4096	Anegada	Anegada	NGD		Virgin Islands, British	VG	18.733333000000	-64.316667000000	USD
4097	Inishmore	Inishmore	IOR		Ireland Republic of	IE	53.106944000000	-9.653889000000	EUR
4098	Durham Rail Station	Durham Rail Station	XVU		United Kingdom	GB	54.783333000000	-1.566667000000	GBP
4099	Aracatuba	Aracatuba	ARU		Brazil	BR	-21.141389000000	-50.424722000000	BRL
4100	Yan'an	Yan'an	ENY		China	CN	36.636667000000	109.553333000000	RMB
4101	Koggala	Koggala	KCT		Sri Lanka	LK	5.993611000000	80.320278000000	LKR
4102	Indagen	Indagen	IDN		Papua New Guinea	PG	-6.033333000000	147.033333000000	PGK
4103	Guasdualito	Guasdualito	GDO		Venezuela	VE	7.211111000000	-70.756389000000	VEB
4104	Holy Cross	Holy Cross	HCR		USA	US	62.190278000000	-159.772500000000	USD
4105	Chatham	Chatham	XCM		Canada	CA	42.310000000000	-82.076667000000	CAD
4106	Lille Flandres Rail Station	Lille	XFA		France	FR	50.636389000000	3.070833000000	EUR
4107	Konya Airport	Konya	KYA		Turkey	TR	37.979167000000	32.562222000000	USD
4108	Tepual Airport	Puerto Montt	PMC		Chile	CL	-41.433726000000	-73.098312000000	CLP
4109	Lajes Airport	Terceira	TER		Portugal	PT	38.754074000000	-27.087570000000	EUR
4110	Trashigang	Trashigang	YON		Bhutan	BT	27.256111000000	91.515278000000	BTN
4111	Ramsgate Rail Station	Ramsgate Rail Station	QQR		United Kingdom	GB	51.333333000000	1.416667000000	GBP
4112	Sundsvall Rail Station	Sundsvall Rail Station	XXZ		Sweden	SE	62.386667000000	17.316111000000	SEK
4113	Tartagal	Tartagal	TTG		Argentina	AR	-22.516667000000	-63.783333000000	ARS
4114	Umnugobitour	Umnugobitour	UGT		Mongolia	MN	43.750556000000	104.120278000000	MNT
4115	Poso	Poso	PSJ		Indonesia	ID	-1.418333000000	120.656667000000	IDR
4116	Loen	Loen	LOF		Marshall Islands	MH	7.800000000000	168.283333000000	USD
4117	Trinidad	Trinidad	TDD		Bolivia	BO	-14.821667000000	-64.915000000000	BOB
4118	Kakhonak	Kakhonak	KNK		USA	US	59.433333000000	-154.803611000000	USD
4119	Campbell River Municipal Apt	Campbell River	YBL		Canada	CA	49.950833000000	-125.270556000000	CAD
4120	Copenhagen Airport	Copenhagen	CPH		Denmark	DK	55.629053000000	12.647601000000	DKK
4121	Kelowna Airport	Kelowna	YLW		Canada	CA	49.951542000000	-119.381396000000	CAD
4122	Beirut International Airport	Beirut	BEY		Lebanon	LB	33.826073000000	35.493082000000	LBP
4123	Chubu Centrair International Airport	Nagoya	NGO		Japan	JP	34.858333000000	136.805278000000	JPY
4124	Elat Airport	Elat	ETH		Israel	IL	29.555616000000	34.953570000000	ILS
4125	Kilwa	Kilwa	KIY		Tanzania United Republic of	TZ	-8.916667000000	39.483333000000	TZS
4126	Finse Rail Station	Finse Rail Station	XKN		Norway	NO	60.601944000000	7.503889000000	NOK
4127	Hamburg HBF Rail Station	Hamburg	ZMB		Germany	DE	53.550000000000	10.000000000000	EUR
4128	Al Ain Bus Station	Al Ain Bus Station	ZVH		United Arab Emirates	AE	24.220000000000	55.760000000000	AED
4129	Solwezi	Solwezi	SLI		Zambia	ZM	-12.173889000000	26.366667000000	ZMK
4130	Waingapu	Waingapu	WGP		Indonesia	ID	-9.669167000000	120.301944000000	IDR
4131	Port Augusta	Port Augusta	PUG		Australia	AU	-32.506944000000	137.716667000000	AUD
4132	Jos	Jos	JOS		Nigeria	NG	9.639722000000	8.870000000000	NGN
4133	Norwalk	Norwalk	ORQ		USA	US	41.116667000000	-73.450000000000	USD
4134	Esquimalt	Esquimalt	YPF		Canada	CA	48.433333000000	-123.400000000000	CAD
4135	Vigra Airport	Aalesund	AES		Norway	NO	62.559644000000	6.116605000000	NOK
4136	Le Raizet Airport	Pointe A Pitre	PTP		Guadeloupe	GP	16.267500000000	-61.526389000000	EUR
4137	Otopeni International Airport	Bucharest	OTP		Romania	RO	44.571155000000	26.077063000000	ROL
4138	Yundum International Airport	Banjul	BJL		Gambia	GM	13.344060000000	-16.652200000000	GMD
4139	Minangkabau International Airport	Padang	PDG		Indonesia	ID	-0.786667000000	100.280556000000	IDR
4140	Tyler Pounds Regional Airport	Tyler	TYR		United States	US	32.351597000000	-95.410120000000	USD
4141	Tippi	Tippi	TIE		Ethiopia	ET	7.116667000000	35.383333000000	ETB
4142	Forres	Forres	FSS		United Kingdom	GB	57.650000000000	-3.566667000000	GBP
4143	Braintree	Braintree	WXF		United Kingdom	GB	51.966667000000	0.516667000000	GBP
4144	Moscow Belorussky Rail Stn	Moscow Belorussky Rail Stn	JQO		Russian Federation	RU	55.776389000000	37.580278000000	RUB
4145	Handan	Handan	HDG		China	CN	36.525833000000	114.425000000000	RMB
4146	Maimanah	Maimanah	MMZ		Afghanistan	AF	35.925833000000	64.765833000000	USD
4147	Glen Innes	Glen Innes	GLI		Australia	AU	-29.683333000000	151.700000000000	AUD
4148	Apiay	Apiay	API		Colombia	CO	4.068889000000	-73.051944000000	COP
4149	Friday Harbor SPB	Friday Harbor SPB	FBS		USA	US	48.540000000000	-123.016111000000	USD
4150	Vernal	Vernal	VEL		USA	US	40.443333000000	-109.510833000000	USD
4151	Montlucon	Montlucon	MCU		France	FR	46.226111000000	2.362778000000	EUR
4152	Dyce Airport	Aberdeen	ABZ		United Kingdom	GB	57.200253000000	-2.204186000000	GBP
4153	Daytona Beach International Airport	Daytona Beach	DAB		United States	US	29.185192000000	-81.060829000000	USD
4154	Blackpool Airport	Blackpool	BLK		United Kingdom	GB	53.778385000000	-3.041985000000	GBP
4155	Pico Island Airport	Pico Island (Azores)	PIX		Portugal	PT	38.466667000000	-28.300000000000	EUR
4156	Placencia	Placencia	PLJ		Belize	BZ	16.537222000000	-88.361111000000	BZD
4157	Papa Stour	Papa Stour	PSV		United Kingdom	GB	60.321944000000	-1.693333000000	GBP
4158	Lueneburg Rail Station	Lueneburg Rail Station	ZOG		Germany	DE	53.250000000000	10.400000000000	EUR
4159	Kirkuk	Kirkuk	KIK		Iraq	IQ	35.516667000000	44.300000000000	NID
4160	Negage	Negage	GXG		Angola	AO	-7.755278000000	15.288056000000	AOA
4161	Son-La	Son-La	SQH		Viet Nam	VN	21.219444000000	104.025000000000	VND
4162	Glasgow International Airport	Glasgow	GLA		United Kingdom	GB	55.864213000000	-4.431782000000	GBP
4163	Southwest Florida International Airport	Fort Myers	RSW		United States	US	26.542835000000	-81.754330000000	USD
4164	Saipan International Airport	Saipan	SPN		Northern Mariana Islands	MP	15.122178000000	145.723257000000	USD
4165	Hagerstown Regional Richard A Henson Field	Hagerstown	HGR		United States	US	39.707780000000	-77.730000000000	USD
4166	Rodrigues Island	Rodrigues Island	RRG		Mauritius	MU	-19.757778000000	63.361111000000	MUR
4167	Shoreham By Sea	Shoreham By Sea	ESH		United Kingdom	GB	50.835556000000	-0.297222000000	GBP
4168	Northallerton Rail Station	Northallerton Rail Station	XNO		United Kingdom	GB	54.333333000000	-1.433333000000	GBP
4169	Magan	Magan	GYG		Russian Federation	RU	62.103889000000	129.543056000000	RUB
4170	Bordj Mokhtar	Bordj Mokhtar	BMW		Algeria	DZ	21.377500000000	0.923611000000	DZD
4171	Quelimane	Quelimane	UEL		Mozambique	MZ	-17.855556000000	36.869167000000	MZM
4172	Billiluna	Billiluna	BIW		Australia	AU	-19.583333000000	127.633333000000	AUD
4173	Temora	Temora	TEM		Australia	AU	-34.416667000000	147.500000000000	AUD
4174	Sokoto	Sokoto	SKO		Nigeria	NG	12.916389000000	5.207222000000	NGN
4175	Pelican	Pelican	PEC		USA	US	57.957778000000	-136.230556000000	USD
4176	Puvirnituq	Puvirnituq	YPX		Canada	CA	60.048889000000	-77.285833000000	CAD
4177	Kirakira	Kirakira	IRA		Solomon Islands	SB	-10.449167000000	161.898611000000	SBD
4178	Nieuw Nickerie	Nieuw Nickerie	ICK		Suriname	SR	5.933333000000	-56.983333000000	SRG
4179	Hana	Hana	HNM		USA	US	20.795556000000	-156.014444000000	USD
4180	Hervey Rail Station	Hervey Rail Station	XDU		Canada	CA	45.850000000000	-72.466667000000	CAD
4181	Metz/Nancy Lorraine Tgv Rail Stn	Metz/Nancy Lorraine Tgv Rail Stn	XZI		France	FR	48.000000000000	6.000000000000	EUR
4182	Sfax El Maou Airport	Sfax	SFA		Tunisia	TN	34.716667000000	10.683333000000	TND
4183	Pune Airport	Pune	PNQ		India	IN	18.581389000000	73.920556000000	INR
4184	St. Mary's Airport	Isles Of Scilly	ISC		United Kingdom	GB	49.913334000000	-6.291667000000	GBP
4185	Termez	Termez	TMJ		Uzbekistan	UZ	37.286667000000	67.310000000000	UZS
4186	Lydd	Lydd	LYX		United Kingdom	GB	50.956111000000	0.939167000000	GBP
4187	London Ebbsfleet Intl Rail Station	London (GB)	XQE		United Kingdom	GB	51.443056000000	0.321111000000	GBP
4188	Sashylakh	Sashylakh	SYS		Russian Federation	RU	71.927778000000	114.080000000000	RUB
4189	Baise	Baise	AEB		China	CN	23.720000000000	106.960278000000	RMB
4190	Dera Ismail Khan	Dera Ismail Khan	DSK		Pakistan	PK	31.909444000000	70.896667000000	PKR
4191	Broken Hill	Broken Hill	BHQ		Australia	AU	-32.001389000000	141.471667000000	AUD
4192	Tennant Creek	Tennant Creek	TCA		Australia	AU	-19.634444000000	134.183333000000	AUD
4193	Atmautluak	Atmautluak	ATT		USA	US	60.866944000000	-162.273889000000	USD
4194	Santa Cruz Island	Santa Cruz Island	SCZ		Solomon Islands	SB	-10.719722000000	165.796389000000	SBD
4195	Allakaket	Allakaket	AET		USA	US	66.550556000000	-152.631944000000	USD
4196	Polk Inlet	Polk Inlet	POQ		USA	US	55.350000000000	-132.500000000000	USD
4197	Red Lake	Red Lake	YRL		Canada	CA	51.066944000000	-93.793056000000	CAD
4198	Kamberatoro	Kamberatoro	KDQ		Papua New Guinea	PG	-3.605556000000	141.050000000000	PGK
4199	Botopasie	Botopasie	BTO		Suriname	SR	4.218333000000	-55.446667000000	SRG
4200	Farmingdale	Farmingdale	FRG		USA	US	40.733333000000	-73.416667000000	USD
4201	Enid Woodring Municipal Apt	Enid	WDG		USA	US	36.380000000000	-97.791111000000	USD
4202	Morlaix	Morlaix	MXN		France	FR	48.600833000000	-3.816667000000	EUR
4203	Edinburgh Airport	Edinburgh	EDI		United Kingdom	GB	55.948143000000	-3.364177000000	GBP
4204	Hector International Airport	Fargo	FAR		United States	US	46.919529000000	-96.825508000000	USD
4205	Machrihanish Airport	Campbeltown	CAL		United Kingdom	GB	55.436390000000	-5.686667000000	GBP
4206	Vladikavkaz Airport	Vladikavkaz	OGZ		Russia	RU	43.200000000000	44.600000000000	RUB
4207	St Croix SPB	St Croix Island	SSB		Virgin Islands, US	VI	17.747778000000	-64.705556000000	USD
4208	Out Skerries	Out Skerries	OUK		United Kingdom	GB	60.425278000000	-0.749167000000	GBP
4209	Moelv Rail Station	Moelv Rail Station	XUJ		Norway	NO	60.929444000000	10.697500000000	NOK
4210	Pelotas	Pelotas	PET		Brazil	BR	-31.718333000000	-52.329722000000	BRL
4211	Tsushima	Tsushima	TSJ		Japan	JP	34.285000000000	129.330556000000	JPY
4212	Long Apung	Long Apung	LPU		Indonesia	ID	1.705000000000	114.970278000000	IDR
4213	Lakeba	Lakeba	LKB		Fiji	FJ	-18.199167000000	-178.816944000000	FJD
4214	Santa Cruz el Trompillo Apt	Santa Cruz	SRZ		Bolivia	BO	-17.803889000000	-63.177222000000	BOB
4215	Kitoi Bay	Kitoi Bay	KKB		USA	US	58.190556000000	-152.367778000000	USD
4216	Angling Lake	Angling Lake	YAX		Canada	CA	53.848333000000	-89.578056000000	CAD
4217	Costa Smeralda Airport	Olbia	OLB		Italy	IT	40.903143000000	9.514823000000	EUR
4218	Aswan Airport	Aswan	ASW		Egypt	EG	23.968022000000	32.824818000000	EGP
4219	Incheon International Airport	Seoul	ICN		Republic of Korea	KR	37.448526000000	126.451234000000	KRW
4220	Dundee Airport	Dundee	DND		United Kingdom	GB	56.454090000000	-3.014531000000	GBP
4221	Vila Do Porto Airport	Santa Maria (Azores)	SMA		Portugal	PT	36.966667000000	-25.100000000000	EUR
4222	Guaymas	Guaymas	GYM		Mexico	MX	27.968889000000	-110.925278000000	MXN
4223	Samsun Airport	Samsun	SSX		Turkey	TR	41.300000000000	36.316667000000	USD
4224	Paso de Los Libres	Paso de Los Libres	AOL		Argentina	AR	-29.683333000000	-57.150000000000	ARS
4225	Dayong	Dayong	DYG		China	CN	29.102778000000	110.446111000000	RMB
4226	Jomsom	Jomsom	JMO		Nepal	NP	28.780556000000	83.723056000000	NPR
4227	Christmas Creek Mine	Christmas Creek Mine	CKW		Australia	AU	-22.354167000000	119.642500000000	AUD
4228	Quine Hill	Quine Hill	UIQ		Vanuatu	VU	-17.550000000000	168.416667000000	VUV
4229	Cumberland	Cumberland	CBE		USA	US	39.600000000000	-78.766667000000	USD
4230	Sand Point	Sand Point	SDP		USA	US	55.315000000000	-160.522778000000	USD
4231	Sept-Iles	Sept-Iles	YZV		Canada	CA	50.223333000000	-66.265556000000	CAD
4232	Chernovtsy Airport	Chernovtsy	CWC		Ukraine	UA	48.266667000000	25.966667000000	UAH
4233	Guangzhou Baiyun International Airport	Guangzhou	CAN		China	CN	23.387862000000	113.297340000000	RMB
4234	E. T. Joshua	Saint Vincent	SVD		Saint Vincent and the Grenadines	VC	13.146040000000	-61.210380000000	XCD
4235	Leninakan Airport	Gyoumri	LWN		Armenia	AM	40.716667000000	43.833333000000	AMD
4236	Merle K (Mudhole) Smith Airport	Cordova	CDV		United States	US	60.493057000000	-145.470000000000	USD
4237	Tarragona/Camp Rail Station	Tarragona/Camp Rail Station	QGN		Spain	ES	41.191944000000	1.272778000000	EUR
4238	Newark Northgate Rail Station	Newark Northgate Rail Station	XNK		United Kingdom	GB	53.083333000000	-0.013611000000	GBP
4239	Magdeburg Rail Station	Magdeburg Rail Station	ZMG		Germany	DE	52.130833000000	11.626944000000	EUR
4240	Touggourt	Touggourt	TGR		Algeria	DZ	33.067778000000	6.088611000000	DZD
4241	Comilla	Comilla	CLA		Bangladesh	BD	23.433333000000	91.183333000000	BDT
4242	Ayers Rock	Ayers Rock	AYQ		Australia	AU	-25.186111000000	130.975556000000	AUD
4243	Paraparaumu	Paraparaumu	PPQ		New Zealand	NZ	-40.901111000000	174.988056000000	NZD
4244	Okondja	Okondja	OKN		Gabon	GA	-0.666667000000	13.666667000000	XAF
4245	Oneill	Oneill	ONL		USA	US	42.469167000000	-98.686944000000	USD
4246	Oshawa	Oshawa	YOO		Canada	CA	43.922222000000	-78.895278000000	CAD
4247	Guernsey Airport	Guernsey	GCI		United Kingdom	GB	49.432756000000	-2.595044000000	GBP
4248	Lilongwe International Airport	Lilongwe	LLW		Malawi	MW	-13.780039000000	33.780199000000	MWK
4249	Quaid-E-Azam International Airport	Karachi	KHI		Pakistan	PK	24.899986000000	67.168280000000	PKR
4250	Kirkwall Airport	Kirkwall	KOI		United Kingdom	GB	58.958057000000	-2.900556000000	GBP
4251	Port Antonio	Port Antonio	POT		Jamaica	JM	18.200000000000	-76.533333000000	JMD
4252	Bobadilla Rail Station	Bobadilla Rail Station	OZI		Spain	ES	37.050000000000	-4.700000000000	EUR
4253	London Victoria Rail Station	London Victoria Rail Station	ZEP		United Kingdom	GB	51.495000000000	-0.144722000000	GBP
4254	Tres Arroyos	Tres Arroyos	OYO		Argentina	AR	-38.366667000000	-60.250000000000	ARS
4255	Yushu	Yushu	YUS		China	CN	32.826667000000	97.121944000000	RMB
4256	Pailin	Pailin	PAI		Cambodia	KH	12.850000000000	102.583333000000	KHR
4257	Mono	Mono	MNY		Solomon Islands	SB	-7.416667000000	155.565278000000	SBD
4258	Moyobamba	Moyobamba	MBP		Peru	PE	-5.975000000000	-77.016667000000	PEN
4259	Indiana	Indiana	IDI		USA	US	40.633333000000	-79.100000000000	USD
4260	Shawinigan Rail Station	Shawinigan Rail Station	XFL		Canada	CA	46.550000000000	-72.750000000000	CAD
4261	Strasbourg Railway Station	Strasbourg Railway Station	XWG		France	FR	48.000000000000	7.000000000000	EUR
4262	Kharkov Airport	Kharkov	HRK		Ukraine	UA	49.920781000000	36.281187000000	UAH
4263	San Andres Island Airport	San Andres Island	ADZ		Colombia	CO	12.586047000000	-81.702208000000	COP
4264	Tiree Airport	Tiree	TRE		United Kingdom	GB	56.500557000000	-6.871389000000	GBP
4265	Feijo	Feijo	FEJ		Brazil	BR	-8.150000000000	-70.350000000000	BRL
4266	Mianyang	Mianyang	MIG		China	CN	31.428889000000	104.740833000000	RMB
4267	Butuan	Butuan	BXU		Philippines	PH	8.950556000000	125.481389000000	PHP
4268	Karratha	Karratha	KTA		Australia	AU	-20.712222000000	116.773333000000	AUD
4269	Gamarra	Gamarra	GRA		Colombia	CO	8.200000000000	-73.783333000000	COP
4270	Hawthorne	Hawthorne	HHR		USA	US	33.916667000000	-118.350000000000	USD
4271	Jasper Rail Station	Jasper	XDH		Canada	CA	52.876389000000	-118.078889000000	CAD
4272	Fuyuan Airport	Fuyuan County	FYJ		China	CN	48.197220000000	134.363330000000	RMB
4273	Kigali International Airport	Kigali	KGL		Rwanda	RW	-1.963042000000	30.135014000000	RWF
4274	Hefei Airport	Hefei	HFE		China	CN	31.850000000000	117.283333000000	RMB
4275	Trollhattan Airport	Trollhattan	THN		Sweden	SE	58.266666000000	12.300000000000	SEK
4276	Puerto Barrios	Puerto Barrios	PBR		Guatemala	GT	15.800000000000	-88.500000000000	GTQ
4277	Hohenems/Dornbirn	Hohenems/Dornbirn	HOH		Austria	AT	47.384444000000	9.699722000000	EUR
4278	Otta Rail Station	Otta Rail Station	XOR		Norway	NO	61.771944000000	9.536667000000	NOK
4279	Oriximina	Oriximina	ORX		Brazil	BR	-1.666667000000	-55.833333000000	BRL
4280	Turpan	Turpan	TLQ		China	CN	43.030278000000	89.097222000000	RMB
4281	Long Lellang	Long Lellang	LGL		Malaysia	MY	3.421111000000	115.153333000000	MYR
4282	Kaitaia	Kaitaia	KAT		New Zealand	NZ	-35.071111000000	173.286944000000	NZD
4283	Basse Terre	Basse Terre	BBR		Guadeloupe	GP	16.166667000000	-61.750000000000	EUR
4284	Coatesville	Coatesville	CTH		USA	US	39.966667000000	-75.816667000000	USD
4285	La Sarre	La Sarre	SSQ		Canada	CA	48.916667000000	-79.166667000000	CAD
4286	Richmond Rail Station	Richmond Rail Station	ZRD		USA	US	37.614167000000	-77.488889000000	USD
4287	Faisalabad Airport	Faisalabad	LYP		Pakistan	PK	31.363042000000	72.987572000000	PKR
4288	Novyj Urengoj Airport	Novyj Urengoj	NUX		Russia	RU	66.073350000000	76.522835000000	RUB
4289	Belo Tsiribihina	Belo Tsiribihina	BMD		Madagascar	MG	-19.686667000000	44.541944000000	MGA
4290	Hilversum Rail Station	Hilversum Rail Station	QYI		Netherlands	NL	52.233333000000	5.166667000000	EUR
4291	Orel	Orel	OEL		Russian Federation	RU	52.983333000000	36.100000000000	RUB
4292	Datong	Datong	DAT		China	CN	39.718889000000	113.146111000000	RMB
4293	Ranchi	Ranchi	IXR		India	IN	23.314167000000	85.321667000000	INR
4294	Barimunya	Barimunya	BYP		Australia	AU	-22.672500000000	119.165833000000	AUD
4295	Tauranga	Tauranga	TRG		New Zealand	NZ	-37.673333000000	176.198611000000	NZD
4296	Burlington (US) IA	Burlington (US) IA	BRL		USA	US	40.779444000000	-91.122500000000	USD
4297	Ruidoso	Ruidoso	RUI		USA	US	33.416667000000	-105.583333000000	USD
4298	Penticton	Penticton	YYF		Canada	CA	49.463056000000	-119.602222000000	CAD
4299	Nevsehir Airport	Nevsehir	NAV		Turkey	TR	38.633333000000	34.716667000000	USD
4300	Amausi Airport	Lucknow	LKO		India	IN	26.764257000000	80.884186000000	INR
4301	Minsk-1 International Airport	Minsk	MHP		Belarus	BY	53.850000000000	27.550000000000	BYR
4302	Ambatomainty	Ambatomainty	AMY		Madagascar	MG	-17.683333000000	45.666667000000	MGA
4303	London Euston Rail Station	London (GB)	QQU		United Kingdom	GB	51.533333000000	-0.133333000000	GBP
4304	Limburg Rail Station	Limburg Rail Station	ZNW		Germany	DE	50.383333000000	8.050000000000	EUR
4305	Aksu	Aksu	AKU		China	CN	41.262778000000	80.291944000000	RMB
4306	Fuvahmulak	Fuvahmulak	FVM		Maldives	MV	-0.309444000000	73.432778000000	MVR
4307	Blackall	Blackall	BKQ		Australia	AU	-24.432500000000	145.428056000000	AUD
4308	Raiatea Island	Raiatea Island	RFP		French Polynesia	PF	-16.722778000000	-151.465833000000	XPF
4309	Sao Nicolau Island	Sao Nicolau Island	SNE		Cape Verde	CV	16.588611000000	-24.284167000000	CVE
4310	Paf Warren	Paf Warren	PFA		USA	US	58.681389000000	-156.837500000000	USD
4311	Fort Chipewyan	Fort Chipewyan	YPY		Canada	CA	58.768333000000	-111.115833000000	CAD
4312	Jersey Airport	Jersey	JER		United Kingdom	GB	49.205297000000	-2.194344000000	GBP
4313	Exuma International Airport	George Town	GGT		Bahamas	BS	23.564018000000	-75.872475000000	BSD
4314	Penang International Airport	Penang	PEN		Malaysia	MY	5.292961000000	100.265173000000	MYR
4315	Tri Cities Regional Tn Va Airport	Blountville	TRI		United States	US	36.481110000000	-82.407850000000	USD
4316	Vohemar	Vohemar	VOH		Madagascar	MG	-13.366667000000	50.000000000000	MGA
4317	London Waterloo Rail Station	London Waterloo Rail Station	QQW		United Kingdom	GB	51.500000000000	-0.116667000000	GBP
4398	Palacios	Palacios	PCH		Honduras	HN	15.000000000000	-89.000000000000	HNL
4318	Sandefjord Rail Station	Sandefjord Rail Station	ZYS		Norway	NO	59.133333000000	10.224722000000	NOK
4319	Al Fallujah	Al Fallujah	TQD		Iraq	IQ	33.338056000000	43.596944000000	NID
4320	Bamiyan	Bamiyan	BIN		Afghanistan	AF	34.800000000000	67.816667000000	USD
4321	Canobie	Canobie	CBY		Australia	AU	-19.633333000000	140.916667000000	AUD
4322	Sola	Sola	SLH		Vanuatu	VU	-13.851944000000	167.537222000000	VUV
4323	Atlantic City Bader Field	Atlantic City	AIY		USA	US	39.366667000000	-74.450000000000	USD
4324	Sacramento Executive Apt	Sacramento	SAC		USA	US	38.516667000000	-121.500000000000	USD
4325	Churchill	Churchill	YYQ		Canada	CA	58.736667000000	-94.068611000000	CAD
4326	N'Djili Airport	Kinshasa	FIH		The Democratic Republic of The Congo	CD	-4.389588000000	15.447338000000	CDF
4327	Beijing Capital International Airport	Beijing	PEK		China	CN	40.078538000000	116.587095000000	RMB
4328	Lajes Airport	Terceira	TER		Portugal	PT	38.754074000000	-27.087570000000	EUR
4329	Contadora	Contadora	OTD		Panama	PA	8.629167000000	-79.034722000000	PAB
4330	Ramsgate Rail Station	Ramsgate Rail Station	QQR		United Kingdom	GB	51.333333000000	1.416667000000	GBP
4331	Salina Island	Salina Island	ZIQ		Italy	IT	38.558889000000	14.872778000000	EUR
4332	Wedjh	Wedjh	EJH		Saudi Arabia	SA	26.198611000000	36.476389000000	SAR
4333	Mala Mala	Mala Mala	AAM		South Africa	ZA	-24.818056000000	31.544722000000	ZAR
4334	Ternate	Ternate	TTE		Indonesia	ID	0.831389000000	127.381389000000	IDR
4335	Mota Lava	Mota Lava	MTV		Vanuatu	VU	-13.666111000000	167.711389000000	VUV
4336	Enugu	Enugu	ENU		Nigeria	NG	6.474167000000	7.561944000000	NGN
4337	Selibaby	Selibaby	SEY		Mauritania	MR	15.183333000000	-12.200000000000	MRO
4338	Pedro Bay	Pedro Bay	PDB		USA	US	59.795833000000	-154.123611000000	USD
4339	Prince Rupert Digby Island Apt	Prince Rupert	YPR		Canada	CA	54.286111000000	-130.444722000000	CAD
4340	La Parra Airport	Jerez De La Frontera	XRY		Spain and Canary Islands	ES	36.750614000000	-6.064535000000	EUR
4341	Hosea Kutako International Airport	Windhoek	WDH		Namibia	NA	-22.487345000000	17.463202000000	NAD
4342	Surat Thani Airport	Surat Thani	URT		Thailand	TH	9.133865000000	99.143198000000	THB
4343	Plymouth Airport	Plymouth	PLH		United Kingdom	GB	50.422337000000	-4.110009000000	GBP
4344	Changuinola	Changuinola	CHX		Panama	PA	9.458889000000	-82.515278000000	PAB
4345	St Andrews	St Andrews	ADX		United Kingdom	GB	56.366667000000	-2.866667000000	GBP
4346	Northampton	Northampton	ORM		United Kingdom	GB	52.305278000000	-0.792778000000	GBP
4347	Kherson	Kherson	KHE		Ukraine	UA	46.677222000000	32.507222000000	UAH
4348	Zhoushan	Zhoushan	HSN		China	CN	29.934722000000	122.361944000000	RMB
4349	Ormara	Ormara	ORW		Pakistan	PK	25.300000000000	64.583333000000	PKR
4350	Emae	Emae	EAE		Vanuatu	VU	-17.088056000000	168.341667000000	VUV
4351	Tol	Tol	TLO		Papua New Guinea	PG	-4.983333000000	152.033333000000	PGK
4352	Buckland	Buckland	BKC		USA	US	65.981667000000	-161.149167000000	USD
4353	Cologne Bonn Airport	Cologne	CGN		Germany	DE	50.878363000000	7.122224000000	EUR
4354	Southampton Airport	Southampton	SOU		United Kingdom	GB	50.950725000000	-1.361318000000	GBP
4355	Kagoshima Airport	Kagoshima	KOJ		Japan	JP	31.801224000000	130.715616000000	JPY
4356	Gainesville Regional Airport	Gainesville	GNV		United States	US	29.686142000000	-82.276794000000	USD
4357	Upala	Upala	UPL		Costa Rica	CR	10.783333000000	-85.033333000000	CRC
4358	Shetland Islands Scatsta Apt	Shetland Islands	SCS		United Kingdom	GB	60.433333000000	-1.283333000000	GBP
4359	Penrith Rail Station	Penrith Rail Station	XPF		United Kingdom	GB	54.666667000000	-2.733333000000	GBP
4360	Santa Isabel Rio Negro	Santa Isabel Rio Negro	IRZ		Brazil	BR	-0.378611000000	-64.992222000000	BRL
4361	Nanyang	Nanyang	NNY		China	CN	32.981111000000	112.615556000000	RMB
4362	Ewer	Ewer	EWE		Indonesia	ID	-5.483333000000	138.066667000000	IDR
4363	Maningrida	Maningrida	MNG		Australia	AU	-12.056111000000	134.234167000000	AUD
4364	San Tome	San Tome	SOM		Venezuela	VE	8.945278000000	-64.151111000000	VEB
4365	Kangersuatsiaq	Kangersuatsiaq	KGQ		Greenland	GL	72.381111000000	-55.536667000000	DKK
4366	Alert Bay	Alert Bay	YAL		Canada	CA	50.583333000000	-126.933333000000	CAD
4367	St Symphorien Airport	Tours	TUF		France	FR	47.428333000000	0.727500000000	EUR
4368	London Luton Airport	London	LTN		United Kingdom	GB	51.879768000000	-0.376232000000	GBP
4369	Ashgabat Airport	Ashgabat	ASB		Turkmenistan	TM	37.984183000000	58.366978000000	TMM
4370	Baia Mare Airport	Baia Mare	BAY		Romania	RO	47.650000000000	23.466667000000	ROL
4371	Ste Marie	Ste Marie	SMS		Madagascar	MG	-17.093889000000	49.815833000000	MGA
4372	Myrdal Rail Station	Myrdal Rail Station	XOL		Norway	NO	60.735556000000	7.123333000000	NOK
4373	Sao Paula de Olivenca	Sao Paula de Olivenca	OLC		Brazil	BR	-3.469722000000	-68.921389000000	BRL
4374	Turukhansk	Turukhansk	THX		Russian Federation	RU	65.797778000000	87.935556000000	RUB
4375	Labuan	Labuan	LBU		Malaysia	MY	5.297222000000	115.252500000000	MYR
4376	San Javier Airport	Murcia	MJV		Spain and Canary Islands	ES	37.775213000000	-0.819040000000	EUR
4377	St. Barthelemy Airport	Saint Barthelemy	SBH		Guadeloupe	GP	17.900000000000	-62.850000000000	EUR
4378	Phnom Penh International Airport	Phnom Penh	PNH		Cambodia	KH	11.546111000000	104.847778000000	KHR
4379	El Eden Airport	Armenia	AXM		Colombia	CO	4.452869000000	-75.768040000000	COP
4380	Pemba (TZ)	Pemba (TZ)	PMA		Tanzania United Republic of	TZ	-5.257222000000	39.811389000000	TZS
4381	Sira Rail Station	Sira Rail Station	XOQ		Norway	NO	58.417222000000	6.660278000000	NOK
4382	Neuquen	Neuquen	NQN		Argentina	AR	-38.948889000000	-68.155833000000	ARS
4383	Tacheng	Tacheng	TCG		China	CN	46.672778000000	83.341111000000	RMB
4384	Krakor	Krakor	KZD		Cambodia	KH	12.533333000000	104.150000000000	KHR
4385	Jajao	Jajao	JJA		Solomon Islands	SB	-8.213333000000	159.266667000000	SBD
4386	Wapenamanda	Wapenamanda	WBM		Papua New Guinea	PG	-5.635000000000	143.891667000000	PGK
4387	Myrtle Beach Grand Strand Apt	Myrtle Beach	CRE		USA	US	33.816667000000	-78.733333000000	USD
4388	Springdale	Springdale	SPZ		USA	US	36.183333000000	-94.133333000000	USD
4389	Masset	Masset	ZMT		Canada	CA	54.027500000000	-132.125278000000	CAD
4390	Mejit Island	Mejit Island	MJB		Marshall Islands	MH	10.283333000000	170.883333000000	USD
4391	Karasabai	Karasabai	KRG		Guyana	GY	4.016667000000	-59.516667000000	GYD
4392	Birch Creek	Birch Creek	KBC		USA	US	66.272222000000	-145.818889000000	USD
4393	Wyoming Rail Station	Wyoming Rail Station	XWY		Canada	CA	42.950000000000	-82.116667000000	CAD
4394	Guipavas Airport	Brest	BES		France	FR	48.445374000000	-4.415827000000	EUR
4395	Maun Airport	Maun	MUB		Botswana	BW	-19.970833000000	23.430556000000	BWP
4396	Dera Ghazi Khan Airport	Dera Ghazi Khan	DEA		Pakistan	PK	29.960556000000	70.485278000000	PKR
4397	Toronto City Centre Airport	Toronto	YTZ		Canada	CA	43.632023000000	-79.395850000000	CAD
4399	Harrogate	Harrogate	HRT		United Kingdom	GB	54.050000000000	-1.250000000000	GBP
4400	Birmingham New Street Rail Station	Birmingham (GB)	QQN		United Kingdom	GB	52.466667000000	-1.916667000000	GBP
4401	Dundee Rail Station	Dundee Rail Station	ZDU		United Kingdom	GB	56.466667000000	-2.966667000000	GBP
4402	Campos	Campos	CAW		Brazil	BR	-21.698333000000	-41.301667000000	BRL
4403	Kogalym	Kogalym	KGP		Russian Federation	RU	62.190556000000	74.533889000000	RUB
4404	Maamigili	Maamigili	VAM		Maldives	MV	3.470833000000	72.836667000000	MVR
4405	Goroka	Goroka	GKA		Papua New Guinea	PG	-6.081667000000	145.391944000000	PGK
4406	Wanganui	Wanganui	WAG		New Zealand	NZ	-39.962500000000	175.023056000000	NZD
4407	Waco James Connall Apt	Waco	CNW		USA	US	31.633333000000	-97.066667000000	USD
4408	Molokai Airport	Hoolehua	MKK		United States	US	21.152779000000	-157.100000000000	USD
4409	Buochs	Buochs	BXO		Switzerland	CH	46.966667000000	8.383333000000	CHF
4410	Berlin HBF Rail Station	Berlin	QPP		Germany	DE	52.516944000000	13.400000000000	EUR
4411	Kil Rail Station	Kil Rail Station	XXN		Sweden	SE	59.505000000000	13.315833000000	SEK
4412	Tangara Da Serra	Tangara Da Serra	TGQ		Brazil	BR	-14.656389000000	-57.448611000000	BRL
4413	Huangpu	Huangpu	ZMY		China	CN	23.094444000000	113.440000000000	RMB
4414	Banja Luka Airport	Banja Luka	BNX		Bosnia and Herzegovina	BA	44.933333000000	17.300000000000	BAM
4415	Manchester Airport	Manchester	MAN		United Kingdom	GB	53.362908000000	-2.273354000000	GBP
4416	Londrina Airport	Londrina	LDB		Brazil	BR	-23.328456000000	-51.137715000000	BRL
4417	Shenandoah Valley Regional Airport	Weyers Cave	SHD		United States	US	38.263890000000	-78.896670000000	USD
4418	Borkum	Borkum	BMK		Germany	DE	53.595556000000	6.709167000000	EUR
4419	Thirsk Rail Station	Thirsk Rail Station	XTK		United Kingdom	GB	54.233333000000	-1.333333000000	GBP
4420	Caldas Novas	Caldas Novas	CLV		Brazil	BR	-17.724722000000	-48.610000000000	BRL
4421	Karamay	Karamay	KRY		China	CN	45.466111000000	84.953889000000	RMB
4422	Gebe	Gebe	GEB		Indonesia	ID	-0.083333000000	129.333333000000	IDR
4423	Mougulu	Mougulu	GUV		Papua New Guinea	PG	-6.283333000000	142.416667000000	PGK
4424	Cochabamba	Cochabamba	CBB		Bolivia	BO	-17.421111000000	-66.177222000000	BOB
4425	Fayetteville Municipal Airport	Fayetteville (US) AR	FYV		USA	US	36.000000000000	-94.166667000000	USD
4426	Los Angeles Whiteman Apt	Los Angeles	WHP		USA	US	34.050000000000	-118.250000000000	USD
4427	St Yan	St Yan	SYT		France	FR	46.406389000000	4.021111000000	EUR
4428	Oakey	Oakey	OKY		Australia	AU	-27.411389000000	151.735278000000	AUD
4429	Bunia	Bunia	BUX		Congo Democratic Republic of	CD	1.565833000000	30.220833000000	CDF
4430	Cape Lisburne	Cape Lisburne	LUR		USA	US	68.875000000000	-166.110000000000	USD
4431	Fox Harbour	Fox Harbour	YFX		Canada	CA	52.373056000000	-55.673889000000	CAD
4432	Fertilia Airport	Alghero	AHO		Italy	IT	40.630405000000	8.295891000000	EUR
4433	Edinburgh Airport	Edinburgh	EDI		United Kingdom	GB	55.948143000000	-3.364177000000	GBP
4434	Almaty Airport	Almaty	ALA		Kazakhstan	KZ	43.346652000000	77.011455000000	KZT
4435	Machrihanish Airport	Campbeltown	CAL		United Kingdom	GB	55.436390000000	-5.686667000000	GBP
4436	Deadhorse Airport	Prudhoe Bay	SCC		United States	US	70.203636000000	-148.460110000000	USD
4437	Beles	Beles	PWI		Ethiopia	ET	11.333333000000	36.416667000000	ETB
4438	Out Skerries	Out Skerries	OUK		United Kingdom	GB	60.425278000000	-0.749167000000	GBP
4439	Haugastol Rail Station	Haugastol Rail Station	ZWJ		Norway	NO	60.511389000000	7.869167000000	NOK
4440	Sohag	Sohag	HMB		Egypt	EG	26.342778000000	31.742778000000	EGP
4441	Ampara (LK) 00	Ampara (LK) 00	ADP		Sri Lanka	LK	7.337500000000	81.625833000000	LKR
4442	Albany	Albany	ALH		Australia	AU	-34.943333000000	117.808889000000	AUD
4443	Salamo	Salamo	SAM		Papua New Guinea	PG	-9.666667000000	150.783333000000	PGK
4444	Dallas/Fort Worth Addison Apt	Dallas/Fort Worth	ADS		USA	US	32.970278000000	-96.837222000000	USD
4445	Petersons Point	Petersons Point	PNF		USA	US	58.684167000000	-156.843056000000	USD
4446	Rigolet	Rigolet	YRG		Canada	CA	54.179444000000	-58.457500000000	CAD
4447	Newcastle Airport	Newcastle	NCL		United Kingdom	GB	55.037062000000	-1.710629000000	GBP
4448	Angel Albino Corzo International Airport	Tuxtla Gutierrez	TGZ		Mexico	MX	16.563611000000	-93.022500000000	MXN
4449	Bilbao Airport	Bilbao	BIO		Spain and Canary Islands	ES	43.305534000000	-2.905808000000	EUR
4450	Kent International Airport	Manston	MSE		United Kingdom	GB	51.350000000000	1.350000000000	GBP
4451	Lynchburg Regional Preston Glenn Field	Lynchburg	LYH		United States	US	37.326942000000	-79.201110000000	USD
4452	Semera	Semera	SZE		Ethiopia	ET	11.786389000000	40.993056000000	ETB
4453	Murcia Rail Station	Murcia Rail Station	XUT		Spain	ES	37.975000000000	-1.131667000000	EUR
4454	Porto de Moz	Porto de Moz	PTQ		Brazil	BR	-1.738889000000	-52.244444000000	BRL
4455	Alxa Right Banner	Alxa Right Banner	RHT		China	CN	39.225278000000	101.549444000000	RMB
4456	Kambuaya	Kambuaya	KBX		Indonesia	ID	-1.000000000000	132.250000000000	IDR
4457	Koumac	Koumac	KOC		New Caledonia	NC	-20.546389000000	164.255556000000	XPF
4458	Puerto Berrio	Puerto Berrio	PBE		Colombia	CO	6.483333000000	-74.483333000000	COP
4459	Grand Canyon H/P	Grand Canyon	JGC		USA	US	35.975000000000	-112.140278000000	USD
4460	Kasabonika	Kasabonika	XKS		Canada	CA	53.523889000000	-88.643889000000	CAD
4461	Naval Air Station Key West	Key West	NQX		USA	US	24.576033000000	-81.688480000000	USD
4462	Narsarsuaq Airport	Narsarsuaq	UAK		Greenland	GL	61.166667000000	-45.316667000000	DKK
4463	Paris Orly Airport	Paris	ORY		France	FR	48.728283000000	2.359700000000	EUR
4464	Exeter Airport	Exeter	EXT		United Kingdom	GB	50.731109000000	-3.410968000000	GBP
4465	Northwest Florida Beaches International Airport	Panama City	ECP		United States	US	30.357803000000	-85.798923000000	USD
4466	Leros Airport	Leros	LRS		Greece	GR	37.516666000000	26.783333000000	EUR
4467	Vieques	Vieques	VQS		Puerto Rico	PR	18.134722000000	-65.493611000000	USD
4468	Ashford International Rail Station	Ashford International Rail Station	QDH		United Kingdom	GB	51.143333000000	0.874722000000	GBP
4469	Vitoria Rail Station	Vitoria Rail Station	VIO		Spain	ES	42.841389000000	-2.672500000000	EUR
4470	Wakefield Westgate Rail Station	Wakefield Westgate Rail Station	XWD		United Kingdom	GB	53.700000000000	-1.483333000000	GBP
4471	General Roca	General Roca	GNR		Argentina	AR	-39.033333000000	-67.583333000000	ARS
4472	Meixian	Meixian	MXZ		China	CN	24.264167000000	116.098333000000	RMB
4473	Cuyo	Cuyo	CYU		Philippines	PH	10.850000000000	121.000000000000	PHP
4474	Invercargill	Invercargill	IVC		New Zealand	NZ	-46.414722000000	168.313056000000	NZD
4475	Iquitos	Iquitos	IQT		Peru	PE	-3.784722000000	-73.308889000000	PEN
4476	Hot Springs	Hot Springs	HOT		USA	US	34.478056000000	-93.096111000000	USD
4477	Sudbury Rail Station	Sudbury	XDY		Canada	CA	46.619444000000	-80.802778000000	CAD
4478	Riviere-a-Pierre Rail Station	Riviere-a-Pierre Rail Station	XRP		Canada	CA	46.983333000000	-72.183333000000	CAD
4479	Laleu Airport	La Rochelle	LRH		France	FR	46.180556000000	-1.185833000000	EUR
4480	Belfast International Airport	Belfast	BFS		United Kingdom	GB	54.662397000000	-6.217616000000	GBP
4481	Velazco Astete Airport	Cuzco	CUZ		Peru	PE	-13.538429000000	-71.943714000000	PEN
4482	Plymouth Airport	Plymouth	PLH		United Kingdom	GB	50.422337000000	-4.110009000000	GBP
4483	Nome Airport	Nome	OME		United States	US	64.511390000000	-165.441670000000	USD
4484	St Andrews	St Andrews	ADX		United Kingdom	GB	56.366667000000	-2.866667000000	GBP
4485	Northampton	Northampton	ORM		United Kingdom	GB	52.305278000000	-0.792778000000	GBP
4486	Koping Rail Station	Koping Rail Station	XXI		Sweden	SE	59.506667000000	16.004167000000	SEK
4487	Tabatinga	Tabatinga	TBT		Brazil	BR	-4.255833000000	-69.936111000000	BRL
4488	Margate	Margate	MGH		South Africa	ZA	-30.857500000000	30.343056000000	ZAR
4489	Tanjung Selor	Tanjung Selor	TJS		Indonesia	ID	2.836389000000	117.373611000000	IDR
4490	Olpoi	Olpoi	OLJ		Vanuatu	VU	-14.883333000000	166.550000000000	VUV
4491	Brava	Brava	BVR		Cape Verde	CV	14.866667000000	-24.733333000000	CVE
4492	Lime Village	Lime Village	LVD		USA	US	61.350000000000	-155.466667000000	USD
4493	Koltsovo International Airport	Yekaterinburg	SVX		Russian Federation	RU	56.750335000000	60.804312000000	RUB
4494	Savannah/Hilton Head Airport	Savannah	SAV		United States	US	32.135800000000	-81.210588000000	USD
4495	Lajes Airport	Terceira	TER		Portugal	PT	38.754074000000	-27.087570000000	EUR
4496	North Caicos	North Caicos	NCA		Turks and Caicos Islands	TC	21.884167000000	-71.939444000000	USD
4497	Nordholz-Spieka	Nordholz-Spieka	NDZ		Germany	DE	53.768611000000	8.644722000000	EUR
4498	Elverum Rail Station	Elverum Rail Station	XUC		Norway	NO	60.884444000000	11.545278000000	NOK
4499	Puerto Madryn	Puerto Madryn	PMY		Argentina	AR	-42.759167000000	-65.102778000000	ARS
4500	Okino Erabu	Okino Erabu	OKE		Japan	JP	27.433333000000	128.616667000000	JPY
4501	Mangole	Mangole	MAL		Indonesia	ID	-1.883333000000	125.833333000000	IDR
4502	Kauehi	Kauehi	KHZ		French Polynesia	PF	-15.780833000000	-145.124167000000	XPF
4503	Manizales	Manizales	MZL		Colombia	CO	5.029722000000	-75.464722000000	COP
4504	Illorsuit	Illorsuit	IOT		Greenland	GL	71.239722000000	-53.555556000000	DKK
4505	Boulder Bus Station	Boulder	XHH		USA	US	39.909722000000	-104.117500000000	USD
4506	Blimbingsari Airport	Banyuwangi	BWX		Indonesia	ID	-8.310229000000	114.340460000000	IDR
4507	Nassau International Airport	Nassau	NAS		Bahamas	BS	25.048224000000	-77.463776000000	BSD
4508	Langkawi Airport	Langkawi	LGK		Malaysia	MY	6.342174000000	99.731403000000	MYR
4509	McGhee Tyson Airport	Knoxville	TYS		United States	US	35.805650000000	-83.989730000000	USD
4510	Gulu	Gulu	ULU		Uganda	UG	2.805833000000	32.271944000000	UGX
4511	Milton Keynes	Milton Keynes	KYN		United Kingdom	GB	52.033333000000	-0.700000000000	GBP
4512	Salisbury Rail Station	Salisbury Rail Station	XSR		United Kingdom	GB	51.083333000000	-1.800000000000	GBP
4513	Pilar	Pilar	PIL		Paraguay	PY	-26.850000000000	-58.316667000000	PYG
4514	Tongxiang Rail Station	Tongxiang Rail Station	TVX		China	CN	30.539167000000	120.563333000000	RMB
4515	Lhok Seumawe	Lhok Seumawe	LSW		Indonesia	ID	5.226667000000	96.950278000000	IDR
4516	Manchester Airport	Manchester	MAN		United Kingdom	GB	53.362908000000	-2.273354000000	GBP
4517	Pease Air Force Base	Portsmouth	PSM		United States	US	43.179583000000	-70.882722000000	USD
4518	Benj Matienzo Airport	Tucuman	TUC		Argentina	AR	-26.833332000000	-65.200000000000	ARS
4519	Sambava	Sambava	SVB		Madagascar	MG	-14.278611000000	50.174722000000	MGA
4520	Thirsk Rail Station	Thirsk Rail Station	XTK		United Kingdom	GB	54.233333000000	-1.333333000000	GBP
4521	Varandey	Varandey	VRI		Russian Federation	RU	68.848056000000	58.200278000000	RUB
4522	Saga	Saga	HSG		Japan	JP	33.149722000000	130.302222000000	JPY
4523	Camp Bastion	Camp Bastion	OAZ		Afghanistan	AF	31.855000000000	64.212222000000	USD
4524	Edward River	Edward River	EDR		Australia	AU	-14.900000000000	141.616667000000	AUD
4525	West Angelas	West Angelas	WLP		Australia	AU	-23.136944000000	118.706944000000	AUD
4526	Dodge City	Dodge City	DDC		USA	US	37.760278000000	-99.964167000000	USD
4527	Stillwater	Stillwater	SWO		USA	US	36.166667000000	-97.083333000000	USD
4528	Santa Clara Bus Station	Santa Clara Bus Station	ZSM		USA	US	37.350000000000	-121.966667000000	USD
4529	Mount Cook Apt	Mount Cook	MON		New Zealand	NZ	-43.783333000000	170.133333000000	NZD
4530	Sucre	Sucre	SRE		Bolivia	BO	-19.010833000000	-65.292778000000	BOB
4531	Kingfisher Lake	Kingfisher Lake	KIF		Canada	CA	53.012500000000	-89.855833000000	CAD
4532	Kattiniq/Donaldson Lake	Kattiniq/Donaldson Lake	YAU		Canada	CA	61.662778000000	-73.316944000000	CAD
4533	Garons Airport	Nimes	FNI		France	FR	43.750000000000	4.416667000000	EUR
4534	Edinburgh Airport	Edinburgh	EDI		United Kingdom	GB	55.948143000000	-3.364177000000	GBP
4535	Tancredo Neves International Airport	Belo Horizonte	CNF		Brazil	BR	-19.632417000000	-43.963213000000	BRL
4536	Machrihanish Airport	Campbeltown	CAL		United Kingdom	GB	55.436390000000	-5.686667000000	GBP
4537	New Bedford Regional Airport	New Bedford	EWB		United States	US	41.676945000000	-70.959170000000	USD
4538	Reynosa	Reynosa	REX		Mexico	MX	26.008889000000	-98.228611000000	MXN
4539	Out Skerries	Out Skerries	OUK		United Kingdom	GB	60.425278000000	-0.749167000000	GBP
4540	Viborg Rail Station	Viborg Rail Station	ZGX		Denmark	DK	56.433333000000	9.400000000000	DKK
4541	Dibaa	Dibaa	BYB		Oman	OM	25.616667000000	56.250000000000	OMR
4542	Mount Etjo Lodge	Mount Etjo Lodge	MJO		Namibia	NA	-21.016667000000	16.466667000000	NAD
4543	Bandar Lampung	Bandar Lampung	TKG		Indonesia	ID	-5.242222000000	105.178889000000	IDR
4544	Olympic Dam	Olympic Dam	OLP		Australia	AU	-30.485000000000	136.876667000000	AUD
4545	Mbuji-Mayi	Mbuji-Mayi	MJM		Congo Democratic Republic of	CD	-6.121111000000	23.568889000000	CDF
4546	Jacksonville Nas	Jacksonville (US) FL	NIP		USA	US	30.492778000000	-81.687222000000	USD
4547	Manitouwadge	Manitouwadge	YMG		Canada	CA	49.133333000000	-85.733333000000	CAD
4548	Niaqornaarsuk	Niaqornaarsuk	QMK		Greenland	GL	68.250000000000	-52.883333000000	DKK
4549	Bonaventure	Bonaventure	YVB		Canada	CA	48.070833000000	-65.458889000000	CAD
4550	La Parra Airport	Jerez De La Frontera	XRY		Spain and Canary Islands	ES	36.750614000000	-6.064535000000	EUR
4551	Fedl De Bachigualato Airport	Culiacan	CUL		Mexico	MX	24.766429000000	-107.469585000000	MXN
4552	Townsville Airport	Townsville	TSV		Australia	AU	-19.256506000000	146.770793000000	AUD
4553	George Air Force Base	Victorville	VCV		United States	US	34.533333000000	-117.300000000000	USD
4554	La Palma	La Palma	PLP		Panama	PA	8.403611000000	-78.142222000000	PAB
4555	Tudela Rail Station	Tudela Rail Station	EEL		Spain	ES	42.059444000000	-1.597500000000	EUR
4556	Woergl Bus Station	Woergl Bus Station	QXZ		Austria	AT	47.483333000000	12.066667000000	EUR
4557	Vitebsk	Vitebsk	VTB		Belarus	BY	55.126389000000	30.350278000000	BYR
4558	Kitadaito	Kitadaito	KTD		Japan	JP	25.950000000000	131.300000000000	JPY
4559	Mataram	Mataram	AMI		Indonesia	ID	-8.560833000000	116.094722000000	IDR
4560	Guari	Guari	GUG		Papua New Guinea	PG	-8.100000000000	146.883333000000	PGK
4561	Wanaka	Wanaka	WKA		New Zealand	NZ	-44.721944000000	169.246389000000	NZD
4562	Santiago De Compostela Airport	Santiago De Compostela	SCQ		Spain and Canary Islands	ES	42.897317000000	-8.420327000000	EUR
4563	Borgo Airport	Bobo Dioulasso	BOY		Burkina Faso	BF	11.163611000000	-4.324444000000	XOF
4564	Xiamen Gaoqi International Airport	Xiamen	XMN		China	CN	24.536883000000	118.127505000000	RMB
4565	Misurata Airport	Misurata	MRA		Libya	LY	32.400000000000	15.066667000000	LYD
4566	Grumeti	Grumeti	GTZ		Tanzania United Republic of	TZ	-2.165278000000	34.227778000000	TZS
4567	Ashford International Rail Station	Ashford International Rail Station	QDH		United Kingdom	GB	51.143333000000	0.874722000000	GBP
4568	Nottingham Rail Station	Nottingham	XNM		United Kingdom	GB	52.969444000000	-1.166667000000	GBP
4569	Koppang Rail Station	Koppang Rail Station	YVK		Norway	NO	61.573333000000	11.043056000000	NOK
4570	Kiryat Shmona	Kiryat Shmona	KSW		Israel	IL	33.216667000000	35.566667000000	ILS
4571	Indigo Bay Lodge	Indigo Bay Lodge	IBL		Mozambique	MZ	-21.701944000000	35.448333000000	MZM
4572	Surigao	Surigao	SUG		Philippines	PH	9.760833000000	125.481111000000	PHP
4573	Nonouti	Nonouti	NON		Kiribati	KI	-0.680556000000	174.350000000000	AUD
4574	Kindu	Kindu	KND		Congo Democratic Republic of	CD	-2.919167000000	25.915278000000	CDF
4575	Mt Pleasant	Mt Pleasant	MSD		USA	US	39.524722000000	-111.474444000000	USD
4576	Kangirsuk	Kangirsuk	YKG		Canada	CA	60.027222000000	-69.999722000000	CAD
4577	Eelde Airport	Groningen	GRQ		Netherlands	NL	53.120278000000	6.575556000000	EUR
4578	Nuuk Airport	Nuuk	GOH		Greenland	GL	64.181944000000	-51.725000000000	DKK
4579	Adelaide Airport	Adelaide	ADL		Australia	AU	-34.938176000000	138.537351000000	AUD
4580	Forbes Air Force Base	Topeka	FOE		United States	US	38.952500000000	-95.662500000000	USD
4581	Punta Islita	Punta Islita	PBP		Costa Rica	CR	3.851944000000	-67.906111000000	CRC
4582	Vilhelmina	Vilhelmina	VHM		Sweden	SE	64.579167000000	16.833611000000	SEK
4583	Valencia Rail Station	Valencia Rail Station	YJV		Spain	ES	39.466667000000	-0.377222000000	EUR
4584	Vila Rica	Vila Rica	VLP		Brazil	BR	-10.000000000000	-51.116667000000	BRL
4585	Wonan	Wonan	WOT		Chinese Taipei	TW	23.416667000000	119.500000000000	TWD
4586	Mundulkiri	Mundulkiri	MWV		Cambodia	KH	12.460556000000	107.190833000000	KHR
4587	Bristol Airport	Bristol	BRS		United Kingdom	GB	51.386756000000	-2.710659000000	GBP
4588	Duluth International Airport	Duluth	DLH		United States	US	46.838975000000	-92.180192000000	USD
4589	Bronnoy Airport	Bronnoysund	BNN		Norway	NO	65.461700000000	12.215772000000	NOK
4590	Pellston Regional Airport of Emmet County Airport	Pellston	PLN		United States	US	45.570830000000	-84.792780000000	USD
4591	Arvidsjaur	Arvidsjaur	AJR		Sweden	SE	65.590278000000	19.281944000000	SEK
4592	Venice Santa Lucia Rail Station	Venice Santa Lucia Rail Station	XVQ		Italy	IT	45.441111000000	12.321111000000	EUR
4593	Marilia	Marilia	MII		Brazil	BR	-22.196944000000	-49.926389000000	BRL
4594	Wanning Rail Station	Wanning Rail Station	WXJ		China	CN	18.810556000000	110.375833000000	RMB
4595	Nakhon Ratchasima	Nakhon Ratchasima	NAK		Thailand	TH	14.933333000000	102.083333000000	THB
4596	Namdrik Island	Namdrik Island	NDK		Marshall Islands	MH	5.633333000000	168.116667000000	USD
4597	Isiro	Isiro	IRP		Congo Democratic Republic of	CD	2.828611000000	27.587500000000	CDF
4598	Manley Hot Springs	Manley Hot Springs	MLY		USA	US	64.998056000000	-150.641111000000	USD
4599	Hay River	Hay River	YHY		Canada	CA	60.839722000000	-115.782778000000	CAD
4600	Charleville	Charleville	CTL		Australia	AU	-26.413333000000	146.262500000000	AUD
4601	Ouvea	Ouvea	UVE		New Caledonia	NC	-20.640556000000	166.572778000000	XPF
4602	Cape Girardeau	Cape Girardeau	CGI		USA	US	37.225278000000	-89.570833000000	USD
4603	Shaktoolik	Shaktoolik	SKK		USA	US	64.361111000000	-161.202500000000	USD
4604	Philadelphia Rail Station	Philadelphia	ZFV		USA	US	39.955833000000	-75.182222000000	USD
4605	Sale Airport	Rabat	RBA		Morocco	MA	34.036138000000	-6.748619000000	MAD
4606	Rajiv Gandhi International Airport	Hyderabad	HYD		India	IN	17.240000000000	78.428056000000	INR
4607	Erzincan Airport	Erzincan	ERC		Turkey	TR	39.711666000000	39.516945000000	USD
4608	Mexicali	Mexicali	MXL		Mexico	MX	32.630556000000	-115.241667000000	MXN
4609	Land's End	Land's End	LEQ		United Kingdom	GB	50.102778000000	-5.670556000000	GBP
4610	Hallsberg Rail Station	Hallsberg Rail Station	XWM		Sweden	SE	59.066944000000	15.111111000000	SEK
4611	Redencao	Redencao	RDC		Brazil	BR	-8.030278000000	-49.980000000000	BRL
4612	Wuyishan	Wuyishan	WUS		China	CN	27.706944000000	118.003056000000	RMB
4613	Semporna	Semporna	SMM		Malaysia	MY	4.450000000000	118.600000000000	MYR
4614	Young	Young	NGA		Australia	AU	-34.250000000000	148.250000000000	AUD
4615	Asaba	Asaba	ABB		Nigeria	NG	6.203056000000	6.667222000000	NGN
4616	Kwigillingok	Kwigillingok	KWK		USA	US	59.876389000000	-163.168611000000	USD
4617	Cross Lake	Cross Lake	YCR		Canada	CA	54.600000000000	-97.766667000000	CAD
4618	Show Low	Show Low	SOW		USA	US	34.266667000000	-110.000000000000	USD
4619	Albany Ny Rail Station	Albany (US) NY	ZLY		USA	US	42.647222000000	-73.737778000000	USD
4620	Ronaldsway Airport	Isle Of Man	IOM		United Kingdom	GB	54.086769000000	-4.634730000000	GBP
4621	Durham Tees Valley Airport	Durham Tees Valley	MME		United Kingdom	GB	54.512226000000	-1.434013000000	GBP
4622	Val De Cans Airport	Belem	BEL		Brazil	BR	-1.389865000000	-48.480003000000	BRL
4623	Cambridge Airport	Cambridge	CBG		United Kingdom	GB	52.200000000000	0.183333000000	GBP
4624	Wick Airport	Wick	WIC		United Kingdom	GB	58.456944000000	-3.086667000000	GBP
4625	St Thomas SPB	St Thomas Island	SPB		Virgin Islands, US	VI	18.337778000000	-64.939722000000	USD
4626	Emmen	Emmen	EML		Switzerland	CH	47.092222000000	8.304722000000	CHF
4627	Saudarkrokur	Saudarkrokur	SAK		Iceland	IS	65.731667000000	-19.572778000000	ISK
4628	Canarana	Canarana	CQA		Brazil	BR	-13.574167000000	-52.270278000000	BRL
4629	Okushiri	Okushiri	OIR		Japan	JP	42.066667000000	139.450000000000	JPY
4630	Hua Hin	Hua Hin	HHQ		Thailand	TH	12.630278000000	99.953333000000	THB
4631	Kalgoorlie-Boulder	Kalgoorlie-Boulder	KGI		Australia	AU	-30.791389000000	121.463611000000	AUD
4632	Maturin	Maturin	MUN		Venezuela	VE	9.749167000000	-63.153333000000	VEB
4633	Iron Mountain	Iron Mountain	IMT		USA	US	45.816667000000	-88.116667000000	USD
4634	Chiang Mai International Airport	Chiang Mai	CNX		Thailand	TH	18.769574000000	98.968409000000	THB
4635	Aspen Airport	Aspen	ASE		USA	US	39.219685000000	-106.864685000000	USD
4636	Malindi	Malindi	MYD		Kenya	KE	-3.229167000000	40.101667000000	KES
4637	Vieste	Vieste	VIF		Italy	IT	41.885278000000	16.176111000000	EUR
4638	Prague Holesovice Rail Station	Prague Holesovice Rail Station	XYJ		Czech Republic	CZ	50.083333000000	14.466667000000	CZK
4639	Hanzhong	Hanzhong	HZG		China	CN	33.063611000000	107.008056000000	RMB
4640	Puttaparthi	Puttaparthi	PUT		India	IN	14.133333000000	77.783333000000	INR
4641	Emerald	Emerald	EMD		Australia	AU	-23.570000000000	148.177778000000	AUD
4642	Wondoola	Wondoola	WON		Australia	AU	-18.666667000000	140.916667000000	AUD
4643	Diomede Island	Diomede Island	DIO		USA	US	65.758611000000	-168.953333000000	USD
4644	Tanana	Tanana	TAL		USA	US	65.174722000000	-152.106667000000	USD
4645	Princeton Jct Rail Station	Princeton Jct Rail Station	ZTJ		USA	US	40.304444000000	-74.621667000000	USD
4646	Luano	Lubumbashi	FBM		The Democratic Republic of The Congo	CD	-11.590833000000	27.529167000000	CDF
4647	Mactan International Airport	Cebu	CEB		Philippines	PH	10.313333000000	123.982778000000	PHP
4648	Roanoke Regional Airport	Roanoke	ROA		United States	US	37.320510000000	-79.970380000000	USD
4649	Mbeya	Mbeya	MBI		Tanzania United Republic of	TZ	-8.919722000000	33.463889000000	TZS
4650	London Euston Rail Station	London (GB)	QQU		United Kingdom	GB	51.533333000000	-0.133333000000	GBP
4651	Khmelnytskyi	Khmelnytskyi	HMJ		Ukraine	UA	49.416667000000	27.000000000000	UAH
4652	Xiahe	Xiahe	GXH		China	CN	34.818889000000	102.620833000000	RMB
4653	Latur	Latur	LTU		India	IN	18.411667000000	76.464444000000	INR
4654	Cowra	Cowra	CWT		Australia	AU	-33.850000000000	148.650000000000	AUD
4655	Terapo	Terapo	TEO		Papua New Guinea	PG	-8.083333000000	146.066667000000	PGK
4656	Auburn	Auburn	AUO		USA	US	32.616667000000	-85.433333000000	USD
4657	Ikerasaarsuk	Ikerasaarsuk	QRY		Greenland	GL	68.141111000000	-53.441667000000	DKK
4658	Kuujjuaq	Kuujjuaq	YVP		Canada	CA	58.091111000000	-68.427222000000	CAD
4659	Jersey Airport	Jersey	JER		United Kingdom	GB	49.205297000000	-2.194344000000	GBP
4660	La Macaza Airport	Mont Tremblant	YTM		Canada	CA	46.515556000000	-74.755278000000	CAD
4661	Jeremie	Jeremie	JEE		Haiti	HT	18.666667000000	-74.166667000000	HTG
4662	Valdosta Regional Airport	Valdosta	VLD		United States	US	30.783890000000	-83.277220000000	USD
4663	Cuenca Rail Station	Cuenca Rail Station	CEJ		Spain	ES	40.067500000000	-2.136667000000	EUR
4664	London Waterloo Rail Station	London Waterloo Rail Station	QQW		United Kingdom	GB	51.500000000000	-0.116667000000	GBP
4665	Mostar	Mostar	OMO		Bosnia and Herzegovina	BA	43.282778000000	17.845833000000	BAM
4666	Yuzhno-Kurilsk	Yuzhno-Kurilsk	DEE		Russian Federation	RU	43.961389000000	145.685556000000	RUB
4667	Kandla	Kandla	IXY		India	IN	23.112778000000	70.100278000000	INR
4668	Enewetak Island	Enewetak Island	ENT		Marshall Islands	MH	11.340833000000	162.327778000000	USD
4669	Taupo	Taupo	TUO		New Zealand	NZ	-38.740833000000	176.085000000000	NZD
4670	Bettles	Bettles	BTT		USA	US	66.913889000000	-151.529167000000	USD
4671	Takotna	Takotna	TCT		USA	US	62.992778000000	-156.070278000000	USD
4672	Boston South Rail Station	Boston	ZTO		USA	US	42.347778000000	-71.052222000000	USD
4673	Warsaw-Modlin Airport	Modlin	WMI		Poland	PL	52.451111000000	20.651667000000	PLN
4674	Batna Airport	Batna	BLJ		Algeria	DZ	35.566667000000	6.183333000000	DZD
4675	Atyrau Airport	Atyrau	GUW		Kazakhstan	KZ	47.122815000000	51.829554000000	KZT
4676	Matacan Airport	Salamanca	SLM		Spain and Canary Islands	ES	40.951942000000	-5.501944000000	EUR
4677	Silver Creek	Silver Creek	SVK		Belize	BZ	16.728611000000	-88.369167000000	BZD
4678	Ashford International Rail Station	Ashford International Rail Station	QDH		United Kingdom	GB	51.143333000000	0.874722000000	GBP
4679	Nottingham Rail Station	Nottingham	XNM		United Kingdom	GB	52.969444000000	-1.166667000000	GBP
4680	Wakefield Westgate Rail Station	Wakefield Westgate Rail Station	XWD		United Kingdom	GB	53.700000000000	-1.483333000000	GBP
4681	Rosario (AR)	Rosario (AR)	ROS		Argentina	AR	-32.903611000000	-60.784444000000	ARS
4682	Xingtai	Xingtai	XNT		China	CN	37.100000000000	114.500000000000	RMB
4683	Sinak	Sinak	NKD		Indonesia	ID	-3.833333000000	137.850000000000	IDR
4684	Manihiki Island	Manihiki Island	MHX		Cook Islands	CK	-10.368889000000	-161.000000000000	NZD
4685	Berberati	Berberati	BBT		Central African Republic	CF	4.216667000000	15.783333000000	XAF
4686	Latrobe	Latrobe	LBE		USA	US	40.275833000000	-79.404722000000	USD
4687	Dauphin	Dauphin	YDN		Canada	CA	51.100833000000	-100.052500000000	CAD
4688	Samos Airport	Samos	SMI		Greece	GR	37.691448000000	26.914418000000	EUR
4689	Vestmannaeyjar	Vestmannaeyjar	VEY		Iceland	IS	63.425000000000	-20.279167000000	ISK
4690	Vigo Rail Station	Vigo Rail Station	YJR		Spain	ES	42.234444000000	-8.713056000000	EUR
4691	Villa Gesell	Villa Gesell	VLG		Argentina	AR	-37.235278000000	-57.029722000000	ARS
4692	Wenshan	Wenshan	WNH		China	CN	23.558056000000	104.325556000000	RMB
4693	Wahai	Wahai	WBA		Indonesia	ID	-2.816667000000	129.483333000000	IDR
4694	Portland (AU)	Portland (AU)	PTJ		Australia	AU	-38.319444000000	141.466667000000	AUD
4695	Zouerate	Zouerate	OUZ		Mauritania	MR	22.757778000000	-12.476111000000	MRO
4696	Port Lions	Port Lions	ORI		USA	US	57.884444000000	-152.853056000000	USD
4697	Paulatuk	Paulatuk	YPC		Canada	CA	69.359444000000	-124.077500000000	CAD
4698	Kuusamo Airport	Kuusamo	KAO		Finland	FI	65.990278000000	29.233889000000	EUR
4699	Saskatoon Airport	Saskatoon	YXE		Canada	CA	52.169703000000	-106.690366000000	CAD
4700	La Garenne Airport	Agen	AGF		France	FR	44.173610000000	0.598611000000	EUR
4701	Fayetteville Regional Grannis Field	Fayetteville	FAY		United States	US	34.991320000000	-78.887220000000	USD
4702	Mampikony	Mampikony	WMP		Madagascar	MG	-16.075000000000	47.647222000000	MGA
4703	Ramsgate Rail Station	Ramsgate Rail Station	QQR		United Kingdom	GB	51.333333000000	1.416667000000	GBP
4704	Brno Bus Station	Brno	ZDN		Czech Republic	CZ	49.200000000000	16.633333000000	CZK
4705	Daxian	Daxian	DAX		China	CN	31.131944000000	107.430556000000	RMB
4706	Silchar	Silchar	IXS		India	IN	24.913056000000	92.978611000000	INR
4707	Emirau	Emirau	EMI		Papua New Guinea	PG	-1.650000000000	149.966667000000	PGK
4708	Taree	Taree	TRO		Australia	AU	-31.888611000000	152.513889000000	AUD
4709	Bartletts	Bartletts	BSZ		USA	US	58.266667000000	-157.483333000000	USD
4710	Rutland	Rutland	RUT		USA	US	43.529444000000	-72.949722000000	USD
4711	Charlottetown (CA) PE	Charlottetown (CA) PE	YYG		Canada	CA	46.290000000000	-63.121111000000	CAD
4712	Yenisehir Airport	Bursa	YEI		Turkey	TR	40.233333000000	29.550000000000	USD
4713	Airport Luis E. Magalhaes	Salvador	SSA		Brazil	BR	-12.913988000000	-38.335196000000	BRL
4714	Collooney Airport	Sligo	SXL		Ireland	IE	54.283333000000	-8.466667000000	EUR
4715	Lazaro Cardenas	Lazaro Cardenas	LZC		Mexico	MX	18.001667000000	-102.220556000000	MXN
4716	Milton Keynes	Milton Keynes	KYN		United Kingdom	GB	52.033333000000	-0.700000000000	GBP
4717	Salisbury Rail Station	Salisbury Rail Station	XSR		United Kingdom	GB	51.083333000000	-1.800000000000	GBP
4718	Olomouc Rail Station	Olomouc Rail Station	XJC		Czech Republic	CZ	49.592500000000	17.277778000000	CZK
4719	Hotan	Hotan	HTN		China	CN	37.038056000000	79.865000000000	RMB
4720	Pantnagar	Pantnagar	PGH		India	IN	29.031944000000	79.473611000000	INR
4721	Skavsta Airport	Stockholm	NYO		Sweden	SE	58.784247000000	16.922866000000	SEK
4722	Goloson International Airport	La Ceiba	LCE		Honduras	HN	15.740556000000	-86.857222000000	HNL
4723	Dresden Airport	Dresden	DRS		Germany	DE	51.124332000000	13.766082000000	EUR
4724	Guerrero Negro	Guerrero Negro	GUB		Mexico	MX	28.033333000000	-114.066667000000	MXN
4725	Skive	Skive	SQW		Denmark	DK	56.550278000000	9.173056000000	DKK
4726	Gotha Rail Station	Gotha Rail Station	ZGO		Germany	DE	50.939444000000	10.712778000000	EUR
4727	Qayyarah	Qayyarah	RQW		Iraq	IQ	35.766944000000	43.125000000000	NID
4728	Magaruque	Magaruque	MFW		Mozambique	MZ	-21.972222000000	35.591667000000	MZM
4729	Tomanggong	Tomanggong	TMG		Malaysia	MY	5.400000000000	118.650000000000	MYR
4730	Onslow	Onslow	ONS		Australia	AU	-21.668889000000	115.112500000000	AUD
4731	Makokou	Makokou	MKU		Gabon	GA	0.579167000000	12.890833000000	XAF
4732	San Diego Miramar NAS	San Diego	NKX		USA	US	32.869722000000	-117.140556000000	USD
4733	Makkovik	Makkovik	YMN		Canada	CA	55.077500000000	-59.188056000000	CAD
4734	Granites	Granites	GTS		Australia	AU	-26.950000000000	133.600000000000	AUD
4735	Woja	Woja	WJA		Marshall Islands	MH	7.466667000000	168.566667000000	USD
4736	Coldfoot	Coldfoot	CXF		USA	US	67.251667000000	-150.204167000000	USD
4737	Savoonga	Savoonga	SVA		USA	US	63.686389000000	-170.492500000000	USD
4738	Boston Rt128 Rail Station	Boston	ZRU		USA	US	42.184722000000	-71.142500000000	USD
4739	Edinburgh Airport	Edinburgh	EDI		United Kingdom	GB	55.948143000000	-3.364177000000	GBP
4740	Gen Rafael Buelna Airport	Mazatlan	MZT		Mexico	MX	23.167314000000	-106.270148000000	MXN
4741	Christmas Island Airport	Christmas Island	CXI		Kiribati	KI	1.966667000000	-157.450000000000	AUD
4742	Yanbu Airport	Yanbu	YNB		Saudi Arabia	SA	24.140734000000	38.063020000000	SAR
4743	St Croix SPB	St Croix Island	SSB		Virgin Islands, US	VI	17.747778000000	-64.705556000000	USD
4744	Rome Ostiense Rail Stn	Rome Ostiense Rail Stn	IRR		Italy	IT	41.872222000000	12.484722000000	EUR
4745	Rena Rail Station	Rena Rail Station	XKE		Norway	NO	61.134167000000	11.368889000000	NOK
4746	Joacaba	Joacaba	JCB		Brazil	BR	-27.171389000000	-51.553611000000	BRL
4747	Obihiro	Obihiro	OBO		Japan	JP	42.733333000000	143.216667000000	JPY
4748	Gunungsitoli	Gunungsitoli	GNS		Indonesia	ID	1.166944000000	97.704444000000	IDR
4749	Kadavu	Kadavu	KDV		Fiji	FJ	-19.058333000000	178.157500000000	FJD
4750	Machu Picchu	Machu Picchu	MFT		Peru	PE	-13.116667000000	-72.566667000000	PEN
4751	Nikolski	Nikolski	IKO		USA	US	52.941667000000	-168.850833000000	USD
4752	Alexandria Rail Station	Alexandria Rail Station	XFS		Canada	CA	45.318056000000	-74.639722000000	CAD
4753	Soellingen Airport	Karlsruhe/Baden Baden	FKB		Germany	DE	48.781031000000	8.089752000000	EUR
4754	Newcastle Airport	Newcastle	NCL		United Kingdom	GB	55.037062000000	-1.710629000000	GBP
4755	Akita Airport	Akita	AXT		Japan	JP	39.611771000000	140.220147000000	JPY
4756	Dundee Airport	Dundee	DND		United Kingdom	GB	56.454090000000	-3.014531000000	GBP
4757	Vila Do Porto Airport	Santa Maria (Azores)	SMA		Portugal	PT	36.966667000000	-25.100000000000	EUR
4758	Zarafshan	Zarafshan	AFS		Uzbekistan	UZ	41.615833000000	64.233056000000	UZS
4759	Bergen Rail Station	Bergen Rail Station	QFV		Norway	NO	60.383333000000	5.333333000000	NOK
4760	Pskov	Pskov	PKV		Russian Federation	RU	57.783889000000	28.395556000000	RUB
4761	Texarkana Regional Webb Field	Texarkana	TXK		United States	US	33.456390000000	-93.989170000000	USD
4762	Mizan Teferi	Mizan Teferi	MTF		Ethiopia	ET	6.966667000000	35.533333000000	ETB
4763	Lemwerder	Lemwerder	XLW		Germany	DE	53.135278000000	8.617778000000	EUR
4764	Munich HBF Rail Station	Munich	ZMU		Germany	DE	48.150000000000	11.583333000000	EUR
4765	Duqm	Duqm	JNJ		Oman	OM	19.499167000000	57.641111000000	OMR
4766	Chipata	Chipata	CIP		Zambia	ZM	-13.560000000000	32.587500000000	ZMK
4767	Bali	Bali	BAJ		Papua New Guinea	PG	-4.883333000000	149.133333000000	PGK
4768	Sehulea	Sehulea	SXH		Papua New Guinea	PG	-10.216667000000	150.350000000000	PGK
4769	Aappilattoq	Aappilattoq	AOQ		Greenland	GL	72.886944000000	-55.596111000000	DKK
4770	Iginniarfik	Iginniarfik	QFI		Greenland	GL	68.147222000000	-53.169444000000	DKK
4771	Thompson	Thompson	YTH		Canada	CA	55.801111000000	-97.864167000000	CAD
4772	Bydgoszcz Airport	Bydgoszcz	BZG		Poland	PL	53.096667000000	17.978611000000	PLN
4773	Bole Airport	Addis Ababa	ADD		Ethiopia	ET	8.983759000000	38.795899000000	ETB
4774	Rahim Yar Khan Airport	Rahim Yar Khan	RYK		Pakistan	PK	28.391780000000	70.286621000000	PKR
4775	Wenzhou Airport	Wenzhou	WNZ		China	CN	27.915660000000	120.847380000000	RMB
4776	Nakuru	Nakuru	NUU		Kenya	KE	-0.298333000000	36.159167000000	KES
4777	Storekvina Rail Station	Storekvina Rail Station	XUV		Norway	NO	58.379167000000	6.958056000000	NOK
4778	Pouso Alegre	Pouso Alegre	PPY		Brazil	BR	-22.288889000000	-45.919444000000	BRL
4779	Uliastai	Uliastai	ULZ		Mongolia	MN	47.710278000000	96.525556000000	MNT
4780	Redang	Redang	RDN		Malaysia	MY	5.765278000000	103.006944000000	MYR
4781	Moro	Moro	MXH		Papua New Guinea	PG	-6.362778000000	143.231111000000	PGK
4782	Trujillo	Trujillo	TRU		Peru	PE	-8.084722000000	-79.109444000000	PEN
4783	Port Clarence	Port Clarence	KPC		USA	US	65.250000000000	-166.850000000000	USD
4784	Blanc Sablon	Blanc Sablon	YBX		Canada	CA	51.443611000000	-57.185278000000	CAD
4785	Aktion Airport	Preveza	PVK		Greece	GR	38.926389000000	20.765833000000	EUR
4786	Kulusuk Airport	Kulusuk	KUS		Greenland	GL	65.566667000000	-37.116667000000	DKK
4787	Aden International Airport	Aden	ADE		Republic of Yemen	YE	12.826116000000	45.037535000000	YER
4788	Arcata Airport	Mckinleyville	ACV		United States	US	40.970913000000	-124.106926000000	USD
4789	Port Berge	Port Berge	WPB		Madagascar	MG	-15.583333000000	47.616667000000	MGA
4790	Odense Airport	Odense	ODE		Denmark	DK	55.476667000000	10.330833000000	DKK
4791	Khandyga	Khandyga	KDY		Russian Federation	RU	62.788333000000	136.851389000000	RUB
4792	Hohhot	Hohhot	HET		China	CN	40.851389000000	111.824167000000	RMB
4793	Mianwali	Mianwali	MWD		Pakistan	PK	32.583333000000	71.550000000000	PKR
4794	Bora Bora	Bora Bora	BOB		French Polynesia	PF	-16.444444000000	-151.751389000000	XPF
4795	Arona	Arona	RNA		Solomon Islands	SB	-9.860833000000	161.979722000000	SBD
4796	Tamale	Tamale	TML		Ghana	GH	9.557222000000	-0.863333000000	GHC
4797	Pikwitonei	Pikwitonei	PIW		Canada	CA	55.589444000000	-97.163611000000	CAD
4798	Kenora	Kenora	YQK		Canada	CA	49.788333000000	-94.363056000000	CAD
4799	Luxembourg Airport	Luxembourg	LUX		Luxembourg	LU	49.631113000000	6.209539000000	EUR
4800	Lambert-St. Louis International Airport	Saint Louis	STL		United States	US	38.742279000000	-90.365869000000	USD
4801	Alderney Airport	Alderney	ACI		United Kingdom	GB	49.709347000000	-2.215369000000	GBP
4802	Helle Airport	Svolvaer	SVJ		Norway	NO	68.244980000000	14.667774000000	NOK
4803	Antalaha	Antalaha	ANM		Madagascar	MG	-14.999444000000	50.320278000000	MGA
4804	Hamar	Hamar	HMR		Norway	NO	60.800000000000	11.100000000000	NOK
4805	Stafford Rail Station	Stafford Rail Station	XVB		United Kingdom	GB	52.800000000000	-2.116667000000	GBP
4806	London Liverpool Street Rail Station	London Liverpool Street Rail Station	ZLS		United Kingdom	GB	51.518056000000	-0.082778000000	GBP
4807	Ilha Comandatuba/una	Ilha Comandatuba/una	UNA		Brazil	BR	-15.355278000000	-38.998889000000	BRL
4808	Baruun-urt	Baruun-urt	UUN		Mongolia	MN	46.660278000000	113.285278000000	MNT
4809	Melangguane	Melangguane	MNA		Indonesia	ID	4.006667000000	126.673611000000	IDR
4810	King Island	King Island	KNS		Australia	AU	-39.877500000000	143.878333000000	AUD
4811	Otu	Otu	OTU		Colombia	CO	6.983333000000	-74.716667000000	COP
4812	Aasiaat	Aasiaat	JEG		Greenland	GL	68.721111000000	-52.793611000000	DKK
4813	Joliette Rail Station	Joliette Rail Station	XJL		Canada	CA	46.016667000000	-73.450000000000	CAD
4814	Hyeres Airport	Toulon	TLN		France	FR	43.093489000000	6.159303000000	EUR
4815	London Gatwick Airport	London	LGW		United Kingdom	GB	51.156807000000	-0.161863000000	GBP
4816	Pontiac Airport	Pontiac	PTK		United States	US	42.664722000000	-83.411389000000	USD
4817	Saint Tropez FR	Saint Tropez	LTT		France	FR	43.283333000000	6.633333000000	EUR
4818	El Real	El Real	ELE		Panama	PA	8.116667000000	-77.716667000000	PAB
4819	Langeoog	Langeoog	LGO		Germany	DE	53.750000000000	7.483333000000	EUR
4820	Hamm Rail Station	Hamm Rail Station	ZNB		Germany	DE	51.683333000000	7.800000000000	EUR
4821	Jumeirah Beach Dubai Bus Station	Jumeirah Beach Dubai Bus Station	ZXZ		United Arab Emirates	AE	25.416667000000	55.466667000000	AED
4822	Dharamsala	Dharamsala	DHM		India	IN	32.165278000000	76.260556000000	INR
4823	Casino	Casino	CSI		Australia	AU	-28.883333000000	153.066667000000	AUD
4824	Utirik Island	Utirik Island	UTK		Marshall Islands	MH	11.233333000000	169.866667000000	USD
4825	Creston	Creston	CFQ		Canada	CA	49.036944000000	-116.498333000000	CAD
4826	New York East 34th Street H/P	New York	TSS		USA	US	40.742500000000	-73.972222000000	USD
4827	Newport News Rail Station	Newport News Rail Station	ZZD		USA	US	36.366667000000	3.833333000000	USD
4828	Cardiff-Wales Airport	Cardiff	CWL		United Kingdom	GB	51.398768000000	-3.339075000000	GBP
4829	Norfolk International Airport	Norfolk	ORF		United States	US	36.898583000000	-76.206295000000	USD
4830	Banak Airport	Lakselv	LKL		Norway	NO	70.067780000000	24.973612000000	NOK
4831	Andros Town	Andros Town	ASD		Bahamas	BS	24.698333000000	-77.795556000000	BSD
4832	Egilsstadir	Egilsstadir	EGS		Iceland	IS	65.283333000000	-14.401389000000	ISK
4833	Sert	Sert	SRX		Libya	LY	31.063333000000	16.595000000000	LYD
4834	Chaghcharan	Chaghcharan	CCN		Afghanistan	AF	34.526389000000	65.270833000000	USD
4835	Aniwa	Aniwa	AWD		Vanuatu	VU	-19.237500000000	169.601111000000	VUV
4836	Siwea	Siwea	SWE		Papua New Guinea	PG	-6.283333000000	147.550000000000	PGK
4837	Alitak	Alitak	ALZ		USA	US	56.898889000000	-154.249722000000	USD
4838	Bella Coola	Bella Coola	QBC		Canada	CA	52.387500000000	-126.595833000000	CAD
4839	Pembroke	Pembroke	YTA		Canada	CA	45.866944000000	-77.250000000000	CAD
4840	Portoroz Airport	Portoroz	POW		Slovenia	SI	45.516667000000	13.583333000000	EUR
4841	Camilo Dazo Airport	Cucuta	CUC		Colombia	CO	7.927108000000	-72.508149000000	COP
4842	Gods Narrows	Gods Narrows	YGO		Canada	CA	54.551667000000	-94.485000000000	CAD
4843	Tirstrup Airport	Aarhus	AAR		Denmark	DK	56.308230000000	10.626351000000	DKK
4844	Lehigh Valley International Airport	Allentown	ABE		United States	US	40.651573000000	-75.434366000000	USD
4845	Karup Airport	Karup	KRP		Denmark	DK	56.300000000000	9.116667000000	DKK
4846	Governors Harbour	Governors Harbour	GHB		Bahamas	BS	25.284722000000	-76.331111000000	BSD
4847	Sanday	Sanday	NDY		United Kingdom	GB	59.250278000000	-2.575000000000	GBP
4848	London Paddington Rail Station	London (GB)	QQP		United Kingdom	GB	51.517222000000	-0.177778000000	GBP
4849	Nykoping Rail Station	Nykoping Rail Station	XWZ		Sweden	SE	58.755556000000	16.994722000000	SEK
4850	Santa Fe (AR)	Santa Fe (AR)	SFN		Argentina	AR	-31.710833000000	-60.811389000000	ARS
4851	Taipa	Taipa	YFT		Macao (sar) China	MO	22.164167000000	113.576944000000	MOP
4852	Tuyhoa	Tuyhoa	TBB		Viet Nam	VN	13.049444000000	109.333611000000	VND
4853	Normanton	Normanton	NTN		Australia	AU	-17.683611000000	141.070278000000	AUD
4854	Labe	Labe	LEK		Guinea	GN	11.328333000000	-12.300833000000	GNF
4855	Kayenta	Kayenta	MVM		USA	US	36.702778000000	-110.233333000000	USD
4856	Kirkland Lake	Kirkland Lake	YKX		Canada	CA	48.150000000000	-80.033333000000	CAD
4857	Kogalniceanu Airport	Constanta	CND		Romania	RO	44.350000000000	28.483333000000	ROL
4858	Kumasi Airport	Kumasi	KMS		Ghana	GH	6.712500000000	-1.591111000000	GHC
4859	Simpang Tiga Airport	Pekanbaru	PKU		Indonesia	ID	0.464563000000	101.446883000000	IDR
4860	Yellowstone Regional Airport	Cody Yellowstone	COD		United States	US	44.513400000000	-109.031000000000	USD
4861	Fair Isle	Fair Isle	FIE		United Kingdom	GB	59.534722000000	-1.628611000000	GBP
4862	Schiphol Rail Station	Schiphol Rail Station	SPL		Netherlands	NL	52.300000000000	4.800000000000	EUR
4863	Inverness Rail Station	Inverness Rail Station	ZIV		United Kingdom	GB	57.450000000000	-4.250000000000	GBP
4864	Umuarama	Umuarama	UMU		Brazil	BR	-23.798611000000	-53.313889000000	BRL
4865	Ulsan	Ulsan	USN		Korea Republic of	KR	35.593611000000	129.351667000000	KRW
4866	Roti	Roti	RTI		Indonesia	ID	-10.483333000000	123.366667000000	IDR
4867	Madang	Madang	MAG		Papua New Guinea	PG	-5.207222000000	145.788611000000	PGK
4868	Quibdo	Quibdo	UIB		Colombia	CO	5.690833000000	-76.641111000000	COP
4869	Port Williams	Port Williams	KPR		USA	US	58.488611000000	-152.583056000000	USD
4870	Cambridge Bay	Cambridge Bay	YCB		Canada	CA	69.108056000000	-105.138333000000	CAD
4871	Biard Airport	Poitiers	PIS		France	FR	46.586111000000	0.306389000000	EUR
4872	Inverness Airport	Inverness	INV		United Kingdom	GB	57.539346000000	-4.063738000000	GBP
4873	Fresno Yosemite International Airport	Fresno	FAT		United States	US	36.769624000000	-119.720236000000	USD
4874	Tinian Airport	Tinian	TIQ		Northern Mariana Islands	MP	14.994319000000	145.626344000000	USD
4875	Linkoping City Airport	Linkoping	LPI		Sweden	SE	58.406944000000	15.656944000000	SEK
4876	Tortola West End SPB	Tortola	TOV		Virgin Islands, British	VG	18.387500000000	-64.702778000000	USD
4877	Kings Lynn	Kings Lynn	KNF		United Kingdom	GB	52.750000000000	0.400000000000	GBP
4878	Vennesla Rail Station	Vennesla Rail Station	XXE		Norway	NO	58.252778000000	7.967778000000	NOK
4879	Sorocaba	Sorocaba	SOD		Brazil	BR	-23.483333000000	-47.450000000000	BRL
4880	Mvuu Camp	Mvuu Camp	VUU		Malawi	MW	-14.833333000000	35.300000000000	MWK
4881	Afutara	Afutara	AFT		Solomon Islands	SB	-9.191111000000	160.949167000000	SBD
4882	Norsup	Norsup	NUS		Vanuatu	VU	-16.078056000000	167.399722000000	VUV
4883	Lastourville	Lastourville	LTL		Gabon	GA	-0.833333000000	12.750000000000	XAF
4884	Monticello (US) UT	Monticello (US) UT	MXC		USA	US	37.866667000000	-109.350000000000	USD
4885	Wha Ti Lac la Martre	Wha Ti Lac la Martre	YLE		Canada	CA	63.132222000000	-117.247500000000	CAD
4886	Cardiff Central Railway Station	Cardiff	CFW		United Kingdom	GB	51.475500000000	-3.178000000000	GBP
4887	Birmingham International Airport	Birmingham	BHX		United Kingdom	GB	52.452518000000	-1.733256000000	GBP
4888	Sanya Airport	Sanya	SYX		China	CN	18.310631000000	109.409709000000	RMB
4889	Vila Real Airport	Vila Real	VRL		Portugal	PT	41.300000000000	-7.750000000000	EUR
4890	Doany	Doany	DOA		Madagascar	MG	-14.366667000000	49.516667000000	MGA
4891	Sarpsborg Rail Station	Sarpsborg Rail Station	XKQ		Norway	NO	59.285833000000	11.118056000000	NOK
4892	Loncopue	Loncopue	LCP		Argentina	AR	-38.083333000000	-70.666667000000	ARS
4893	Polyarny	Polyarny	PYJ		Russian Federation	RU	66.400556000000	112.030278000000	RUB
4894	Mukah	Mukah	MKM		Malaysia	MY	2.906944000000	112.075000000000	MYR
4895	Laverton	Laverton	LVO		Australia	AU	-28.613611000000	122.423889000000	AUD
4896	Ocana	Ocana	OCV		Colombia	CO	8.250000000000	-73.783333000000	COP
4897	Ironwood	Ironwood	IWD		USA	US	46.527778000000	-90.132778000000	USD
4898	St Hyacinthe Rail Station	St Hyacinthe Rail Station	XIM		Canada	CA	45.616667000000	-72.950000000000	CAD
4899	Roumanieres Airport	Bergerac	EGC		France	FR	44.850000000000	0.483333000000	EUR
4900	Samana El Catey Airport	El Catey/Samana	AZS		Dominican Republic	DO	19.270555000000	-69.736944000000	DOP
4901	Buayan Airport	General Santos	GES		Philippines	PH	6.108066000000	125.234237000000	PHP
4902	Elmira Corning Regional Airport	Horseheads	ELM		United States	US	42.163040000000	-76.895860000000	USD
4903	Masai Mara	Masai Mara	MRE		Kenya	KE	-1.404444000000	35.009444000000	KES
4904	Sechelt	Sechelt	YHS		Canada	CA	49.466667000000	-123.750000000000	CAD
4905	Milano Malpensa Airport	Milan	MXP		Italy	IT	45.627405000000	8.712370000000	EUR
4906	Ndjamena Airport	Ndjamena	NDJ		Chad	TD	12.129056000000	15.034215000000	XAF
4907	Jeju International Airport	Jeju	CJU		Republic of Korea	KR	33.506698000000	126.493119000000	KRW
4908	Manhattan Regional Airport	Manhattan	MHK		United States	US	39.142223000000	-96.668890000000	USD
4909	Bakkafjordur	Bakkafjordur	BJD		Iceland	IS	66.021944000000	-14.824444000000	ISK
4910	Toledo Rail Station	Toledo Rail Station	XTJ		Spain	ES	39.862500000000	-4.011111000000	EUR
4911	Itabuna	Itabuna	ITN		Brazil	BR	-14.800000000000	-39.383333000000	BRL
4912	Korla	Korla	KRL		China	CN	41.699167000000	86.130278000000	RMB
4913	Amahai	Amahai	AHI		Indonesia	ID	-3.333333000000	128.916667000000	IDR
4914	Kaikoura	Kaikoura	KBZ		New Zealand	NZ	-42.416667000000	173.600000000000	NZD
4915	Bahia Solano	Bahia Solano	BSC		Colombia	CO	6.203056000000	-77.395278000000	COP
4916	Fort Pierce	Fort Pierce	FPR		USA	US	27.483333000000	-80.366667000000	USD
4917	Chandalar	Chandalar	WCR		USA	US	67.500000000000	-148.500000000000	USD
4918	Ile D'yeu	Ile D'yeu	IDY		France	FR	46.718611000000	-2.391111000000	EUR
4919	Snilow Airport	Lviv	LWO		Ukraine	UA	49.816418000000	23.955319000000	UAH
4920	Grant County Airport	Moses Lake	MWH		United States	US	47.205000000000	-119.315556000000	USD
4921	Pamplona Airport	Pamplona	PNA		Spain and Canary Islands	ES	42.767498000000	-1.639347000000	EUR
4922	Ocho Rios	Ocho Rios	OCJ		Jamaica	JM	18.400000000000	-76.983333000000	JMD
4923	Angelholm/Helsingborg Heliport	Angelholm/Helsingborg	JHE		Sweden	SE	56.050000000000	12.700000000000	SEK
4924	Lipari Island	Lipari Island	ZIP		Italy	IT	38.465556000000	14.958333000000	EUR
4925	Tarauaca	Tarauaca	TRQ		Brazil	BR	-8.150000000000	-70.766667000000	BRL
4926	Zunyi	Zunyi	ZYI		China	CN	27.811111000000	107.246111000000	RMB
4927	Phrae	Phrae	PRH		Thailand	TH	18.131667000000	100.164722000000	THB
4928	Maitland	Maitland	MTL		Australia	AU	-32.733333000000	151.550000000000	AUD
4929	Nema	Nema	EMN		Mauritania	MR	16.621944000000	-7.316667000000	MRO
4930	Mcgrath	Mcgrath	MCG		USA	US	62.953611000000	-155.605556000000	USD
4931	Geraldton (CA)	Geraldton (CA)	YGQ		Canada	CA	49.778889000000	-86.937500000000	CAD
4932	N. Kazantzakis Airport	Heraklion	HER		Greece	GR	35.336630000000	25.174193000000	EUR
4933	Spokane International Airport	Spokane	GEG		United States	US	47.625147000000	-117.537638000000	USD
4934	Horta Airport	Horta (Azores)	HOR		Portugal	PT	38.520000000000	-28.717222000000	EUR
4935	Middle Caicos	Middle Caicos	MDS		Turks and Caicos Islands	TC	21.783333000000	-71.766667000000	USD
4936	Heidelberg	Heidelberg	HDB		Germany	DE	49.393333000000	8.651944000000	EUR
4937	Vinstra Rail Station	Vinstra Rail Station	XKZ		Norway	NO	61.595000000000	9.746667000000	NOK
4938	Necochea	Necochea	NEC		Argentina	AR	-38.488889000000	-58.815833000000	ARS
4939	Rail (generic) Rail Station (JP)	Rail (generic) Rail Station (JP)	XZJ		Japan	JP	35.666667000000	139.750000000000	JPY
4940	Nan	Nan	NNT		Thailand	TH	18.807778000000	100.783333000000	THB
4941	Merimbula	Merimbula	MIM		Australia	AU	-36.908611000000	149.901389000000	AUD
4942	Rioja	Rioja	RIJ		Peru	PE	-6.050000000000	-77.150000000000	PEN
4943	Kake	Kake	KAE		USA	US	56.961389000000	-133.910278000000	USD
4944	Strathroy Rail Station	Strathroy Rail Station	XTY		Canada	CA	42.950000000000	-81.633333000000	CAD
4945	Tartu Airport	Tartu	TAY		Estonia	EE	58.333333000000	26.733333000000	EEK
4946	Gaziantep Airport	Gaziantep	GZT		Turkey	TR	36.944935000000	37.473749000000	USD
4947	Sao Paulo-Guarulhos International Airport	Sao Paulo	GRU		Brazil	BR	-23.425668000000	-46.481926000000	BRL
4948	Sonderborg Airport	Sonderborg	SGD		Denmark	DK	54.930280000000	9.794722000000	DKK
4949	Mamitupo	Mamitupo	MPI		Panama	PA	9.183333000000	-77.983333000000	PAB
4950	London Waterloo Rail Station	London Waterloo Rail Station	QQW		United Kingdom	GB	51.500000000000	-0.116667000000	GBP
4951	Skoppum Rail Station	Skoppum Rail Station	XUR		Norway	NO	59.391111000000	10.411944000000	NOK
4952	Puerto Natales	Puerto Natales	PNT		Chile	CL	-51.683333000000	-72.516667000000	CLP
4953	Ust-Kut	Ust-Kut	UKX		Russian Federation	RU	56.857222000000	105.731667000000	RUB
4954	Mindiptana	Mindiptana	MDP		Indonesia	ID	-5.883333000000	140.716667000000	IDR
4955	Mataiva	Mataiva	MVT		French Polynesia	PF	-14.869722000000	-148.713056000000	XPF
4956	Tolu	Tolu	TLU		Colombia	CO	9.500000000000	-75.616667000000	COP
4957	Kotlik	Kotlik	KOT		USA	US	63.032500000000	-163.530556000000	USD
4958	Kuujjuarapik	Kuujjuarapik	YGW		Canada	CA	55.281944000000	-77.765000000000	CAD
4959	Port Protection	Port Protection	PPV		USA	US	56.325556000000	-133.609167000000	USD
4960	Revelstoke	Revelstoke	YRV		Canada	CA	50.983333000000	-118.200000000000	CAD
4961	Dei Legionari Airport	Trieste	TRS		Italy	IT	45.820781000000	13.485678000000	EUR
4962	Tri City Airport	Saginaw	MBS		United States	US	43.533390000000	-84.090742000000	USD
4963	Bykovo Airport	Moscow	BKA		Russian Federation	RU	55.433334000000	37.966667000000	RUB
4964	Monclova	Monclova	LOV		Mexico	MX	26.954167000000	-101.470278000000	MXN
4965	Sanday	Sanday	NDY		United Kingdom	GB	59.250278000000	-2.575000000000	GBP
4966	Liege Guillemins Rail Station	Liege	XHN		Belgium	BE	50.624444000000	5.566667000000	EUR
4967	Saarbrucken Zweibruecken Airport	Saarbrucken	ZQW		Germany	DE	49.209444000000	7.400556000000	EUR
4968	Masirah	Masirah	MSH		Oman	OM	20.675556000000	58.250000000000	OMR
4969	Durban Virginia Airport	Durban	VIR		South Africa	ZA	-29.771111000000	31.058333000000	ZAR
4970	Ballina	Ballina	BNK		Australia	AU	-28.833889000000	153.562500000000	AUD
4971	Tongoa	Tongoa	TGH		Vanuatu	VU	-16.891667000000	168.552778000000	VUV
4972	Baker Island	Baker Island	BAR		USA	US	55.333333000000	-133.666667000000	USD
4973	Loveland Bus Station	Fort Collins/Loveland	QWH		USA	US	40.400000000000	-105.100000000000	USD
4974	Victoria Inner Harbour Apt	Victoria (CA)	YWH		Canada	CA	48.423889000000	-123.373056000000	CAD
4975	London Southend Airport	Southend	SEN		United Kingdom	GB	51.572778000000	0.701389000000	GBP
4976	Mccook	Mccook	MCK		USA	US	40.207778000000	-100.592778000000	USD
4977	Iles de la Madeleine	Iles de la Madeleine	YGR		Canada	CA	47.424722000000	-61.780278000000	CAD
4978	Memmingen Airport	Memmingen	FMM		Germany	DE	47.988611000000	10.239444000000	EUR
4979	Hartsfield-Jackson Atlanta International Airport	Atlanta	ATL		United States	US	33.640067000000	-84.444030000000	USD
4980	Laroche Airport	Brive-La-Gaillarde	BVE		France	FR	45.166668000000	1.533333000000	EUR
4981	Greenbrier Valley Airport	Lewisburg	LWB		United States	US	37.857100000000	-80.404400000000	USD
4982	San Sebastian/Gomera	San Sebastian/Gomera	GMZ		Spain	ES	28.029722000000	-17.214722000000	EUR
4983	Tokat	Tokat	TJK		Turkey	TR	40.302222000000	36.367778000000	USD
4984	Gelsenkirchen Rail Station	Gelsenkirchen Rail Station	ZEJ		Germany	DE	51.505278000000	7.102500000000	EUR
4985	Tel Aviv-yafo Sde Dov	Tel Aviv-yafo	SDV		Israel	IL	32.114722000000	34.782222000000	ILS
4986	Mansa	Mansa	MNS		Zambia	ZM	-11.138333000000	28.875000000000	ZMK
4987	Altenburg Nobitz Airport	Altenburg	AOC		Germany	DE	50.983333000000	12.450000000000	EUR
4988	Manchester Airport	Manchester	MAN		United Kingdom	GB	53.362908000000	-2.273354000000	GBP
4989	Gimpo International Airport	Seoul	GMP		Republic of Korea	KR	37.559287000000	126.803512000000	KRW
4990	Garden City Regional Airport	Pierceville	GCK		United States	US	37.928610000000	-100.729720000000	USD
4991	Gecitkale	Gecitkale	GEC		Cyprus	CY	35.236111000000	33.720000000000	EUR
4992	Thirsk Rail Station	Thirsk Rail Station	XTK		United Kingdom	GB	54.233333000000	-1.333333000000	GBP
4993	Itaperuna	Itaperuna	ITP		Brazil	BR	-21.218889000000	-41.875000000000	BRL
4994	Nyagan	Nyagan	NYA		Russian Federation	RU	62.101667000000	65.602500000000	RUB
4995	Loei	Loei	LOE		Thailand	TH	17.439167000000	101.721944000000	THB
4996	Kalkurung	Kalkurung	KFG		Australia	AU	-17.431944000000	130.808056000000	AUD
4997	Mompos	Mompos	MMP		Colombia	CO	9.250000000000	-74.433333000000	COP
4998	Wilmington Greater Wilmington Apt	Wilmington (US) DE	ILG		USA	US	39.678611000000	-75.606667000000	USD
4999	Quebec Charny Rail Station	Quebec	XFZ		Canada	CA	46.716667000000	-71.266667000000	CAD
5000	Anguganak	Anguganak	AKG		Papua New Guinea	PG	-3.583333000000	142.250000000000	PGK
5001	Ravensthorpe	Ravensthorpe	RVT		Australia	AU	-33.797222000000	120.210278000000	AUD
5002	Man	Man	MJC		Cote D'Ivoire	CI	7.271944000000	-7.587500000000	XOF
5003	Nikolai	Nikolai	NIB		USA	US	63.017222000000	-154.365556000000	USD
5004	Mayo	Mayo	YMA		Canada	CA	63.616667000000	-135.866667000000	CAD
5005	Goleniow Airport	Szczecin	SZZ		Poland	PL	53.593524000000	14.894611000000	PLN
5006	Houari Boumediene Airport	Algiers	ALG		Algeria	DZ	36.700580000000	3.211670000000	DZD
5007	Weihai Airport	Weihai	WEH		China	CN	37.188142000000	122.236067000000	RMB
5008	Machrihanish Airport	Campbeltown	CAL		United Kingdom	GB	55.436390000000	-5.686667000000	GBP
5009	Barbuda	Barbuda	BBQ		Antigua and Barbuda, Leeward Islands	AG	17.636111000000	-61.827222000000	XCD
5010	Avila Bus Station	Avila Bus Station	AVJ		Spain	ES	40.658056000000	-4.689722000000	EUR
5011	Out Skerries	Out Skerries	OUK		United Kingdom	GB	60.425278000000	-0.749167000000	GBP
5012	Lublin	Lublin	LUZ		Poland	PL	51.231389000000	22.690556000000	PLN
5013	Chaoyang	Chaoyang	CHG		China	CN	41.601667000000	120.405000000000	RMB
5014	Chandigarh	Chandigarh	IXC		India	IN	30.673333000000	76.788611000000	INR
5015	Burketown	Burketown	BUC		Australia	AU	-17.748611000000	139.534444000000	AUD
5016	Talasea	Talasea	TLW		Papua New Guinea	PG	-5.276111000000	150.011667000000	PGK
5017	Branson	Branson	BKG		USA	US	36.531667000000	-93.199722000000	USD
5018	Riverton	Riverton	RIW		USA	US	43.065556000000	-108.460000000000	USD
5019	Pangnirtung	Pangnirtung	YXP		Canada	CA	66.145000000000	-65.713611000000	CAD
5020	Newcastle Airport	Newcastle	NCL		United Kingdom	GB	55.037062000000	-1.710629000000	GBP
5021	Honolulu International Airport	Honolulu	HNL		United States	US	21.325833000000	-157.921667000000	USD
5022	Bilbao Airport	Bilbao	BIO		Spain and Canary Islands	ES	43.305534000000	-2.905808000000	EUR
5023	Kent International Airport	Manston	MSE		United Kingdom	GB	51.350000000000	1.350000000000	GBP
5024	Waterloo Regional Airport	Waterloo	ALO		United States	US	42.556110000000	-92.399720000000	USD
5025	Baltrum	Baltrum	BMR		Germany	DE	53.733333000000	7.383333000000	EUR
5026	Solvesborg Rail Station	Solvesborg Rail Station	XYU		Sweden	SE	56.050000000000	14.582778000000	SEK
5027	Varginha	Varginha	VAG		Brazil	BR	-21.590000000000	-45.473889000000	BRL
5028	Vorkuta	Vorkuta	VKT		Russian Federation	RU	67.489167000000	63.995556000000	RUB
5029	Maumere	Maumere	MOF		Indonesia	ID	-8.640556000000	122.236944000000	IDR
5030	Maloelap Island	Maloelap Island	MAV		Marshall Islands	MH	8.750000000000	171.100000000000	USD
5031	Uyuni	Uyuni	UYU		Bolivia	BO	-20.000000000000	-66.000000000000	BOB
5032	Akutan	Akutan	KQA		USA	US	54.133056000000	-165.780833000000	USD
5033	Cortes Bay	Cortes Bay	YCF		Canada	CA	50.066667000000	-124.933333000000	CAD
5034	Campo Dell Oro Airport	Ajaccio	AJA		France	FR	41.919867000000	8.794013000000	EUR
5035	Casper Airport	Casper	CPR		United States	US	42.908611000000	-106.462500000000	USD
5036	Brasilia International Airport	Brasilia	BSB		Brazil	BR	-15.869807000000	-47.921486000000	BRL
5037	Reykjavik Domestic Airport	Reykjavik	RKV		Iceland	IS	64.131060000000	-21.932476000000	ISK
5038	Avila Rail Station	Avila Rail Station	AVS		Spain	ES	40.656944000000	-4.683333000000	EUR
5039	Karlsruhe Bus Station	Karlsruhe/Baden-Baden	XET		Germany	DE	48.991667000000	8.400556000000	EUR
5040	Stevenage Rail Station	Stevenage Rail Station	XVJ		United Kingdom	GB	51.916667000000	-0.233333000000	GBP
5041	El Palomar	El Palomar	EPA		Argentina	AR	-34.610000000000	-58.612500000000	ARS
5042	Rikaze	Rikaze	RKZ		China	CN	29.351944000000	89.310000000000	RMB
5043	Kamphangsaen	Kamphangsaen	KDT		Thailand	TH	14.100000000000	99.916667000000	THB
5044	Hervey Bay	Hervey Bay	HVB		Australia	AU	-25.320000000000	152.880278000000	AUD
5045	Esmeraldas	Esmeraldas	ESM		Ecuador	EC	0.978611000000	-79.626667000000	USD
5046	Havasupai	Havasupai	HAE		USA	US	36.230556000000	-112.669444000000	USD
5047	Vasteras/Hasslo Airport	Stockholm	VST		Sweden	SE	59.589167000000	16.630556000000	SEK
5048	Roatan Airport	Roatan	RTB		Honduras	HN	16.318209000000	-86.527220000000	HNL
5049	Al-Najaf International Airport	Al-Najaf	NJF		Iraq	IQ	31.993562000000	44.389186000000	NID
5050	Kent International Airport	Manston	MSE		United Kingdom	GB	51.350000000000	1.350000000000	GBP
5051	Tambov Airport	Tambov	TBW		Russia	RU	52.716667000000	41.433334000000	RUB
5052	Iringa	Iringa	IRI		Tanzania United Republic of	TZ	-7.670000000000	35.751944000000	TZS
5053	Murcia Rail Station	Murcia Rail Station	XUT		Spain	ES	37.975000000000	-1.131667000000	EUR
5054	San Luis	San Luis	LUQ		Argentina	AR	-33.272222000000	-66.356667000000	ARS
5055	Luoyang	Luoyang	LYA		China	CN	34.741389000000	112.389444000000	RMB
5056	Basco	Basco	BSO		Philippines	PH	20.451389000000	121.980000000000	PHP
5057	Hamilton Island	Hamilton Island	HTI		Australia	AU	-20.358056000000	148.951667000000	AUD
5058	Medellin Enrique Olaya Herrerra Apt	Medellin	EOH		Colombia	CO	6.220000000000	-75.590556000000	COP
5059	Goodyear	Goodyear	GYR		USA	US	33.433333000000	-112.350000000000	USD
5060	Capreol Rail Station	Capreol Rail Station	XAW		Canada	CA	46.710833000000	-80.928333000000	CAD
5061	Rouen	Rouen	URO		France	FR	49.390833000000	1.183889000000	EUR
5062	Vichy	Vichy	VHY		France	FR	46.171667000000	3.404167000000	EUR
5063	Dar Es Salaam International Airport	Dar Es Salaam	DAR		United Republic of Tanzania	TZ	-6.873533000000	39.202110000000	TZS
5064	Yuma International Airport	Yuma	YUM		United States	US	32.668605000000	-114.599263000000	USD
5065	Pamplona Airport	Pamplona	PNA		Spain and Canary Islands	ES	42.767498000000	-1.639347000000	EUR
5066	Bahia Pinas	Bahia Pinas	BFQ		Panama	PA	7.583333000000	-78.166667000000	PAB
5067	Pajala	Pajala	PJA		Sweden	SE	67.245556000000	23.068889000000	SEK
5068	Amsterdam Central Rail Station	Amsterdam Central Rail Station	ZYA		Netherlands	NL	52.378889000000	4.900556000000	EUR
5069	Nejran	Nejran	EAM		Saudi Arabia	SA	17.611389000000	44.419167000000	SAR
5070	Mkuze	Mkuze	MZQ		South Africa	ZA	-27.633333000000	32.050000000000	ZAR
5071	Trang	Trang	TST		Thailand	TH	7.508611000000	99.615833000000	THB
5072	Osborne Mine	Osborne Mine	OSO		Australia	AU	-22.081667000000	140.556944000000	AUD
5073	Franceville	Franceville	MVB		Gabon	GA	-1.656111000000	13.438056000000	XAF
5074	Nuussuaq	Nuussuaq	NSQ		Greenland	GL	74.109722000000	-57.065000000000	DKK
5075	Montreal Downtown Rail Station	Montreal	YMY		Canada	CA	45.500000000000	-73.566667000000	CAD
5076	Shekou	Shekou	ZYK		China	CN	22.477778000000	113.913611000000	RMB
5077	Arturo Merino Benitez Airport	Santiago	SCL		Chile	CL	-33.397175000000	-70.793821000000	CLP
5078	Nizhniy Novgorod Airport	Nizhniy Novgorod	GOJ		Russian Federation	RU	56.218613000000	43.789764000000	RUB
5079	Pavlodar	Pavlodar	PWQ		Kazakhstan	KZ	52.195000000000	77.073889000000	KZT
5080	Sirnak	Sirnak	NKT		Turkey	TR	37.363611000000	42.061944000000	USD
5081	Orebro-Bofors Rail Station	Orebro-Bofors Rail Station	XWR		Sweden	SE	59.277778000000	15.210278000000	SEK
5082	Santa Rosa (AR)	Santa Rosa (AR)	RSA		Argentina	AR	-36.588333000000	-64.275833000000	ARS
5083	Kasama	Kasama	KAA		Zambia	ZM	-10.218056000000	31.134722000000	ZMK
5084	Sumbawa	Sumbawa	SWQ		Indonesia	ID	-8.500000000000	117.416667000000	IDR
5085	New Plymouth	New Plymouth	NPL		New Zealand	NZ	-39.008056000000	174.177500000000	NZD
5086	Gbadolite	Gbadolite	BDT		Congo Democratic Republic of	CD	4.254722000000	20.971944000000	CDF
5087	Liberal	Liberal	LBL		USA	US	37.044167000000	-100.960000000000	USD
5088	Nain	Nain	YDP		Canada	CA	56.550833000000	-61.682500000000	CAD
5089	Nuremberg Airport	Nuremberg	NUE		Germany	DE	49.494168000000	11.077062000000	EUR
5090	Dunedin Airport	Dunedin	DUD		New Zealand	NZ	-45.923871000000	170.199052000000	NZD
5091	Sendai Airport	Sendai	SDJ		Japan	JP	38.135556000000	140.923889000000	JPY
5092	Batsfjord Airport	Batsfjord	BJF		Norway	NO	70.600000000000	29.666668000000	NOK
5093	Waspam	Waspam	WSP		Nicaragua	NI	14.583333000000	-84.083333000000	NIO
5094	London Waterloo Rail Station	London Waterloo Rail Station	QQW		United Kingdom	GB	51.500000000000	-0.116667000000	GBP
5095	Uganik	Uganik	UGI		USA	US	57.840278000000	-153.330278000000	USD
5096	Teixeira de Freitas	Teixeira de Freitas	TXF		Brazil	BR	-17.525000000000	-39.669444000000	BRL
5097	N'Zeto	N'Zeto	ARZ		Angola	AO	-7.216667000000	12.866667000000	AOA
5098	Pleiku	Pleiku	PXU		Viet Nam	VN	14.004444000000	108.017222000000	VND
5099	Mataiva	Mataiva	MVT		French Polynesia	PF	-14.869722000000	-148.713056000000	XPF
5100	Kalemie	Kalemie	FMI		Congo Democratic Republic of	CD	-5.877778000000	29.246111000000	CDF
5101	Nevada	Nevada	NVD		USA	US	37.850000000000	-94.300000000000	USD
5102	Norway House	Norway House	YNE		Canada	CA	53.966667000000	-97.833333000000	CAD
5103	Smithers	Smithers	YYD		Canada	CA	54.824722000000	-127.182778000000	CAD
5104	Vnukovo Airport	Moscow	VKO		Russian Federation	RU	55.603150000000	37.292098000000	RUB
5105	Galeao Antonio Carlos Jobim International Airport	Rio De Janeiro	GIG		Brazil	BR	-22.814654000000	-43.246510000000	BRL
5106	Skelleftea Airport	Skelleftea	SFT		Sweden	SE	64.622510000000	21.068548000000	SEK
5107	Utila	Utila	UII		Honduras	HN	16.112222000000	-86.883056000000	HNL
5108	Sanday	Sanday	NDY		United Kingdom	GB	59.250278000000	-2.575000000000	GBP
5109	Berwick-upon-Tweed Rail Station	Berwick-upon-Tweed Rail Station	XQG		United Kingdom	GB	55.766667000000	-2.000000000000	GBP
5110	Ugashik	Ugashik	UGS		USA	US	57.533333000000	-157.400000000000	USD
5111	An Shun	An Shun	AVA		China	CN	26.257222000000	105.872778000000	RMB
5112	Gwalior	Gwalior	GWL		India	IN	26.293333000000	78.227778000000	INR
5113	Daydream Island	Daydream Island	DDI		Australia	AU	-20.166667000000	148.183333000000	AUD
5114	Wabo	Wabo	WAO		Papua New Guinea	PG	-7.666667000000	145.000000000000	PGK
5115	Moab	Moab	CNY		USA	US	38.760833000000	-109.747500000000	USD
5116	St Petersburg	St Petersburg (US)	SPG		USA	US	27.766667000000	-82.633333000000	USD
5117	New York/newark Metropark Rail Station	New York/newark Metropark Rail Station	ZME		USA	US	40.568333000000	-74.329722000000	USD
5118	Luliang Airport	Luliang	LLV		China	CN	37.683334000000	111.142780000000	RMB
5119	SSR International Airport	Mauritius	MRU		Mauritius	MU	-20.431998000000	57.676629000000	MUR
5120	Harbin Airport	Harbin	HRB		China	CN	45.620854000000	126.236440000000	RMB
5121	Kidlington Airport	Oxford	OXF		United Kingdom	GB	51.766666000000	-1.250000000000	GBP
5122	San Luis Obispo County Regional Airport	San Luis Obispo	SBP		USA	US	35.239113000000	-120.640625000000	USD
5123	Palencia Rail Station	Palencia Rail Station	PCI		Spain	ES	42.015556000000	-4.533611000000	EUR
5124	Wolverhampton Rail Station	Wolverhampton Rail Station	XVW		United Kingdom	GB	52.600000000000	-2.133333000000	GBP
5125	Fonte Boa	Fonte Boa	FBA		Brazil	BR	-2.532500000000	-66.083333000000	BRL
5126	Jinghong	Jinghong	JHG		China	CN	21.973056000000	100.763056000000	RMB
5127	Sholapur	Sholapur	SSE		India	IN	17.633333000000	75.933333000000	INR
5128	Katowice International Airport	Katowice	KTW		Poland	PL	50.470833000000	19.074029000000	PLN
5129	Matsapha International Airport	Manzini	MTS		Swaziland	SZ	-26.520331000000	31.314132000000	SZL
5130	Turbat Airport	Turbat	TUK		Pakistan	PK	25.983333000000	63.066667000000	PKR
5131	Santa Cruz Airport	Flores Island	FLW		Portugal	PT	39.466667000000	-31.150000000000	EUR
5132	Palenque	Palenque	PQM		Mexico	MX	17.500000000000	-92.008333000000	MXN
5133	Gavle Rail Station	Gavle	QYU		Sweden	SE	60.666667000000	17.150000000000	SEK
5134	Saransk	Saransk	SKX		Russian Federation	RU	54.125833000000	45.213333000000	RUB
5135	Jinjiang	Jinjiang	JJN		China	CN	24.900000000000	118.583333000000	RMB
5136	Sehwen Sharif	Sehwen Sharif	SYW		Pakistan	PK	26.416667000000	67.850000000000	PKR
5137	Ihu	Ihu	IHU		Papua New Guinea	PG	-7.900000000000	145.400000000000	PGK
5138	Guapi	Guapi	GPI		Colombia	CO	2.570000000000	-77.898333000000	COP
5139	Hayden	Hayden	HDN		USA	US	40.483333000000	-107.223611000000	USD
5140	Gaspe Rail Station	Gaspe	XDD		Canada	CA	48.866667000000	-64.500000000000	CAD
5141	St Tropez Harbour	St Tropez Harbour	XPZ		France	FR	43.266667000000	6.633333000000	EUR
5142	Nikunau	Nikunau	NIG		Kiribati	KI	-1.383333000000	176.433333000000	AUD
5143	N'dende	N'dende	KDN		Gabon	GA	-2.366667000000	11.416667000000	XAF
5144	Minto	Minto	MNT		USA	US	65.147222000000	-149.367500000000	USD
5145	Detroit Willow Run Apt	Detroit	YIP		USA	US	42.238056000000	-83.530278000000	USD
5146	Vladivostok Airport	Vladivostok	VVO		Russian Federation	RU	43.378575000000	132.140752000000	RUB
5147	Bradenton Airport	Sarasota	SRQ		United States	US	27.387480000000	-82.553282000000	USD
5148	Namsos Airport	Namsos	OSY		Norway	NO	64.472730000000	11.570002000000	NOK
5149	Terre-de-Haut	Terre-de-Haut	LSS		Guadeloupe	GP	15.864444000000	-61.580556000000	EUR
5150	Gavle Sandviken Airport	Gavle	GVX		Sweden	SE	60.600000000000	16.950000000000	SEK
5151	Andalsnes Rail Station	Andalsnes Rail Station	XGI		Norway	NO	62.566944000000	7.690278000000	NOK
5152	Barretos	Barretos	BAT		Brazil	BR	-20.585000000000	-48.595278000000	BRL
5153	Jilin	Jilin	JIL		China	CN	43.866667000000	126.650000000000	RMB
5154	Sui	Sui	SUL		Pakistan	PK	28.633333000000	69.200000000000	PKR
5155	Ile des Pins	Ile des Pins	ILP		New Caledonia	NC	-22.588889000000	167.455833000000	XPF
5156	Yam Island	Yam Island	XMY		Australia	AU	-9.899167000000	142.774167000000	AUD
5157	Cape Newenham	Cape Newenham	EHM		USA	US	58.646389000000	-162.062778000000	USD
5158	Taos	Taos	TSM		USA	US	36.466667000000	-105.666667000000	USD
5159	New Carrollton Rail Station	New Carrollton Rail Station	ZZC		USA	US	38.966667000000	-76.866667000000	USD
5160	Kiev-Zhulhany Airport	Kiev	IEV		Ukraine	UA	50.401944000000	30.450833000000	UAH
5161	Mariscal Sucre Airport	Quito	UIO		Ecuador	EC	-0.145528000000	-78.490535000000	USD
5162	Paderborn Airport	Paderborn	PAD		Germany	DE	51.610332000000	8.619832000000	EUR
5163	Belmopan	Belmopan	BCV		Belize	BZ	17.269722000000	-88.776667000000	BZD
5164	Coventry	Coventry	CVT		United Kingdom	GB	52.369722000000	-1.479722000000	GBP
5165	Strangnas Rail Station	Strangnas Rail Station	XFH		Sweden	SE	59.366667000000	17.166667000000	SEK
5166	Ipatinga	Ipatinga	IPN		Brazil	BR	-19.470833000000	-42.487500000000	BRL
5167	Atsugi	Atsugi	NJA		Japan	JP	35.450000000000	139.450000000000	JPY
5168	Ende	Ende	ENE		Indonesia	ID	-8.849167000000	121.660556000000	IDR
5169	Gonalia	Gonalia	GOE		Papua New Guinea	PG	-5.383333000000	151.866667000000	PGK
5170	Basse Terre	Basse Terre	BBR		Guadeloupe	GP	16.166667000000	-61.750000000000	EUR
5171	Benton Harbor	Benton Harbor	BEH		USA	US	42.133333000000	-86.433333000000	USD
5172	Ruby	Ruby	RBY		USA	US	64.727222000000	-155.470000000000	USD
5173	Chute des Passes	Chute des Passes	YWQ		Canada	CA	49.887222000000	-71.253889000000	CAD
5174	Nordela Airport	Ponta Delgada (Azores)	PDL		Portugal	PT	37.743847000000	-25.696469000000	EUR
5175	Flesland Airport	Bergen	BGO		Norway	NO	60.289064000000	5.228169000000	NOK
5176	Rickenbacker Airport	Columbus	LCK		United States	US	39.816667000000	-82.933333000000	USD
5177	Gold Coast Airport	Coolangatta (Gold Coast)	OOL		Australia	AU	-28.166164000000	153.513137000000	AUD
5178	Vitoria Airport	Vitoria	VIT		Spain and Canary Islands	ES	42.833332000000	-2.500000000000	EUR
5179	Colima	Colima	CLQ		Mexico	MX	19.276944000000	-103.577500000000	MXN
5180	Oviedo Rail Station	Oviedo Rail Station	OVI		Spain	ES	43.366111000000	-5.854722000000	EUR
5181	Naples Mergellina Harbour	Naples (IT)	ZMJ		Italy	IT	40.827222000000	14.224167000000	EUR
5182	Yotvata	Yotvata	YOT		Israel	IL	29.900000000000	35.066667000000	ILS
5183	Johannesburg Randgermiston	Johannesburg	QRA		South Africa	ZA	-26.266667000000	28.150000000000	ZAR
5184	Rachgia	Rachgia	VKG		Viet Nam	VN	9.958333000000	105.133333000000	VND
5185	Port Macquarie	Port Macquarie	PQQ		Australia	AU	-31.435556000000	152.862222000000	AUD
5186	Oyo	Oyo	OLL		Congo	CG	-1.225833000000	15.910278000000	XAF
5187	Newport	Newport	ONP		USA	US	44.583333000000	-124.050000000000	USD
5188	Rainbow Lake	Rainbow Lake	YOP		Canada	CA	58.491389000000	-119.408333000000	CAD
5189	Tivat Airport	Tivat	TIV		Montenegro	ME	42.403611000000	18.725556000000	EUR
5190	Gen F Javier Mina Airport	Tampico	TAM		Mexico	MX	22.289082000000	-97.870162000000	MXN
5191	Donegal Airport	Donegal	CFN		Ireland	IE	55.041668000000	-8.340278000000	EUR
5192	Walkers Cay	Walkers Cay	WKR		Bahamas	BS	27.266667000000	-78.400000000000	BSD
5193	Fair Isle	Fair Isle	FIE		United Kingdom	GB	59.534722000000	-1.628611000000	GBP
5194	Cartagena Rail Station	Cartagena Rail Station	XUF		Spain	ES	37.604722000000	-0.973889000000	EUR
5195	Arad	Arad	ARW		Romania	RO	46.176667000000	21.261944000000	ROL
5196	Al Udeid	Al Udeid	XJD		Qatar	QA	25.115833000000	51.315278000000	QAR
5197	Phalaborwa	Phalaborwa	PHW		South Africa	ZA	-23.936944000000	31.156111000000	ZAR
5198	Avu Avu	Avu Avu	AVU		Solomon Islands	SB	-9.841389000000	160.383611000000	SBD
5199	Pimaga	Pimaga	PMP		Papua New Guinea	PG	-6.366667000000	143.550000000000	PGK
5200	Kinshasa N'dolo Apt	Kinshasa	NLO		Congo Democratic Republic of	CD	-4.316667000000	15.316667000000	CDF
5201	Ogden Municipal Apt	Ogden	OGD		USA	US	41.196111000000	-112.010556000000	USD
5202	Old Crow	Old Crow	YOC		Canada	CA	67.570556000000	-139.839167000000	CAD
5203	Madeira Airport	Funchal	FNC		Portugal	PT	32.693121000000	-16.775635000000	EUR
5204	Inverness Airport	Inverness	INV		United Kingdom	GB	57.539346000000	-4.063738000000	GBP
5205	M. Rondon Airport	Cuiaba	CGB		Brazil	BR	-15.651725000000	-56.120266000000	BRL
5206	Tinian Airport	Tinian	TIQ		Northern Mariana Islands	MP	14.994319000000	145.626344000000	USD
5207	Nojabrxsk Airport	Nojabrxsk	NOJ		Russia	RU	63.176730000000	75.294590000000	RUB
5208	Salina Cruz	Salina Cruz	SCX		Mexico	MX	16.166667000000	-95.200000000000	MXN
5209	Kings Lynn	Kings Lynn	KNF		United Kingdom	GB	52.750000000000	0.400000000000	GBP
5210	Herning Bus Station	Herning Bus Station	ZRY		Denmark	DK	56.133333000000	8.966667000000	DKK
5211	Huanghua	Huanghua	HHA		China	CN	28.189167000000	113.219444000000	RMB
5212	Mountain	Mountain	MWP		Nepal	NP	28.000000000000	85.333333000000	NPR
5213	Mudgee	Mudgee	DGE		Australia	AU	-32.565000000000	149.609444000000	AUD
5214	Tinak Island	Tinak Island	TIC		Marshall Islands	MH	7.050000000000	171.783333000000	USD
5215	Bridgeport	Bridgeport	BDR		USA	US	41.163611000000	-73.126111000000	USD
5216	Brooks Lodge	Brooks Lodge	RBH		USA	US	58.550000000000	-155.800000000000	USD
5217	Williams Harbour	Williams Harbour	YWM		Canada	CA	52.567500000000	-55.784444000000	CAD
5218	Cardiff Central Railway Station	Cardiff	CFW		United Kingdom	GB	51.475500000000	-3.178000000000	GBP
5219	London Gatwick Airport	London	LGW		United Kingdom	GB	51.156807000000	-0.161863000000	GBP
5220	Santa Genoveva Airport	Goiania	GYN		Brazil	BR	-16.632631000000	-49.226624000000	BRL
5221	Brussels Midi Station	Brussels	ZYR		Belgium	BE	50.836945000000	4.335556000000	EUR
5222	San Ignacia	San Ignacia	SQS		Belize	BZ	17.186111000000	-89.010000000000	BZD
5223	Cologne/Bonn, Cologne HBF Rail Stn	Cologne/Bonn	QKL		Germany	DE	50.943333000000	6.958333000000	EUR
5224	Solovetsky	Solovetsky	CSH		Russian Federation	RU	65.029444000000	35.733333000000	RUB
5225	Berezovo	Berezovo	EZV		Russian Federation	RU	63.921111000000	65.030556000000	RUB
5226	Skardu	Skardu	KDU		Pakistan	PK	35.333056000000	75.546389000000	PKR
5227	Futuna Island	Futuna Island	FTA		Vanuatu	VU	-19.516389000000	170.232500000000	VUV
5228	Thargomindah	Thargomindah	XTG		Australia	AU	-27.986389000000	143.812222000000	AUD
5229	Fairbanks Eielson AFB	Fairbanks	EIL		USA	US	64.666667000000	-147.100000000000	USD
5230	Chandler Rail Station	Chandler Rail Station	XDL		Canada	CA	48.350000000000	-64.683333000000	CAD
5231	Urzhar Airport	Urzhar	UZR		Kazakhstan	KZ	47.091530000000	81.659160000000	KZT
5232	Cardiff-Wales Airport	Cardiff	CWL		United Kingdom	GB	51.398768000000	-3.339075000000	GBP
5233	Puerto Suarez Airport	Puerto Suarez	PSZ		Bolivia	BO	-18.966667000000	-57.800000000000	BOB
5234	Puente Genil Airport	Puente Genil	GEN		Spain and Canary Islands	ES	37.383330000000	-4.766667000000	EUR
5235	St Lucia George F.l. Charles Apt	St Lucia	SLU		Saint Lucia	LC	14.020278000000	-60.993056000000	XCD
5236	Inisheer	Inisheer	INQ		Ireland Republic of	IE	53.058611000000	-9.506111000000	EUR
5237	Runcorn Rail Station	Runcorn Rail Station	XRC		United Kingdom	GB	53.333333000000	-2.733333000000	GBP
5238	Khonuu	Khonuu	MQJ		Russian Federation	RU	66.450833000000	143.261389000000	RUB
5239	Chi Mei	Chi Mei	CMJ		Chinese Taipei	TW	23.250000000000	119.416667000000	TWD
5240	Jammu	Jammu	IXJ		India	IN	32.689167000000	74.837500000000	INR
5241	Bewani	Bewani	BWP		Papua New Guinea	PG	-3.083333000000	141.100000000000	PGK
5242	Torokina	Torokina	TOK		Papua New Guinea	PG	-6.216667000000	155.050000000000	PGK
5243	Bluefield	Bluefield	BLF		USA	US	37.300000000000	-81.200000000000	USD
5244	Rangely	Rangely	RNG		USA	US	40.094722000000	-108.760556000000	USD
5245	Abbotsford	Abbotsford	YXX		Canada	CA	49.025278000000	-122.360556000000	CAD
5246	Huesca-Pirineos Airport	Huesca	HSK		Spain and Canary Islands	ES	42.080927000000	-0.323469000000	EUR
5247	Louis Armstrong New Orleans International Airport	New Orleans	MSY		United States	US	29.984564000000	-90.256391000000	USD
5248	Kiruna Airport	Kiruna	KRN		Sweden	SE	67.822220000000	20.345833000000	SEK
5249	Rum Cay	Rum Cay	RCY		Bahamas	BS	23.651667000000	-74.845000000000	BSD
5250	Turin Rail Stn	Turin Rail Stn	ITT		Italy	IT	45.061944000000	7.678333000000	EUR
5251	Nuneaton Rail Station	Nuneaton Rail Station	XNV		United Kingdom	GB	52.526111000000	-1.464722000000	GBP
5252	Zamora Rail Station	Zamora Rail Station	ZOB		Spain	ES	41.516111000000	-5.739722000000	EUR
5253	Temuco	Temuco	ZCO		Chile	CL	-38.766944000000	-72.637222000000	CLP
5254	Gweru	Gweru	GWE		Zimbabwe	ZW	-19.550000000000	29.733333000000	ZWD
5255	Sintang	Sintang	SQG		Indonesia	ID	0.063611000000	111.473333000000	IDR
5256	Nankina	Nankina	NKN		Papua New Guinea	PG	-5.833333000000	146.450000000000	PGK
5257	Odienne	Odienne	KEO		Cote D'Ivoire	CI	9.550000000000	-7.566667000000	XOF
5258	Mountain Village	Mountain Village	MOU		USA	US	62.095278000000	-163.682222000000	USD
5259	Jasper Hinton Airport	Jasper	YJA		Canada	CA	52.883333000000	-118.083333000000	CAD
5260	Koyuk	Koyuk	KKA		USA	US	64.938889000000	-161.155278000000	USD
5261	Skiathos Airport	Skiathos	JSI		Greece	GR	39.180556000000	23.505556000000	EUR
5262	Las Americas Airport	Santo Domingo	SDQ		Dominican Republic	DO	18.430125000000	-69.676742000000	DOP
5263	Changi International Airport	Singapore	SIN		Singapore	SG	1.361173000000	103.990201000000	SGD
5264	Santa Cruz Island Airport	Santa Barbara	SZN		United States	US	34.060555000000	-119.915000000000	USD
5265	Morombe	Morombe	MXM		Madagascar	MG	-21.753889000000	43.375556000000	MGA
5266	North Ronaldsay	North Ronaldsay	NRL		United Kingdom	GB	59.367500000000	-2.434444000000	GBP
5267	Brig Rail Station	Brig Rail Station	ZDL		Switzerland	CH	46.316667000000	7.983333000000	CHF
5268	Makkah Bus Station	Makkah Bus Station	QCA		Saudi Arabia	SA	21.433333000000	39.816667000000	SAR
5269	Malelane	Malelane	LLE		South Africa	ZA	-25.466667000000	31.566667000000	ZAR
5270	Kuala Terengganu	Kuala Terengganu	TGG		Malaysia	MY	5.381389000000	103.104722000000	MYR
5271	Mount Magnet	Mount Magnet	MMG		Australia	AU	-28.116111000000	117.841667000000	AUD
5272	La Primavera	La Primavera	LPE		Colombia	CO	3.733333000000	-76.216667000000	COP
5273	Hydaburg	Hydaburg	HYG		USA	US	55.205278000000	-132.828056000000	USD
5274	Newcastle Rail Station	Newcastle Rail Station	XEY		Canada	CA	47.000000000000	-65.566667000000	CAD
5275	Sant Egidio Airport	Perugia	PEG		Italy	IT	43.133333000000	12.366667000000	EUR
5276	Luxor Airport	Luxor	LXR		Egypt	EG	25.674919000000	32.699683000000	EGP
5277	Yangyang Airport	Yangyang	YNY		Republic of Korea	KR	38.066667000000	128.600000000000	KRW
5278	Ronald Reagan National Airport	Washington	DCA		United States	US	38.853436000000	-77.043460000000	USD
5279	Kasese	Kasese	KSE		Uganda	UG	0.185000000000	30.101944000000	UGX
5280	Shetland Islands Scatsta Apt	Shetland Islands	SCS		United Kingdom	GB	60.433333000000	-1.283333000000	GBP
5281	Penrith Rail Station	Penrith Rail Station	XPF		United Kingdom	GB	54.666667000000	-2.733333000000	GBP
5282	Goya	Goya	OYA		Argentina	AR	-29.100000000000	-59.250000000000	ARS
5283	Tonghua	Tonghua	TNH		China	CN	41.750000000000	125.950000000000	RMB
5284	Ozamis	Ozamis	OZC		Philippines	PH	8.178611000000	123.841667000000	PHP
5285	Obo	Obo	OBX		Papua New Guinea	PG	-7.583333000000	141.333333000000	PGK
5286	Borotou	Borotou	BRZ		Cote D'Ivoire	CI	45.531944000000	10.212778000000	XOF
5287	Las Vegas Nellis AFB	Las Vegas	LSV		USA	US	36.300000000000	-115.800000000000	USD
5288	Snare Lake	Snare Lake	YFJ		Canada	CA	64.190556000000	-114.075556000000	CAD
5289	Cristoforo Colombo Airport	Genoa	GOA		Italy	IT	44.415066000000	8.850810000000	EUR
5290	Aguemar Airport	Tamenghest	TMR		Algeria	DZ	22.814722000000	5.459167000000	DZD
5291	Gimhae International Airport	Busan	PUS		Republic of Korea	KR	35.179319000000	128.948728000000	KRW
5292	Walla Walla Regional Airport	Walla Walla	ALW		United States	US	46.094723000000	-118.291115000000	USD
5293	Borgarfjordur Eystri	Borgarfjordur Eystri	BGJ		Iceland	IS	65.516389000000	-13.805000000000	ISK
5294	Enkoping Rail Station	Enkoping Rail Station	XWQ		Sweden	SE	59.644444000000	17.088333000000	SEK
5295	Sao Gabriel	Sao Gabriel	SJL		Brazil	BR	-0.149722000000	-66.986667000000	BRL
5296	Yichun (Jiangxi)	Yichun (Jiangxi)	YIC		China	CN	27.803333000000	114.307778000000	RMB
5297	Long Seridan	Long Seridan	ODN		Malaysia	MY	3.977500000000	115.068333000000	MYR
5298	Doncaster Sheffield Airport	Doncaster	DSA		United Kingdom	GB	53.481004000000	-1.011550000000	GBP
5299	St. Barthelemy Airport	Saint Barthelemy	SBH		Guadeloupe	GP	17.900000000000	-62.850000000000	EUR
5300	Khwaja Rawash Airport	Kabul	KBL		Afghanistan	AF	34.560692000000	69.211521000000	USD
5301	Mercedita Airport	Coto Laurel	PSE		United States	US	18.010702000000	-66.563545000000	USD
5302	Aosta	Aosta	AOT		Italy	IT	45.738611000000	7.368056000000	EUR
5303	Varberg Rail Station	Varberg Rail Station	XWV		Sweden	SE	57.109444000000	12.248889000000	SEK
5304	Rio Turbio	Rio Turbio	RYO		Argentina	AR	-51.600000000000	-72.216667000000	ARS
5305	Yibin	Yibin	YBP		China	CN	28.800278000000	104.545000000000	RMB
5306	Nakhon Si Thammarat	Nakhon Si Thammarat	NST		Thailand	TH	8.539722000000	99.944722000000	THB
5307	Labasa	Labasa	LBS		Fiji	FJ	-16.467778000000	179.339722000000	FJD
5308	Apartado	Apartado	APO		Colombia	CO	7.812500000000	-76.716667000000	COP
5309	Fergus Falls	Fergus Falls	FFM		USA	US	46.283333000000	-96.166667000000	USD
5310	Las Vegas North Air Terminal	Las Vegas	VGT		USA	US	36.216667000000	-115.200000000000	USD
5311	Paris Cergy Pontoise Airport	Paris	POX		France	FR	49.096667000000	2.040833000000	EUR
5312	Nelson	Nelson	NSN		New Zealand	NZ	-41.296667000000	173.224167000000	NZD
5313	Rondon	Rondon	RON		Colombia	CO	6.300000000000	-71.083333000000	COP
5314	Lewiston/Auburn	Lewiston/Auburn	LEW		USA	US	44.050000000000	-70.283333000000	USD
5315	Broadview	Broadview	YDR		Canada	CA	50.333333000000	-102.500000000000	CAD
5316	Skiros Airport	Skiros	SKU		Greece	GR	38.916667000000	24.566667000000	EUR
5317	Maurice Bishop International Airport	Grenada	GND		Grenada	GD	12.150000000000	-61.616667000000	XCD
5318	Suvarnabhumi Airport	Bangkok	BKK		Thailand	TH	13.693062000000	100.752044000000	THB
5319	Boulder City Municipal Airport	Boulder City	BLD		United States	US	35.947018000000	-114.859360000000	USD
5320	Bukoba	Bukoba	BKZ		Tanzania United Republic of	TZ	-1.332500000000	31.821944000000	TZS
5321	Harrogate	Harrogate	HRT		United Kingdom	GB	54.050000000000	-1.250000000000	GBP
5322	Birmingham New Street Rail Station	Birmingham (GB)	QQN		United Kingdom	GB	52.466667000000	-1.916667000000	GBP
5323	Dundee Rail Station	Dundee Rail Station	ZDU		United Kingdom	GB	56.466667000000	-2.966667000000	GBP
5324	Coyhaique	Coyhaique	GXQ		Chile	CL	-45.500000000000	-72.516667000000	CLP
5325	Baishan	Baishan	NBS		China	CN	42.065000000000	127.602500000000	RMB
5326	Dalat	Dalat	DLI		Viet Nam	VN	11.750000000000	108.366667000000	VND
5327	Julia Creek	Julia Creek	JCK		Australia	AU	-20.668333000000	141.722500000000	AUD
5328	Acarigua	Acarigua	AGV		Venezuela	VE	9.550000000000	-69.233333000000	VEB
5329	False Island	False Island	FAK		USA	US	57.530556000000	-135.216667000000	USD
5330	Victoria	Victoria (US)	VCT		USA	US	28.852500000000	-96.918611000000	USD
5331	St-Nazaire	St-Nazaire	SNR		France	FR	47.310556000000	-2.156667000000	EUR
5332	Santiago Municipal Airport	Santiago	STI		Dominican Republic	DO	19.401829000000	-70.602085000000	DOP
5333	Bacolod Airport	Bacolod	BCD		Philippines	PH	10.644815000000	122.933593000000	PHP
5334	Kidlington Airport	Oxford	OXF		United Kingdom	GB	51.766666000000	-1.250000000000	GBP
5335	Barra Colorado	Barra Colorado	BCL		Costa Rica	CR	10.768611000000	-83.585556000000	CRC
5336	Straubing	Straubing	RBM		Germany	DE	48.900833000000	12.518056000000	EUR
5337	Valencia Rail Station	Valencia Rail Station	YJV		Spain	ES	39.466667000000	-0.377222000000	EUR
5338	Reconquista	Reconquista	RCQ		Argentina	AR	-29.183333000000	-59.700000000000	ARS
5339	Rugao	Rugao	RUG		China	CN	32.258056000000	120.501667000000	RMB
5340	Khon Kaen	Khon Kaen	KKC		Thailand	TH	16.464444000000	102.782222000000	THB
5341	Madrid-Barajas Airport	Madrid	MAD		Spain and Canary Islands	ES	40.465150000000	-3.570209000000	EUR
5342	Huatulco Airport	Huatulco	HUX		Mexico	MX	15.768333000000	-96.235556000000	MXN
5343	Mataveri International Airport	Easter Island	IPC		Chile	CL	-27.116667000000	-109.366667000000	CLP
5344	Tri-Cities Airport	Pasco	PSC		United States	US	46.259094000000	-119.115200000000	USD
5345	Nanyuki	Nanyuki	NYK		Kenya	KE	0.028056000000	37.024722000000	KES
5346	Tonsberg Rail Station	Tonsberg Rail Station	XKW		Norway	NO	59.272222000000	10.408889000000	NOK
5347	Franca	Franca	FRC		Brazil	BR	-20.583333000000	-47.383333000000	BRL
5348	Qinhuangdao	Qinhuangdao	SHP		China	CN	39.967778000000	119.729167000000	RMB
5349	Kupang	Kupang	KOE		Indonesia	ID	-10.171667000000	123.671111000000	IDR
5350	Melbourne Essendon Apt	Melbourne (AU)	MEB		Australia	AU	-37.733333000000	144.900000000000	AUD
5351	Macas	Macas	XMS		Ecuador	EC	-2.299167000000	-78.120833000000	USD
5352	Kivalina	Kivalina	KVL		USA	US	67.736111000000	-164.563611000000	USD
5353	Kugluktuk Coppermine	Kugluktuk Coppermine	YCO		Canada	CA	67.816667000000	-115.143889000000	CAD
5354	Badu Island	Badu Island	BDD		Australia	AU	-10.116667000000	142.133333000000	AUD
5355	Tarcoola	Tarcoola	TAQ		Australia	AU	-30.683333000000	134.550000000000	AUD
5356	Ann Arbor	Ann Arbor	ARB		USA	US	42.223611000000	-83.745833000000	USD
5357	Qassumiut Heliport	Qassumiut Heliport	QJH		Greenland	GL	60.779444000000	-47.152222000000	DKK
5358	Umiujaq	Umiujaq	YUD		Canada	CA	56.535556000000	-76.518611000000	CAD
5359	Rotorua Airport	Rotorua	ROT		New Zealand	NZ	-38.109820000000	176.317459000000	NZD
5360	Narita International Airport	Tokyo	NRT		Japan	JP	35.773213000000	140.387443000000	JPY
5361	Kasos Island Airport	Kasos Island	KSJ		Greece	GR	35.421390000000	26.916668000000	EUR
5362	Nukus	Nukus	NCU		Uzbekistan	UZ	42.486667000000	59.622778000000	UZS
5363	Land's End	Land's End	LEQ		United Kingdom	GB	50.102778000000	-5.670556000000	GBP
5364	Segovia Guiomar Rail Station	Segovia Guiomar Rail Station	XOU		Spain	ES	40.910000000000	-4.094722000000	EUR
5365	Monte Dourado	Monte Dourado	MEU		Brazil	BR	-0.884444000000	-52.600000000000	BRL
5366	Nakashibetsu	Nakashibetsu	SHB		Japan	JP	43.577500000000	144.960000000000	JPY
5367	Kimam	Kimam	KMM		Indonesia	ID	-7.966667000000	138.900000000000	IDR
5368	Moala	Moala	MFJ		Fiji	FJ	-18.566944000000	179.952778000000	FJD
5369	Popayan	Popayan	PPN		Colombia	CO	2.454444000000	-76.609444000000	COP
5370	Narsaq	Narsaq	JNS		Greenland	GL	60.917500000000	-46.060000000000	DKK
5371	Truro Rail Station	Truro Rail Station	XLZ		Canada	CA	45.362778000000	-63.276111000000	CAD
5372	Bordeaux Airport	Bordeaux	BOD		France	FR	44.831020000000	-0.702170000000	EUR
5373	Sir Seretse Khama International Airport	Gaborone	GBE		Botswana	BW	-24.557982000000	25.924509000000	BWP
5374	Bahawalpur Airport	Bahawalpur	BHV		Pakistan	PK	29.400000000000	71.683333000000	PKR
5375	Diyarbakir Airport	Diyarbakir	DIY		Turkey	TR	37.903873000000	40.204580000000	USD
5376	Bahar Dar	Bahar Dar	BJR		Ethiopia	ET	11.608056000000	37.321667000000	ETB
5377	North Ronaldsay	North Ronaldsay	NRL		United Kingdom	GB	59.367500000000	-2.434444000000	GBP
5378	Vienna Westbahnhof Rail Station	Vienna Westbahnhof Rail Station	XWW		Austria	AT	48.196667000000	16.337222000000	EUR
5379	Sao Lourenco do Sul	Sao Lourenco do Sul	SQY		Brazil	BR	-31.382778000000	-52.032222000000	BRL
5380	Yiwu Rail Station	Yiwu Rail Station	YIU		China	CN	29.380556000000	120.038611000000	RMB
5381	Ormoc	Ormoc	OMC		Philippines	PH	11.050000000000	124.566667000000	PHP
5382	Lake Evella	Lake Evella	LEL		Australia	AU	-12.498889000000	135.805833000000	AUD
5383	Basse Terre	Basse Terre	BBR		Guadeloupe	GP	16.166667000000	-61.750000000000	EUR
5384	Fishers Island	Fishers Island	FID		USA	US	41.266667000000	-72.033333000000	USD
5385	Los Angeles Van Nuys Apt	Los Angeles	VNY		USA	US	34.206111000000	-118.490278000000	USD
5386	Landivisiau	Landivisiau	LDV		France	FR	48.530278000000	-4.151667000000	EUR
5387	Frederic Chopin Airport	Warsaw	WAW		Poland	PL	52.170906000000	20.973289000000	PLN
5388	Les Salines Airport	Annaba	AAE		Algeria	DZ	36.821392000000	7.811857000000	DZD
5389	Astana Airport	Astana	TSE		Kazakhstan	KZ	51.027811000000	71.461199000000	KZT
5390	Barnaul Airport	Barnaul	BAX		Russia	RU	53.361088000000	83.547646000000	RUB
5391	Avila Rail Station	Avila Rail Station	AVS		Spain	ES	40.656944000000	-4.683333000000	EUR
5392	Newark Northgate Rail Station	Newark Northgate Rail Station	XNK		United Kingdom	GB	53.083333000000	-0.013611000000	GBP
5393	Stevenage Rail Station	Stevenage Rail Station	XVJ		United Kingdom	GB	51.916667000000	-0.233333000000	GBP
5394	Maraba	Maraba	MAB		Brazil	BR	-5.368611000000	-49.138056000000	BRL
5395	Weifang	Weifang	WEF		China	CN	36.646944000000	119.118611000000	RMB
5396	Caticlan	Caticlan	MPH		Philippines	PH	11.924444000000	121.954167000000	PHP
5397	Kempsey	Kempsey	KPS		Australia	AU	-31.066667000000	152.766667000000	AUD
5398	Puerto Carreno	Puerto Carreno	PCR		Colombia	CO	6.184722000000	-67.493056000000	COP
5399	Groennedal	Groennedal	JGR		Greenland	GL	61.333333000000	-48.100000000000	DKK
5400	Lac Brochet	Lac Brochet	XLB		Canada	CA	58.616667000000	-101.466944000000	CAD
5401	Pleurtuit Airport	Dinard	DNR		France	FR	48.587778000000	-2.083611000000	EUR
5402	Granada Airport	Granada	GRX		Spain and Canary Islands	ES	37.184728000000	-3.776954000000	EUR
5403	Hamburg Finkenwerder	Hamburg	XFW		Germany	DE	53.535833000000	9.836944000000	EUR
5404	Drangedal Rail Station	Drangedal Rail Station	ZVD		Norway	NO	59.094444000000	9.064167000000	NOK
5405	In Guezzam	In Guezzam	INF		Algeria	DZ	19.561111000000	5.751389000000	DZD
5406	Aizawl	Aizawl	AJL		India	IN	23.838889000000	92.620278000000	INR
5407	Apataki	Apataki	APK		French Polynesia	PF	-15.573611000000	-146.415278000000	XPF
5408	Saidor	Saidor	SDI		Papua New Guinea	PG	-5.616667000000	146.466667000000	PGK
5409	Dallas/Fort Worth Alliance Apt	Dallas/Fort Worth	AFW		USA	US	32.983333000000	-97.316667000000	USD
5410	Poughkeepsie	Poughkeepsie	POU		USA	US	41.633333000000	-73.883333000000	USD
5411	Stuart Island	Stuart Island	YRR		Canada	CA	50.416667000000	-125.166667000000	CAD
5412	Moss-Rygge Airport	Rygge	RYG		Norway	NO	59.379030000000	10.800161000000	NOK
5413	James M. Cox Dayton International Airport	Dayton	DAY		United States	US	39.898007000000	-84.220767000000	USD
5414	Osvaldo Vieira Airport	Bissau	OXB		Guinea-Bissau	GW	11.888889000000	-15.657222000000	XOF
5415	Qaqortoq Heliport	Qaqortoq	JJU		Greenland	GL	60.716667000000	-46.033333000000	DKK
5416	Eisenach	Eisenach	EIB		Germany	DE	50.992778000000	10.472778000000	EUR
5417	Nuneaton Rail Station	Nuneaton Rail Station	XNV		United Kingdom	GB	52.526111000000	-1.464722000000	GBP
5418	Antwerp de Keyserlei Bus Station	Antwerp	ZAY		Belgium	BE	50.833333000000	4.333333000000	EUR
5419	Rio Hondo	Rio Hondo	RHD		Argentina	AR	-27.473611000000	-64.906667000000	ARS
5420	Xiangyang	Xiangyang	XFN		China	CN	32.150556000000	112.290833000000	RMB
5421	Bangkok Suvarnabhumi International Apt	Bangkok	NBK		Thailand	TH	13.685833000000	100.748889000000	THB
5422	Manga	Manga	MGP		Papua New Guinea	PG	-4.150000000000	153.033333000000	PGK
5423	Akure	Akure	AKR		Nigeria	NG	7.250000000000	5.300000000000	NGN
5424	Karluk	Karluk	KYK		USA	US	57.565556000000	-154.451944000000	USD
5425	Dawson City	Dawson City	YDA		Canada	CA	64.043056000000	-139.127778000000	CAD
5426	Ikerasak	Ikerasak	IKE		Greenland	GL	70.498056000000	-51.303056000000	DKK
5427	Weymont Rail Station	Weymont Rail Station	XFQ		Canada	CA	47.900000000000	-73.750000000000	CAD
5428	Avignon Tgv Rail Station	Avignon	XZN		France	FR	43.921667000000	4.785833000000	EUR
5429	Norwich Airport	Norwich	NWI		United Kingdom	GB	52.669534000000	1.276782000000	GBP
5430	Theodore Francis Green Memorial State Airport	Providence	PVD		United States	US	41.726312000000	-71.436317000000	USD
5431	Melilla Airport	Melilla	MLN		Spain and Canary Islands	ES	35.277077000000	-2.957473000000	EUR
5432	Bukhara	Bukhara	BHK		Uzbekistan	UZ	39.766389000000	64.480000000000	UZS
5433	Barrow-in-Furness	Barrow-in-Furness	BWF		United Kingdom	GB	54.116667000000	-3.233333000000	GBP
5434	Swansea	Swansea	SWS		United Kingdom	GB	51.605278000000	-4.067778000000	GBP
5435	Warrington B.q. Rail Station	Warrington B.q. Rail Station	XWN		United Kingdom	GB	53.400000000000	-2.616667000000	GBP
5436	Tulcea	Tulcea	TCE		Romania	RO	45.050000000000	28.700000000000	ROL
5437	Green Island	Green Island	GNI		Chinese Taipei	TW	23.100000000000	121.466667000000	TWD
5438	Kulu	Kulu	KUU		India	IN	31.876667000000	77.154444000000	INR
5439	Cleve	Cleve	CVC		Australia	AU	-33.700000000000	136.500000000000	AUD
5440	Victoria River Downs	Victoria River Downs	VCD		Australia	AU	-16.403611000000	131.002500000000	AUD
5441	Crooked Creek	Crooked Creek	CKD		USA	US	61.866667000000	-158.133333000000	USD
5442	Somerset	Somerset	SME		USA	US	37.054444000000	-84.615000000000	USD
5443	Ottawa Fallowfield Rail Station	Ottawa	ZIF		Canada	CA	52.943611000000	-91.313056000000	CAD
5444	Tenerife South Airport	Tenerife	TFS		Spain and Canary Islands	ES	28.044444000000	-16.572500000000	EUR
5445	Douala Airport	Douala	DLA		Cameroon	CM	4.013460000000	9.717018000000	XAF
5446	Ngurah Rai Airport	Denpasar Bali	DPS		Indonesia	ID	-8.744460000000	115.163304000000	IDR
5447	Kallinge Airport	Ronneby	RNB		Sweden	SE	56.258330000000	15.261111000000	SEK
5448	Arua	Arua	RUA		Uganda	UG	3.049722000000	30.911944000000	UGX
5449	Freiburg Rail Station	Freiburg Rail Station	QFB		Germany	DE	48.000000000000	7.850000000000	EUR
5450	Edinburgh Rail Station	Edinburgh Rail Station	ZXE		United Kingdom	GB	55.950000000000	-3.216667000000	GBP
5451	Paranagua	Paranagua	PNG		Brazil	BR	-25.516667000000	-48.500000000000	BRL
5452	Nampula	Nampula	APL		Mozambique	MZ	-15.105556000000	39.281667000000	MZM
5453	Pomala	Pomala	PUM		Indonesia	ID	-4.181111000000	121.615278000000	IDR
5454	Longreach	Longreach	LRE		Australia	AU	-23.431944000000	144.277778000000	AUD
5455	Barrancominas	Barrancominas	NBB		Colombia	CO	3.333333000000	-70.333333000000	COP
5456	Circle	Circle	IRC		USA	US	65.827778000000	-144.075833000000	USD
5457	Chemainus Rail Station	Chemainus Rail Station	XHS		Canada	CA	48.921389000000	-123.718333000000	CAD
5458	Valenca Airport	Valenca	VAL		Brazil	BR	-13.302605000000	-38.991905000000	BRL
5459	Eglinton Airport	Londonderry	LDY		United Kingdom	GB	55.039567000000	-7.155835000000	GBP
5460	Viru Viru International Airport	Santa Cruz	VVI		Bolivia	BO	-17.648234000000	-63.140489000000	BOB
5461	Pluguffan Airport	Quimper	UIP		France	FR	47.974445000000	-4.170833000000	EUR
5462	Carti	Carti	CTE		Panama	PA	9.316667000000	-79.100000000000	PAB
5463	Zaragoza Bus Station	Zaragoza Bus Station	RZG		Spain	ES	41.659167000000	-0.911111000000	EUR
5464	Swindon Rail Station	Swindon Rail Station	XWS		United Kingdom	GB	53.566667000000	-1.783333000000	GBP
5465	Ternopil	Ternopil	TNL		Ukraine	UA	49.566667000000	25.600000000000	UAH
5466	Kuqa	Kuqa	KCA		China	CN	41.718056000000	82.986667000000	RMB
5467	Trincomalee	Trincomalee	TRR		Sri Lanka	LK	8.533333000000	81.183333000000	LKR
5468	Grafton	Grafton	GFN		Australia	AU	-29.759444000000	153.030000000000	AUD
5469	Newman	Newman	ZNE		Australia	AU	-23.417778000000	119.802778000000	AUD
5470	Eureka	Eureka	EUE		USA	US	39.516667000000	-115.966667000000	USD
5471	Utopia Creek	Utopia Creek	UTO		USA	US	65.983333000000	-153.683333000000	USD
5472	Osijek Airport	Osijek	OSI		Croatia	HR	45.550000000000	18.683333000000	EUR
5473	Nondalton	Nondalton	NNL		USA	US	59.980556000000	-154.839167000000	USD
5474	Holyhead	Holyhead	HLY		United Kingdom	GB	53.316667000000	-4.633333000000	GBP
5475	Recklinghausen Rail Station	Recklinghausen Rail Station	ZPL		Germany	DE	51.616667000000	7.200000000000	EUR
5476	Baotou	Baotou	BAV		China	CN	40.560556000000	109.996389000000	RMB
5477	Hyderabad	Hyderabad (PK)	HDD		Pakistan	PK	25.318333000000	68.366389000000	PKR
5478	Bora Bora	Bora Bora	BOB		French Polynesia	PF	-16.444444000000	-151.751389000000	XPF
5479	Nukutavake	Nukutavake	NUK		French Polynesia	PF	-19.285000000000	-138.769722000000	XPF
5480	Niamtougou	Niamtougou	LRL		Togo	TG	9.550000000000	1.200000000000	XOF
5481	Marion	Marion	MWA		USA	US	37.751389000000	-89.016667000000	USD
5482	Chapleau	Chapleau	YLD		Canada	CA	47.833333000000	-83.400000000000	CAD
5483	Kalamata Airport	Kalamata	KLX		Greece	GR	37.069444000000	22.027778000000	EUR
5484	Lubbock International Airport	Lubbock	LBB		United States	US	33.656221000000	-101.822300000000	USD
5485	Alderney Airport	Alderney	ACI		United Kingdom	GB	49.709347000000	-2.215369000000	GBP
5486	Oradea Airport	Oradea	OMR		Romania	RO	47.027500000000	21.903055000000	ROL
5487	Nogales	Nogales	NOG		Mexico	MX	31.226111000000	-110.975833000000	MXN
5488	Colonsay	Colonsay	CSA		United Kingdom	GB	56.057778000000	-6.243056000000	GBP
5489	Stafford Rail Station	Stafford Rail Station	XVB		United Kingdom	GB	52.800000000000	-2.116667000000	GBP
5490	London Liverpool Street Rail Station	London Liverpool Street Rail Station	ZLS		United Kingdom	GB	51.518056000000	-0.082778000000	GBP
5491	Passos	Passos	PSW		Brazil	BR	-20.716667000000	-46.616667000000	BRL
5492	Rebun	Rebun	RBJ		Japan	JP	45.450000000000	141.050000000000	JPY
5493	Kota Bharu	Kota Bharu	KBR		Malaysia	MY	6.167500000000	102.291111000000	MYR
5494	Hooker Creek	Hooker Creek	HOK		Australia	AU	-18.338056000000	130.637500000000	AUD
5495	El Bagre	El Bagre	EBG		Colombia	CO	7.616667000000	-74.816667000000	COP
5496	Gallup	Gallup	GUP		USA	US	35.511111000000	-108.789444000000	USD
5497	West Yellowstone	West Yellowstone	WYS		USA	US	44.688333000000	-111.117778000000	USD
5498	Lille Europe Rail Station	Lille	XDB		France	FR	50.638889000000	3.076111000000	EUR
5499	Plovdiv Airport	Plovdiv	PDV		Bulgaria	BG	42.300000000000	24.716667000000	EUR
5500	London Gatwick Airport	London	LGW		United Kingdom	GB	51.156807000000	-0.161863000000	GBP
5501	Austin Straubel International Airport	Green Bay	GRB		United States	US	44.492848000000	-88.121896000000	USD
5502	Tarbes Ossun Lourdes Airport	Lourdes	LDE		France	FR	43.186510000000	0.003368000000	EUR
5503	Virgin Gorda	Virgin Gorda	VIJ		Virgin Islands, British	VG	18.446111000000	-64.428056000000	USD
5504	Gozo	Gozo	GZM		Malta	MT	36.033889000000	14.200833000000	EUR
5505	San Sebastian Rail Station	San Sebastian Rail Station	YJH		Spain	ES	43.318056000000	-1.976944000000	EUR
5506	Vallemi	Vallemi	VMI		Paraguay	PY	-22.250000000000	-58.000000000000	PYG
5507	M'Banza Congo	M'Banza Congo	SSY		Angola	AO	-6.266667000000	14.250000000000	AOA
5508	Bambu	Bambu	BCP		Papua New Guinea	PG	-5.850000000000	146.483333000000	PGK
5509	Tanna	Tanna	TAH		Vanuatu	VU	-19.455000000000	169.223889000000	VUV
5510	Alpena	Alpena	APN		USA	US	45.078056000000	-83.560278000000	USD
5511	Shageluk	Shageluk	SHX		USA	US	62.692500000000	-159.569167000000	USD
5512	Fort Mcpherson	Fort Mcpherson	ZFM		Canada	CA	67.407500000000	-134.860556000000	CAD
5513	Cardiff-Wales Airport	Cardiff	CWL		United Kingdom	GB	51.398768000000	-3.339075000000	GBP
5514	Maverick County Airport	Eagle Pass	EGP		United States	US	28.702222000000	-100.480556000000	USD
5515	Baneasa Airport	Bucharest	BBU		Romania	RO	44.495934000000	26.080996000000	ROL
5516	Hoonah Airport	Hoonah	HNH		United States	US	58.098057000000	-135.403340000000	USD
5517	Almeria Rail Station	Almeria Rail Station	AMR		Spain	ES	36.834722000000	-2.456389000000	EUR
5518	Barreiras	Barreiras	BRA		Brazil	BR	-12.079167000000	-45.009444000000	BRL
5519	Copenhagen H Rail Station	Copenhagen	ZGH		Denmark	DK	55.672778000000	12.564444000000	DKK
5520	Sharurah	Sharurah	SHW		Saudi Arabia	SA	17.466944000000	47.121389000000	SAR
5521	Mpacha	Mpacha	MPA		Namibia	NA	-17.633333000000	24.183333000000	NAD
5522	Apataki	Apataki	APK		French Polynesia	PF	-15.573611000000	-146.415278000000	XPF
5523	Cooma	Cooma	OOM		Australia	AU	-36.300556000000	148.973889000000	AUD
5524	Monrovia Spriggs Payne Apt	Monrovia	MLW		Liberia	LR	6.289167000000	-10.758611000000	LRD
5525	Nelson Lagoon	Nelson Lagoon	NLG		USA	US	56.007778000000	-161.160278000000	USD
5526	Moosonee	Moosonee	YMO		Canada	CA	51.289444000000	-80.606944000000	CAD
5527	Liszt Ferenc International Airport	Budapest	BUD		Hungary	HU	47.433037000000	19.261621000000	HUF
5528	Ciudad Del Carmen Airport	Ciudad Del Carmen	CME		Mexico	MX	18.651029000000	-91.802734000000	MXN
5529	Port Hedland Airport	Port Hedland	PHE		Australia	AU	-20.377945000000	118.631640000000	AUD
5530	Sitka Rocky Gutierrez Airport	Sitka	SIT		United States	US	57.048610000000	-135.233340000000	USD
5531	Albacete	Albacete	ABC		Spain	ES	38.948611000000	-1.863611000000	EUR
5532	Nuneaton Rail Station	Nuneaton Rail Station	XNV		United Kingdom	GB	52.526111000000	-1.464722000000	GBP
5533	Stoke On Trent Rail Station	Stoke On Trent Rail Station	XWH		United Kingdom	GB	53.000000000000	-2.166667000000	GBP
5534	Salta	Salta	SLA		Argentina	AR	-24.859722000000	-65.486944000000	ARS
5535	Xi'an Xiguan Apt	Xi'an	SIA		China	CN	34.376111000000	109.123889000000	RMB
5536	Kontum	Kontum	KON		Viet Nam	VN	14.356111000000	108.015556000000	VND
5537	Kuri	Kuri	KUQ		Papua New Guinea	PG	-7.133333000000	143.266667000000	PGK
5538	Puerto Ayacucho	Puerto Ayacucho	PYH		Venezuela	VE	5.620000000000	-67.606111000000	VEB
5539	Johnstown	Johnstown	JST		USA	US	40.316111000000	-78.833889000000	USD
5540	Brampton Rail Station	Brampton Rail Station	XPN		Canada	CA	43.683333000000	-79.766667000000	CAD
5541	Deering	Deering	DRG		USA	US	66.069444000000	-162.766389000000	USD
5542	Tatitlek	Tatitlek	TEK		USA	US	60.871389000000	-146.689722000000	USD
5543	Boston Bkbay Rail Station	Boston	ZTY		USA	US	42.347500000000	-71.076944000000	USD
5544	Wellington International Airport	Wellington	WLG		New Zealand	NZ	-41.329036000000	174.812163000000	NZD
5545	Campbellton Rail Station	Campbellton Rail Station	XAZ		Canada	CA	48.003611000000	-66.688333000000	CAD
5546	Orange Walk Airport	Orange Walk	ORZ		Belize	BZ	18.047064000000	-88.583786000000	BZD
5547	Granada Airport	Granada	GRX		Spain and Canary Islands	ES	37.184728000000	-3.776954000000	EUR
5548	Nashville International Airport	Nashville	BNA		United States	US	36.131740000000	-86.668945000000	USD
5549	Kirkwall Airport	Kirkwall	KOI		United Kingdom	GB	58.958057000000	-2.900556000000	GBP
5550	Houghton County Airport	Hancock	CMX		USA	US	47.167778000000	-88.486390000000	USD
5551	Aachen	Aachen	AAH		Germany	DE	50.823056000000	6.186389000000	EUR
5552	Soelden Bus Station	Soelden Bus Station	XOO		Austria	AT	46.967778000000	11.006944000000	EUR
5553	Leshukonskoye	Leshukonskoye	LDG		Russian Federation	RU	64.902778000000	45.708056000000	RUB
5554	Hami	Hami	HMI		China	CN	42.840833000000	93.670833000000	RMB
5555	Hatton	Hatton	NUF		Sri Lanka	LK	6.857222000000	80.588056000000	LKR
5556	Devonport	Devonport	DPO		Australia	AU	-41.169722000000	146.430278000000	AUD
5557	Takapoto	Takapoto	TKP		French Polynesia	PF	-14.709444000000	-145.245833000000	XPF
5558	Ziguinchor	Ziguinchor	ZIG		Senegal	SN	12.555556000000	-16.281667000000	XOF
5559	Port Moller	Port Moller	PML		USA	US	56.005000000000	-160.561389000000	USD
5560	Resolute	Resolute	YRB		Canada	CA	74.716944000000	-94.969444000000	CAD
5561	Eindhoven Airport	Eindhoven	EIN		Netherlands	NL	51.457953000000	5.391795000000	EUR
5562	Neerlerit Inaat Airport	Neerlerit Inaat	CNP		Greenland	GL	70.743056000000	-22.658333000000	DKK
5563	Sana'a International Airport	Sana'a	SAH		Republic of Yemen	YE	15.473598000000	44.225110000000	YER
5564	Tiree Airport	Tiree	TRE		United Kingdom	GB	56.500557000000	-6.871389000000	GBP
5565	Anegada	Anegada	NGD		Virgin Islands, British	VG	18.733333000000	-64.316667000000	USD
5566	Orzola	Orzola	OZL		Spain	ES	29.223056000000	-13.452222000000	EUR
5567	Durham Rail Station	Durham Rail Station	XVU		United Kingdom	GB	54.783333000000	-1.566667000000	GBP
5568	El Salvador	El Salvador	ESR		Chile	CL	-26.308333000000	-69.751667000000	CLP
5569	Ji'an	Ji'an	JGS		China	CN	26.857778000000	114.736389000000	RMB
5570	Saidpur	Saidpur	SPD		Bangladesh	BD	25.759167000000	88.908889000000	BDT
5571	Kerau	Kerau	KRU		Papua New Guinea	PG	-8.300000000000	147.083333000000	PGK
5572	Piura	Piura	PIU		Peru	PE	-5.205833000000	-80.616389000000	PEN
5573	Joplin	Joplin	JLN		USA	US	37.151944000000	-94.498333000000	USD
5574	Guildwood Rail Station	Guildwood Rail Station	XLQ		Canada	CA	43.755000000000	-79.198333000000	CAD
5575	Delingha Airport	Delingha	HXD		China	CN	37.125000000000	97.268610000000	RMB
5576	Nordela Airport	Ponta Delgada (Azores)	PDL		Portugal	PT	37.743847000000	-25.696469000000	EUR
5577	Felix Houphouet Boigny Airport	Abidjan	ABJ		Cote d'Ivoire	CI	5.254879000000	-3.933015000000	XOF
5578	Polonia Airport	Medan	MES		Indonesia	ID	3.561111000000	98.672778000000	IDR
5579	Brainerd-Crow Wing County Regional Airport	Brainerd	BRD		United States	US	46.390900000000	-94.141300000000	USD
5580	Braganca	Braganca	BGC		Portugal	PT	41.858056000000	-6.707222000000	EUR
5581	Ischgl Bus Station	Ischgl Bus Station	XOI		Austria	AT	47.011667000000	10.290833000000	EUR
5582	Fernando de Noronha	Fernando de Noronha	FEN		Brazil	BR	-3.855000000000	-32.423333000000	BRL
5583	Nanki Shirahama	Nanki Shirahama	SHM		Japan	JP	33.662222000000	135.364444000000	JPY
5584	Mulu	Mulu	MZV		Malaysia	MY	4.050556000000	114.809167000000	MYR
5585	Milford Sound	Milford Sound	MFN		New Zealand	NZ	-44.666667000000	167.916667000000	NZD
5586	Abeche	Abeche	AEH		Chad	TD	13.847500000000	20.844444000000	XAF
5587	Morristown	Morristown	MMU		USA	US	40.797778000000	-74.415278000000	USD
5588	Ivujivik	Ivujivik	YIK		Canada	CA	62.417222000000	-77.925278000000	CAD
5589	J. Paul II International Airport Krakow-Balice	Krakow	KRK		Poland	PL	50.075491000000	19.793744000000	PLN
5590	Livingstone Airport	Livingstone	LVI		Zambia	ZM	-17.820556000000	25.822222000000	ZMK
5591	Bandaranayake International Airport	Colombo	CMB		Sri Lanka	LK	7.174112000000	79.886494000000	LKR
5592	Abakan Airport	Abakan	ABA		Russia	RU	53.716667000000	91.500000000000	RUB
5593	Andavadoaka	Andavadoaka	DVD		Madagascar	MG	-22.078333000000	43.259167000000	MGA
5594	Papa Westray	Papa Westray	PPW		United Kingdom	GB	59.351389000000	-2.900000000000	GBP
5595	Runcorn Rail Station	Runcorn Rail Station	XRC		United Kingdom	GB	53.333333000000	-2.733333000000	GBP
5596	Juina	Juina	JIA		Brazil	BR	-11.500000000000	-58.883333000000	BRL
5597	Okha	Okha	OHH		Russian Federation	RU	53.000000000000	142.000000000000	RUB
5598	Langgur	Langgur	LUV		Indonesia	ID	-5.661667000000	132.731389000000	IDR
5599	Konge	Konge	KGB		Papua New Guinea	PG	-6.133333000000	147.650000000000	PGK
5600	Maripasoula	Maripasoula	MPY		French Guiana	GF	3.666667000000	-54.033333000000	EUR
5601	Iliamna	Iliamna	ILI		USA	US	59.754444000000	-154.910833000000	USD
5602	Ottawa Bus Station	Ottawa Bus Station	XGE		Canada	CA	45.408889000000	-75.695000000000	CAD
5603	Nimes Rail Station	Nimes Rail Station	ZYN		France	FR	43.832500000000	4.366389000000	EUR
5604	Ambouli Airport	Djibouti	JIB		Djibouti	DJ	11.552361000000	43.149678000000	DJF
5605	Nanjing Lukou International Airport	Nanking	NKG		China	CN	31.735737000000	118.866520000000	RMB
5606	Surgut Airport	Surgut	SGC		Russia	RU	61.339916000000	73.409530000000	RUB
5607	Debra Marcos	Debra Marcos	DBM		Ethiopia	ET	10.333333000000	37.766667000000	ETB
5608	Logrono	Logrono	RJL		Spain	ES	42.460556000000	-2.320556000000	EUR
5609	Stoke On Trent Rail Station	Stoke On Trent Rail Station	XWH		United Kingdom	GB	53.000000000000	-2.166667000000	GBP
5610	Sakkyryr	Sakkyryr	SUK		Russian Federation	RU	67.792222000000	130.392500000000	RUB
5611	Foshan	Foshan	FUO		China	CN	23.081667000000	113.070000000000	RMB
5612	Kelaniya	Kelaniya	KEZ		Sri Lanka	LK	6.968333000000	79.881111000000	LKR
5613	Cudal	Cudal	CUG		Australia	AU	-33.266667000000	148.766667000000	AUD
5614	Vanimo	Vanimo	VAI		Papua New Guinea	PG	-2.692500000000	141.302500000000	PGK
5615	Chandler Williams AFB	Chandler	CHD		USA	US	33.319444000000	-111.900000000000	USD
5616	Salem	Salem	SLE		USA	US	44.926111000000	-123.002500000000	USD
5617	London Southend Airport	Southend	SEN		United Kingdom	GB	51.572778000000	0.701389000000	GBP
5618	Biloxi Regional Airport	Gulfport	GPT		United States	US	30.413284000000	-89.072029000000	USD
5619	Lycksele Airport	Lycksele	LYC		Sweden	SE	64.550710000000	18.709670000000	SEK
5620	Guanaja	Guanaja	GJA		Honduras	HN	16.443889000000	-85.903889000000	HNL
5621	Fair Isle	Fair Isle	FIE		United Kingdom	GB	59.534722000000	-1.628611000000	GBP
5622	Cartagena Rail Station	Cartagena Rail Station	XUF		Spain	ES	37.604722000000	-0.973889000000	EUR
5623	Pechora	Pechora	PEX		Russian Federation	RU	65.119444000000	57.130556000000	RUB
5624	Ubari	Ubari	QUB		Libya	LY	26.568333000000	12.817778000000	LYD
5625	Batticaloa	Batticaloa	BTC		Sri Lanka	LK	7.704722000000	81.676667000000	LKR
5626	Canton Island	Canton Island	CIS		Kiribati	KI	-2.833333000000	-171.666667000000	AUD
5627	Southern Cross	Southern Cross	SQC		Australia	AU	-31.250000000000	119.366667000000	AUD
5628	Akulivik	Akulivik	AKV		Canada	CA	60.818611000000	-78.148611000000	CAD
5629	Chicago Palwaukee Apt	Chicago	PWK		USA	US	42.114444000000	-87.902500000000	USD
5630	Nanisivik	Nanisivik	YSR		Canada	CA	72.982222000000	-84.613611000000	CAD
5631	Madeira Airport	Funchal	FNC		Portugal	PT	32.693121000000	-16.775635000000	EUR
5632	Inverness Airport	Inverness	INV		United Kingdom	GB	57.539346000000	-4.063738000000	GBP
5633	Shimkent Airport	Shimkent	CIT		Kazakhstan	KZ	42.300000000000	69.600000000000	KZT
5634	Chester Airport	Chester	CEG		United Kingdom	GB	53.166668000000	-2.916667000000	GBP
5635	Chippewa Valley Regional Airport	Eau Claire	EAU		United States	US	44.864445000000	-91.487220000000	USD
5636	Kakamega	Kakamega	GGM		Kenya	KE	0.271389000000	34.787500000000	KES
5637	Kings Lynn	Kings Lynn	KNF		United Kingdom	GB	52.750000000000	0.400000000000	GBP
5638	Kirovograd	Kirovograd	KGO		Ukraine	UA	48.550000000000	32.300000000000	UAH
5639	Buerjin City	Buerjin City	KJI		China	CN	48.221667000000	86.996111000000	RMB
5640	Weerawila	Weerawila	WRZ		Sri Lanka	LK	6.254444000000	81.235278000000	LKR
5641	Gambier Island	Gambier Island	GMR		French Polynesia	PF	-23.080000000000	-134.890278000000	XPF
5642	Weipa	Weipa	WEI		Australia	AU	-12.678611000000	141.925278000000	AUD
5643	Charleston (US) WV	Charleston (US) WV	CRW		USA	US	38.373056000000	-81.593056000000	USD
5644	Stony River	Stony River	SRV		USA	US	61.789167000000	-156.589167000000	USD
5645	Sachigo Lake	Sachigo Lake	ZPB		Canada	CA	53.890833000000	-92.195833000000	CAD
5646	Gillies Bay	Gillies Bay	YGB		Canada	CA	49.694167000000	-124.517778000000	CAD
5647	Bremen Airport	Bremen	BRE		Germany	DE	53.052971000000	8.785352000000	EUR
5648	Norwich Airport	Norwich	NWI		United Kingdom	GB	52.669534000000	1.276782000000	GBP
5649	Hakodate Airport	Hakodate	HKD		Japan	JP	41.776125000000	140.815817000000	JPY
5650	Treviso Airport	Venice	TSF		Italy	IT	45.655113000000	12.204444000000	EUR
5651	Tamarindo	Tamarindo	TNO		Costa Rica	CR	10.315833000000	-85.812778000000	CRC
5652	Hagfors	Hagfors	HFS		Sweden	SE	60.020000000000	13.578889000000	SEK
5653	Grantham Rail Station	Grantham Rail Station	XGM		United Kingdom	GB	52.916667000000	-0.650000000000	GBP
5654	Warrington B.q. Rail Station	Warrington B.q. Rail Station	XWN		United Kingdom	GB	53.400000000000	-2.616667000000	GBP
5655	Guanambi	Guanambi	GNM		Brazil	BR	-14.216667000000	-42.783333000000	BRL
5656	Mandalgobi	Mandalgobi	MXW		Mongolia	MN	45.766667000000	106.283333000000	MNT
5657	Calbayog	Calbayog	CYP		Philippines	PH	12.072778000000	124.545000000000	PHP
5658	Itokama	Itokama	ITK		Papua New Guinea	PG	-9.200833000000	148.264722000000	PGK
5659	Ipiales	Ipiales	IPI		Colombia	CO	0.861944000000	-77.671667000000	COP
5660	Hopkinsville	Hopkinsville	HOP		USA	US	36.857222000000	-87.455278000000	USD
5661	Sarnia Rail Station	Sarnia	XDX		Canada	CA	42.957500000000	-82.389167000000	CAD
5662	Hoersching Airport	Linz	LNZ		Austria	AT	48.239868000000	14.193345000000	EUR
5663	Prestwick Airport	Glasgow	PIK		United Kingdom	GB	55.508432000000	-4.611286000000	GBP
5664	Morelia Airport	Morelia	MLM		Mexico	MX	19.843509000000	-101.026932000000	MXN
5665	Rota Airport	Rota	ROP		Northern Mariana Islands	MP	14.171568000000	145.244085000000	USD
5666	La Crosse Municipal Airport	La Crosse	LSE		United States	US	43.875244000000	-91.264336000000	USD
5667	Blackbushe	Blackbushe	BBS		United Kingdom	GB	51.323889000000	-0.847500000000	GBP
5668	Asker Rail Station	Asker Rail Station	XGU		Norway	NO	59.833611000000	10.432222000000	NOK
5669	Edinburgh Rail Station	Edinburgh Rail Station	ZXE		United Kingdom	GB	55.950000000000	-3.216667000000	GBP
5670	Mascara	Mascara	MUW		Algeria	DZ	35.207500000000	0.146111000000	DZD
5671	Bhavnagar	Bhavnagar	BHU		India	IN	21.752222000000	72.185278000000	INR
5672	Aitape	Aitape	ATP		Papua New Guinea	PG	-3.133333000000	142.350000000000	PGK
5673	Paraburdoo	Paraburdoo	PBO		Australia	AU	-23.171944000000	117.746667000000	AUD
5674	Fria	Fria	FIG		Guinea	GN	10.350000000000	-13.566667000000	GNF
5675	Carbondale	Carbondale	MDH		USA	US	37.783333000000	-89.250000000000	USD
5676	Havre St Pierre	Havre St Pierre	YGV		Canada	CA	50.281944000000	-63.611389000000	CAD
5677	Ireland West Airport Knock	Knock	NOC		Ireland	IE	53.914002000000	-8.810468000000	EUR
5678	Eglinton Airport	Londonderry	LDY		United Kingdom	GB	55.039567000000	-7.155835000000	GBP
5679	Shenzhen Bao'an International Airport	Shenzhen	SZX		China	CN	22.639444000000	113.810833000000	RMB
5680	Ulan-Ude Airport	Ulan-Ude	UUD		Russia	RU	51.833332000000	107.500000000000	RUB
5681	Soalala	Soalala	DWB		Madagascar	MG	-16.100000000000	45.366667000000	MGA
5682	Lund C Rail Station	Lund C Rail Station	XGC		Sweden	SE	55.705278000000	13.187222000000	SEK
5683	Swindon Rail Station	Swindon Rail Station	XWS		United Kingdom	GB	53.566667000000	-1.783333000000	GBP
5684	Gurupi	Gurupi	GRP		Brazil	BR	-11.666667000000	-49.216667000000	BRL
5685	Takamatsu	Takamatsu	TAK		Japan	JP	34.214167000000	134.015556000000	JPY
5686	Nunukan	Nunukan	NNX		Indonesia	ID	4.135833000000	117.668333000000	IDR
5687	Karoola	Karoola	KXR		Papua New Guinea	PG	-5.283333000000	154.600000000000	PGK
5688	Rodriguez de Mendoza	Rodriguez de Mendoza	RIM		Peru	PE	-6.000000000000	-78.000000000000	PEN
5689	Charleston International Airport	Charleston	CHS		United States	US	32.884355000000	-80.037157000000	USD
5690	Etimesgut Airport	Ankara	ANK		Turkey	TR	39.983334000000	32.833332000000	USD
5691	Northwest Arkansas Regional Airport	Bentonville	XNA		USA	US	36.275257000000	-94.297110000000	USD
5692	Coll	Coll	COL		United Kingdom	GB	56.601944000000	-6.617778000000	GBP
5693	Burgos Bus Station	Burgos Bus Station	XJU		Spain	ES	42.337778000000	-3.701111000000	EUR
5694	Divinopolis	Divinopolis	DIQ		Brazil	BR	-20.180556000000	-44.869444000000	BRL
5695	Lincang	Lincang	LNJ		China	CN	23.738889000000	100.025000000000	RMB
5696	Ban Me Thuot	Ban Me Thuot	BMV		Viet Nam	VN	12.668333000000	108.120278000000	VND
5697	Hamilton Airport	Hamilton	HLZ		New Zealand	NZ	-37.866220000000	175.336023000000	NZD
5698	Shizuoka Airport	Shizuoka	FSZ		Japan	JP	34.796111000000	138.189444000000	JPY
5699	Eppley Airfield	Omaha, NE	OMA		United States	US	41.299570000000	-95.899720000000	USD
5700	Quepos	Quepos	XQP		Costa Rica	CR	9.443056000000	-84.129722000000	CRC
5701	Bath Rail Station	Bath Rail Station	QQX		United Kingdom	GB	51.383333000000	-2.366667000000	GBP
5702	Angelholm Rail Station	Angelholm Rail Station	XYQ		Sweden	SE	56.245278000000	12.854167000000	SEK
5703	Enshi	Enshi	ENH		China	CN	30.321111000000	109.485278000000	RMB
5704	Ulgit	Ulgit	ULG		Mongolia	MN	48.993333000000	89.921944000000	MNT
5705	Meulaboh	Meulaboh	MEQ		Indonesia	ID	4.045556000000	96.249444000000	IDR
5706	Honinabi	Honinabi	HNN		Papua New Guinea	PG	-6.246111000000	142.176944000000	PGK
5707	Wudinna	Wudinna	WUD		Australia	AU	-33.016667000000	135.619444000000	AUD
5708	Dundas	Dundas	DUN		Greenland	GL	76.566667000000	-68.800000000000	DKK
5709	Talkeetna	Talkeetna	TKA		USA	US	62.300000000000	-150.116667000000	USD
5710	Chicago Rail Station	Chicago	ZUN		USA	US	41.877778000000	-87.641667000000	USD
5711	Launceston	Launceston	LST		Australia	AU	-41.545278000000	147.211111000000	AUD
5712	Tame	Tame	TME		Colombia	CO	6.451111000000	-71.760278000000	COP
5713	Olga Bay	Olga Bay	KOY		USA	US	57.150000000000	-154.233333000000	USD
5714	Brochet	Brochet	YBT		Canada	CA	57.884444000000	-101.668611000000	CAD
5715	Tegel Airport	Berlin	TXL		Germany	DE	52.553944000000	13.291722000000	EUR
5716	St Mawgan Airport	Newquay	NQY		United Kingdom	GB	50.437450000000	-4.997922000000	GBP
5717	Fukuoka Airport	Fukuoka	FUK		Japan	JP	33.584286000000	130.443891000000	JPY
5718	Sheppard Air Force Base-Wichita Falls Municipal Airport	Wichita Falls	SPS		United States	US	33.988335000000	-98.491940000000	USD
5719	Tambor	Tambor	TMU		Costa Rica	CR	9.739722000000	-85.016944000000	CRC
5720	Foula	Foula	FOA		United Kingdom	GB	60.122222000000	-2.053611000000	GBP
5721	Westray	Westray	WRY		United Kingdom	GB	59.350278000000	-2.950000000000	GBP
5722	Newport Rail Station	Newport Rail Station	XNE		United Kingdom	GB	51.583333000000	-3.000000000000	GBP
5723	Stromboli Island	Stromboli Island	ZJX		Italy	IT	38.797500000000	15.240278000000	EUR
5724	Jazan	Jazan	GIZ		Saudi Arabia	SA	16.901111000000	42.585833000000	SAR
5725	Beira	Beira	BEW		Mozambique	MZ	-19.796389000000	34.907500000000	MZM
5726	Merdey	Merdey	RDE		Indonesia	ID	-1.583333000000	133.333333000000	IDR
5727	Laucala Island	Laucala Island	LUC		Fiji	FJ	-16.749722000000	-179.667222000000	FJD
5728	Coca	Coca	OCC		Ecuador	EC	-0.462778000000	-76.986944000000	USD
5729	Innarsuit	Innarsuit	IUI		Greenland	GL	73.201667000000	-56.013611000000	DKK
5730	Napanee Rail Station	Napanee Rail Station	XIF		Canada	CA	44.250000000000	-76.950000000000	CAD
5731	Weeze Airport	Dusseldorf	NRN		Germany	DE	51.599286000000	6.150168000000	EUR
5732	Baltimore/Wash International Thurgood Marshall Airport	Baltimore	BWI		United States	US	39.179526000000	-76.668941000000	USD
5733	Colorado Springs Airport	Colorado Springs	COS		United States	US	38.797130000000	-104.700560000000	USD
5734	Page Municipal Airport	Page	PGA		United States	US	36.924300000000	-111.451000000000	USD
5735	Guettin	Guettin	GTI		Germany	DE	54.383333000000	12.316667000000	EUR
5736	Manchester Piccadilly Rail Station	Manchester (GB)	QQM		United Kingdom	GB	53.466667000000	-2.233333000000	GBP
5737	Tynset Rail Station	Tynset Rail Station	ZMX		Norway	NO	62.276111000000	10.771944000000	NOK
5738	Aldan	Aldan	ADH		Russian Federation	RU	58.602778000000	125.406667000000	RUB
5739	Dharavandhoo Island	Dharavandhoo Island	DRV		Maldives	MV	5.156944000000	73.130000000000	MVR
5740	Blenheim	Blenheim	BHE		New Zealand	NZ	-41.517778000000	173.869167000000	NZD
5741	Tabubil	Tabubil	TBG		Papua New Guinea	PG	-5.278611000000	141.226389000000	PGK
5742	Chuathbaluk	Chuathbaluk	CHU		USA	US	61.584722000000	-159.237778000000	USD
5743	Salina	Salina	SLN		USA	US	38.790833000000	-97.652222000000	USD
5744	Gethsemani	Gethsemani	ZGS		Canada	CA	50.259722000000	-60.674722000000	CAD
5745	Birmingham International Airport	Birmingham	BHX		United Kingdom	GB	52.452518000000	-1.733256000000	GBP
5746	Mouila	Mouila	MJL		Gabon	GA	-1.845278000000	11.056667000000	XAF
5747	Ninilchik	Ninilchik	NIN		USA	US	60.050000000000	-151.666667000000	USD
5748	Montagne Harbor	Montagne Harbor	YMF		Canada	CA	48.816667000000	-123.200000000000	CAD
5749	Parma Airport	Milan	PMF		Italy	IT	44.800000000000	10.333333000000	EUR
5750	Hurghada Airport	Hurghada	HRG		Egypt	EG	27.189156000000	33.805500000000	EGP
5751	Muan International Airport	Gwangju	MWX		Republic of Korea	KR	34.991406000000	126.382814000000	KRW
5752	Sanliurfa Airport	Sanliurfa	GNY		Turkey	TR	37.094166000000	38.846943000000	USD
5753	Jijiga	Jijiga	JIJ		Ethiopia	ET	9.363333000000	42.789722000000	ETB
5754	Monaco	Monaco	MCM		Monaco	MC	43.726111000000	7.420000000000	EUR
5755	Grantham Rail Station	Grantham Rail Station	XGM		United Kingdom	GB	52.916667000000	-0.650000000000	GBP
5756	Warrington B.q. Rail Station	Warrington B.q. Rail Station	XWN		United Kingdom	GB	53.400000000000	-2.616667000000	GBP
5757	Mossoro	Mossoro	MVF		Brazil	BR	-5.183333000000	-37.333333000000	BRL
5758	Strzhewoi	Strzhewoi	SWT		Russian Federation	RU	60.500000000000	77.000000000000	RUB
5759	Kerinci	Kerinci	KRC		Indonesia	ID	-2.093333000000	101.469167000000	IDR
5760	Kowanyama	Kowanyama	KWM		Australia	AU	-15.485278000000	141.752222000000	AUD
5761	Jasionka Airport	Rzeszow	RZE		Poland	PL	50.115248000000	22.031331000000	PLN
5762	Adrar Airport	Adrar	AZR		Algeria	DZ	27.883333000000	-0.283333000000	DZD
5763	Aktau Airport	Aktau	SCO		Kazakhstan	KZ	43.866667000000	51.100000000000	KZT
5764	Cambridge Airport	Cambridge	CBG		United Kingdom	GB	52.200000000000	0.183333000000	GBP
5765	Wick Airport	Wick	WIC		United Kingdom	GB	58.456944000000	-3.086667000000	GBP
5766	St Thomas SPB	St Thomas Island	SPB		Virgin Islands, US	VI	18.337778000000	-64.939722000000	USD
5767	Ipswich	Ipswich	IPW		United Kingdom	GB	52.033333000000	1.200000000000	GBP
5768	Erfurt Rail Station	Erfurt Rail Station	XIU		Germany	DE	50.983333000000	11.033333000000	EUR
5769	Juruena	Juruena	JRN		Brazil	BR	-10.305556000000	-58.488889000000	BRL
5770	Ube	Ube	UBJ		Japan	JP	33.930000000000	131.278611000000	JPY
5771	Lewoleba	Lewoleba	LWE		Indonesia	ID	-8.383333000000	123.400000000000	IDR
5772	Leonora	Leonora	LNO		Australia	AU	-28.878056000000	121.314722000000	AUD
5773	Tarapaca	Tarapaca	TCD		Colombia	CO	-2.895833000000	-69.750000000000	COP
5774	Klawock	Klawock	KLW		USA	US	55.579167000000	-133.076111000000	USD
5775	Bagotville	Bagotville	YBG		Canada	CA	48.332222000000	-70.992500000000	CAD
5776	Vancouver Coal Harbour SPB	Vancouver	CXH		Canada	CA	49.291667000000	-123.121389000000	CAD
5777	Silver City	Silver City	SVC		USA	US	32.632500000000	-108.156389000000	USD
5778	Providence Rail Station	Providence Rail Station	ZRV		USA	US	41.825278000000	-71.415000000000	USD
5779	Norwich Airport	Norwich	NWI		United Kingdom	GB	52.669534000000	1.276782000000	GBP
5780	Las Bajadas Airport	Veracruz	VER		Mexico	MX	19.142275000000	-96.183210000000	MXN
5781	Sioux Falls Regional Airport	Sioux Falls	FSD		United States	US	43.580296000000	-96.731150000000	USD
5782	Four Corners Regional Airport	Farmington	FMN		United States	US	36.738700000000	-108.227000000000	USD
5783	Barrow-in-Furness	Barrow-in-Furness	BWF		United Kingdom	GB	54.116667000000	-3.233333000000	GBP
5784	Swansea	Swansea	SWS		United Kingdom	GB	51.605278000000	-4.067778000000	GBP
5785	Grantham Rail Station	Grantham Rail Station	XGM		United Kingdom	GB	52.916667000000	-0.650000000000	GBP
5786	Offenburg Rail Station	Offenburg Rail Station	ZPA		Germany	DE	48.476111000000	7.946389000000	EUR
5787	Brack	Brack	BCQ		Libya	LY	27.683333000000	14.250000000000	LYD
5788	Tuli Block	Tuli Block	TLD		Botswana	BW	-22.166667000000	29.100000000000	BWP
5789	Tanjung Pelepas Ferry Port	Tanjung Pelepas Ferry Port	ZJT		Malaysia	MY	1.350000000000	103.550000000000	MYR
5790	Ramata	Ramata	RBV		Solomon Islands	SB	-8.167778000000	157.641944000000	SBD
5791	Sao Filipe	Sao Filipe	SFL		Cape Verde	CV	14.886667000000	-24.481944000000	CVE
5792	Atlanta de Kalb Peachtree	Atlanta	PDK		USA	US	33.883333000000	-84.300000000000	USD
5793	Pender Harbor	Pender Harbor	YPT		Canada	CA	49.500000000000	-124.033333000000	CAD
5794	Faro Airport	Faro	FAO		Portugal	PT	37.020646000000	-7.968545000000	EUR
5795	Prestwick Airport	Glasgow	PIK		United Kingdom	GB	55.508432000000	-4.611286000000	GBP
5796	Kostanay Airport	Kostanay	KSN		Kazakhstan	KZ	53.200000000000	63.550000000000	KZT
5797	Chateauroux Airport	Chateauroux	CHR		France	FR	46.816666000000	1.700000000000	EUR
5798	Sambu	Sambu	SAX		Panama	PA	8.025278000000	-78.208611000000	PAB
5799	Eskisehir	Eskisehir (TR) 00	ESK		Turkey	TR	39.766667000000	30.500000000000	USD
5800	Vulcano	Vulcano	ZIE		Italy	IT	38.415556000000	14.961944000000	EUR
5801	Coronel Suarez	Coronel Suarez	CSZ		Argentina	AR	-37.433333000000	-67.883333000000	ARS
5802	Tokyo Yokota AFB	Tokyo	OKO		Japan	JP	35.750000000000	139.350000000000	JPY
5803	Hue	Hue	HUI		Viet Nam	VN	16.400833000000	107.703056000000	VND
5804	Hikueru	Hikueru	HHZ		French Polynesia	PF	-17.548056000000	-142.613333000000	XPF
5805	Windarling	Windarling	WRN		Australia	AU	-30.032500000000	119.386389000000	AUD
5806	Danville	Danville	DNV		USA	US	40.200000000000	-87.583333000000	USD
5807	Tacoma McChord AFB	Tacoma	TCM		USA	US	47.138056000000	-122.476667000000	USD
5808	Philadelphia Trenton Rail Station	Philadelphia	ZTN		USA	US	40.220833000000	-74.733056000000	USD
5809	Eglinton Airport	Londonderry	LDY		United Kingdom	GB	55.039567000000	-7.155835000000	GBP
5810	El Paso International Airport	El Paso	ELP		United States	US	31.798949000000	-106.396003000000	USD
5811	Carpiquet Airport	Caen	CFR		France	FR	49.183437000000	-0.459276000000	EUR
5812	Arthur's Town	Arthur's Town	ATC		Bahamas	BS	24.629444000000	-75.673889000000	BSD
5813	Astypalaia Island	Astypalaia Island	JTY		Greece	GR	36.580000000000	26.375556000000	EUR
5814	Preston Rail Station	Preston Rail Station	XPT		United Kingdom	GB	53.766667000000	-2.700000000000	GBP
5815	Regensburg Rail Station	Regensburg Rail Station	ZPM		Germany	DE	49.012222000000	12.099722000000	EUR
5816	Amderma	Amderma	AMV		Russian Federation	RU	69.766667000000	61.550000000000	RUB
5817	Gilgit	Gilgit	GIL		Pakistan	PK	35.918889000000	74.333611000000	PKR
5818	Blackwater	Blackwater	BLT		Australia	AU	-23.603056000000	148.806944000000	AUD
5819	Teptep	Teptep	TEP		Papua New Guinea	PG	-5.950000000000	146.550000000000	PGK
5820	Aurora	Aurora	AUZ		USA	US	41.766667000000	-88.316667000000	USD
5821	Saqqaq	Saqqaq	QUP		Greenland	GL	70.011944000000	-51.932222000000	DKK
5822	Norman Wells	Norman Wells	YVQ		Canada	CA	65.281667000000	-126.798333000000	CAD
5823	Cotonou Airport	Cotonou	COO		Benin	BJ	6.353097000000	2.385271000000	XOF
5824	Wuhan Airport	Wuhan	WUH		China	CN	30.776598000000	114.209625000000	RMB
5825	Cheyenne Regional Jerry Olson Field	Cheyenne	CYS		United States	US	41.155834000000	-104.816666000000	USD
5826	Gjogur	Gjogur	GJR		Iceland	IS	65.995278000000	-21.326944000000	ISK
5827	Newark Northgate Rail Station	Newark Northgate Rail Station	XNK		United Kingdom	GB	53.083333000000	-0.013611000000	GBP
5828	Stevenage Rail Station	Stevenage Rail Station	XVJ		United Kingdom	GB	51.916667000000	-0.233333000000	GBP
5829	Punta del Este Bus Station	Punta del Este Bus Station	PVB		Uruguay	UY	-34.956944000000	-54.938889000000	UYU
5830	Catumbela	Catumbela	CBT		Angola	AO	-12.481389000000	13.486944000000	AOA
5831	Sandakan	Sandakan	SDK		Malaysia	MY	5.901389000000	118.061111000000	MYR
5832	Pajas Blancas Airport	Cordoba	COR		Argentina	AR	-31.315479000000	-64.213768000000	ARS
5833	Kirkwall Airport	Kirkwall	KOI		United Kingdom	GB	58.958057000000	-2.900556000000	GBP
5834	Bert Mooney Airport	Butte	BTM		United States	US	45.951110000000	-112.493890000000	USD
5835	Duisburg Rail Station	Duisburg Rail Station	DUI		Germany	DE	51.430000000000	6.773889000000	EUR
5836	Leksand Rail Station	Leksand Rail Station	XXO		Sweden	SE	60.733889000000	15.002778000000	SEK
5837	Volgodonsk	Volgodonsk	VLK		Russian Federation	RU	47.683333000000	42.083333000000	RUB
5838	Pohang	Pohang	KPO		Korea Republic of	KR	35.987778000000	129.420556000000	KRW
5839	Anggi	Anggi	AGD		Indonesia	ID	-1.383333000000	133.866667000000	IDR
5840	Gatokae	Gatokae	GTA		Solomon Islands	SB	-8.738611000000	158.202778000000	SBD
5841	Takapoto	Takapoto	TKP		French Polynesia	PF	-14.709444000000	-145.245833000000	XPF
5842	Block Island	Block Island	BID		USA	US	41.169444000000	-71.583333000000	USD
5843	Red Devil	Red Devil	RDV		USA	US	61.786944000000	-157.345278000000	USD
5844	Medicine Hat	Medicine Hat	YXH		Canada	CA	50.017222000000	-110.723056000000	CAD
5845	Eindhoven Airport	Eindhoven	EIN		Netherlands	NL	51.457953000000	5.391795000000	EUR
5846	Chicago/Rockford International Airport	Rockford	RFD		United States	US	42.303639000000	-89.222111000000	USD
5847	Aurillac Airport	Aurillac	AUR		France	FR	44.897500000000	2.418056000000	EUR
5848	Gelendzik Airport	Gelendzik	GDZ		Russia	RU	44.566666000000	38.016666000000	RUB
5849	Los Mochis	Los Mochis	LMM		Mexico	MX	25.685278000000	-109.080833000000	MXN
5850	Orzola	Orzola	OZL		Spain	ES	29.223056000000	-13.452222000000	EUR
5851	Durham Rail Station	Durham Rail Station	XVU		United Kingdom	GB	54.783333000000	-1.566667000000	GBP
5852	Mar del Plata	Mar del Plata	MDQ		Argentina	AR	-37.934167000000	-57.573333000000	ARS
5853	Lin Zhi	Lin Zhi	LZY		China	CN	29.621944000000	94.388611000000	RMB
5854	Babo	Babo	BXB		Indonesia	ID	-2.535000000000	133.438889000000	IDR
5855	Mendi	Mendi	MDU		Papua New Guinea	PG	-6.147778000000	143.657222000000	PGK
5856	Saul	Saul	XAU		French Guiana	GF	3.616667000000	-53.200000000000	EUR
5857	King Cove	King Cove	KVC		USA	US	55.116667000000	-162.265000000000	USD
5858	Cochrane	Cochrane	YCN		Canada	CA	49.066667000000	-81.016667000000	CAD
5859	Linz Rail Station	Linz	LZS		Austria	AT	48.290556000000	14.291111000000	EUR
5860	Riverside March AFB	Riverside	RIV		USA	US	33.880833000000	-117.259444000000	USD
5861	Whale Cove	Whale Cove	YXN		Canada	CA	62.239722000000	-92.597222000000	CAD
5862	Vaxjo Airport	Vaxjo	VXO		Sweden	SE	56.925094000000	14.732046000000	SEK
5863	Toncontin Airport	Tegucigalpa	TGU		Honduras	HN	14.060123000000	-87.219716000000	HNL
5864	Basra International Airport	Basra	BSR		Iraq	IQ	30.555556000000	47.791389000000	NID
5865	Fort Dodge Regional Airport	Fort Dodge	FOD		United States	US	42.552500000000	-94.189720000000	USD
5866	Barrow-in-Furness	Barrow-in-Furness	BWF		United Kingdom	GB	54.116667000000	-3.233333000000	GBP
5867	Swansea	Swansea	SWS		United Kingdom	GB	51.605278000000	-4.067778000000	GBP
5868	Grantham Rail Station	Grantham Rail Station	XGM		United Kingdom	GB	52.916667000000	-0.650000000000	GBP
5869	Hjerkinn Rail Station	Hjerkinn Rail Station	YVH		Norway	NO	62.219722000000	9.540833000000	NOK
5870	Al Ghaydah	Al Ghaydah	AAY		Yemen	YE	16.193611000000	52.173056000000	YER
5871	Hwange National Park	Hwange National Park	HWN		Zimbabwe	ZW	-18.630000000000	27.021111000000	ZWD
5872	Samarinda	Samarinda	SRI		Indonesia	ID	-0.484444000000	117.157222000000	IDR
5873	Nomad River	Nomad River	NOM		Papua New Guinea	PG	-6.650000000000	142.116667000000	PGK
5874	Kamina	Kamina	KMN		Congo Democratic Republic of	CD	-8.641111000000	25.250000000000	CDF
5875	Muskrat Dam	Muskrat Dam	MSA		Canada	CA	53.441389000000	-91.763056000000	CAD
5876	Kitchener/Waterloo	Kitchener/Waterloo	YKF		Canada	CA	43.460833000000	-80.378611000000	CAD
5877	Faro Airport	Faro	FAO		Portugal	PT	37.020646000000	-7.968545000000	EUR
5878	Prestwick Airport	Glasgow	PIK		United Kingdom	GB	55.508432000000	-4.611286000000	GBP
5879	Chapeco Airport	Chapeco	XAP		Brazil	BR	-27.088611000000	-52.629722000000	BRL
5880	Rota Airport	Rota	ROP		Northern Mariana Islands	MP	14.171568000000	145.244085000000	USD
5881	Chichen Itza	Chichen Itza	CZA		Mexico	MX	20.666667000000	-88.566667000000	MXN
5882	Blackbushe	Blackbushe	BBS		United Kingdom	GB	51.323889000000	-0.847500000000	GBP
5883	Karlshamn Rail Station	Karlshamn Rail Station	XYO		Sweden	SE	56.176944000000	14.868056000000	SEK
5884	Katowice Bus Station	Katowice Bus Station	ZFY		Poland	PL	50.250000000000	19.000000000000	PLN
5885	Yichun	Yichun	LDS		China	CN	47.751389000000	129.017778000000	RMB
5886	Biak	Biak	BIK		Indonesia	ID	-1.190000000000	136.108056000000	IDR
5887	Hikueru	Hikueru	HHZ		French Polynesia	PF	-17.548056000000	-142.613333000000	XPF
5888	Tubuai	Tubuai	TUB		French Polynesia	PF	-23.365278000000	-149.524167000000	XPF
5889	Battle Creek	Battle Creek	BTL		USA	US	42.303889000000	-85.256111000000	USD
5890	Rocky Mount	Rocky Mount	RWI		USA	US	35.766667000000	-77.966667000000	USD
5891	Lynn Lake	Lynn Lake	YYL		Canada	CA	56.863889000000	-101.076111000000	CAD
5892	Mahon Airport	Menorca	MAH		Spain and Canary Islands	ES	39.864745000000	4.226256000000	EUR
5893	Del Bajio Airport	Leon/Guanajuato	BJX		Mexico	MX	20.985699000000	-101.478995000000	MXN
5894	Nausori Airport	Suva	SUV		Fiji	FJ	-18.045885000000	178.559816000000	FJD
5895	Homer Airport	Homer	HOM		United States	US	59.643240000000	-151.493160000000	USD
5896	Essen	Essen	ESS		Germany	DE	51.402222000000	6.937222000000	EUR
5897	Preston Rail Station	Preston Rail Station	XPT		United Kingdom	GB	53.766667000000	-2.700000000000	GBP
5898	Basel/Mulhouse Sbb Rail Station	Basel/Mulhouse	ZDH		Switzerland	CH	47.547778000000	7.589722000000	CHF
5899	Bechar	Bechar	CBH		Algeria	DZ	31.646111000000	-2.278889000000	DZD
5900	Ulundi	Ulundi	ULD		South Africa	ZA	-28.320556000000	31.416667000000	ZAR
5901	Anaa	Anaa	AAA		French Polynesia	PF	-17.352500000000	-145.510000000000	XPF
5902	Porgera	Porgera	RGE		Papua New Guinea	PG	-5.483333000000	143.116667000000	PGK
5903	San Pedro (CI)	San Pedro (CI)	SPY		Cote D'Ivoire	CI	4.733333000000	-6.666667000000	XOF
5904	Miner's Bay	Miner's Bay	YAV		Canada	CA	48.866667000000	-123.300000000000	CAD
5905	Larnaca International Airport	Larnaca	LCA		Cyprus	CY	34.880866000000	33.625991000000	EUR
5906	Norwich Airport	Norwich	NWI		United Kingdom	GB	52.669534000000	1.276782000000	GBP
5907	Navegantes Airport	Navegantes	NVT		Brazil	BR	-26.866667000000	-48.633333000000	BRL
5908	Melilla Airport	Melilla	MLN		Spain and Canary Islands	ES	35.277077000000	-2.957473000000	EUR
5909	Independence	Independence	INB		Belize	BZ	16.534167000000	-88.443056000000	BZD
5910	Barrow-in-Furness	Barrow-in-Furness	BWF		United Kingdom	GB	54.116667000000	-3.233333000000	GBP
5911	Swansea	Swansea	SWS		United Kingdom	GB	51.605278000000	-4.067778000000	GBP
5912	Warrington B.q. Rail Station	Warrington B.q. Rail Station	XWN		United Kingdom	GB	53.400000000000	-2.616667000000	GBP
5913	Boa Vista	Boa Vista	BVB		Brazil	BR	2.846389000000	-60.690000000000	BRL
5914	Jixi	Jixi	JXA		China	CN	45.292500000000	131.191944000000	RMB
5915	Thimarafushi	Thimarafushi	TMF		Maldives	MV	2.210556000000	73.152500000000	MVR
5916	Geva	Geva	GEF		Solomon Islands	SB	-7.577778000000	156.597222000000	SBD
5917	Yeva	Yeva	YVD		Papua New Guinea	PG	-7.550000000000	146.166667000000	PGK
5918	Escanaba	Escanaba	ESC		USA	US	45.720556000000	-87.095833000000	USD
5919	University	University	UOX		USA	US	34.383333000000	-89.533333000000	USD
5920	Bourges	Bourges	BOU		France	FR	47.060833000000	2.370000000000	EUR
5921	Tenerife South Airport	Tenerife	TFS		Spain and Canary Islands	ES	28.044444000000	-16.572500000000	EUR
5922	Tobago Airport	Tobago	TAB		Trinidad and Tobago	TT	11.152541000000	-60.839685000000	TTD
6003	Nanaimo Harbour	Nanaimo	ZNA		Canada	CA	49.150000000000	-123.933333000000	CAD
5923	Nakhichevan Airport	Nakhichevan	NAJ		Azerbaijan	AZ	39.190278000000	45.458889000000	AZM
5924	Lipetsk Airport	Lipetsk	LPK		Russia	RU	52.703410000000	39.538220000000	RUB
5925	Blackbushe	Blackbushe	BBS		United Kingdom	GB	51.323889000000	-0.847500000000	GBP
5926	Sanliurfa	Sanliurfa	SFQ		Turkey	TR	37.094167000000	38.847222000000	USD
5927	Edinburgh Rail Station	Edinburgh Rail Station	ZXE		United Kingdom	GB	55.950000000000	-3.216667000000	GBP
5928	Tucuma	Tucuma	TUZ		Brazil	BR	-6.749167000000	-51.153611000000	BRL
5929	Huambo	Huambo	NOV		Angola	AO	-12.783333000000	15.766667000000	AOA
5930	Tuguegarao	Tuguegarao	TUG		Philippines	PH	17.641667000000	121.733611000000	PHP
5931	Mauke Island	Mauke Island	MUK		Cook Islands	CK	-20.136389000000	-157.345833000000	NZD
5932	Tarija	Tarija	TJA		Bolivia	BO	-21.551111000000	-64.708333000000	BOB
5933	New Stuyahok	New Stuyahok	KNW		USA	US	59.450556000000	-157.328611000000	USD
5934	Brandon	Brandon	YBR		Canada	CA	49.907778000000	-99.950833000000	CAD
5935	EuroAirport Swiss	Basel, Switzerland/Mulhouse	BSL		France	FR	47.599608000000	7.532604000000	EUR
5936	Eglinton Airport	Londonderry	LDY		United Kingdom	GB	55.039567000000	-7.155835000000	GBP
5937	La Chinita Airport	Maracaibo	MAR		Venezuela	VE	10.555564000000	-71.723508000000	VEB
5938	Westerland - Sylt Airport	Westerland	GWT		Germany	DE	54.915280000000	8.343056000000	EUR
5939	Puerto Cabezas	Puerto Cabezas	PUZ		Nicaragua	NI	14.047222000000	-83.386667000000	NIO
5940	Zaragoza Bus Station	Zaragoza Bus Station	RZG		Spain	ES	41.659167000000	-0.911111000000	EUR
5941	Swindon Rail Station	Swindon Rail Station	XWS		United Kingdom	GB	53.566667000000	-1.783333000000	GBP
5942	Cascavel	Cascavel	CAC		Brazil	BR	-25.000278000000	-53.500833000000	BRL
5943	Makung	Makung	MZG		Chinese Taipei	TW	23.568611000000	119.628333000000	TWD
5944	Dien Bien Phu	Dien Bien Phu	DIN		Viet Nam	VN	21.400000000000	103.004444000000	VND
5945	Ukiah	Ukiah	UKI		USA	US	39.126667000000	-123.200000000000	USD
5946	Jurado	Jurado	JUO		Colombia	CO	6.516667000000	-76.600000000000	COP
5947	Harrison	Harrison	HRO		USA	US	36.261389000000	-93.154722000000	USD
5948	Windsor Rail Station	Windsor	XEC		Canada	CA	42.325278000000	-83.008333000000	CAD
5949	Lyon Part-dieu Rail Station	Lyon	XYD		France	FR	45.760556000000	4.859444000000	EUR
5950	Lanzarote Airport	Lanzarote	ACE		Spain and Canary Islands	ES	28.950668000000	-13.609059000000	EUR
5951	King Shaka International Airport	Durban	DUR		South Africa	ZA	-29.614444000000	31.116389000000	ZAR
5952	Udon Thani Airport	Udon Thani	UTH		Thailand	TH	17.386610000000	102.774508000000	THB
5953	Hancock International Airport	Syracuse	SYR		USA	US	43.113983000000	-76.112230000000	USD
5954	Wangerooge	Wangerooge	AGE		Germany	DE	53.787222000000	7.915833000000	EUR
5955	Arvika Rail Station	Arvika Rail Station	XYY		Sweden	SE	59.653611000000	12.591111000000	SEK
5956	Uberlandia	Uberlandia	UDI		Brazil	BR	-18.882778000000	-48.225556000000	BRL
5957	Bloemfontein	Bloemfontein	BFN		South Africa	ZA	-29.092778000000	26.302500000000	ZAR
5958	Zugapa	Zugapa	UGU		Indonesia	ID	-3.733333000000	137.033333000000	IDR
5959	Port Lincoln	Port Lincoln	PLO		Australia	AU	-34.605278000000	135.880278000000	AUD
5960	Gao	Gao	GAQ		Mali	ML	16.248333000000	-0.005556000000	XOF
5961	Marshall (US) MO	Marshall (US) MO	MHL		USA	US	39.083333000000	-93.200000000000	USD
5962	Hudson Bay	Hudson Bay	YHB		Canada	CA	52.818611000000	-102.311111000000	CAD
5963	Amsterdam Airport Schiphol	Amsterdam	AMS		Netherlands	NL	52.309069000000	4.763385000000	EUR
5964	Chicago Midway International Airport	Chicago	MDW		United States	US	41.788136000000	-87.740871000000	USD
5965	Annecy-Meythet Airport	Annecy	NCY		France	FR	45.930557000000	6.100833000000	EUR
5966	 Albemarle Airport	Charlottesville	CHO		USA	US	38.139416000000	-78.449280000000	USD
5967	Castellon de la Plana Rail Station	Castellon de la Plana Rail Station	CPJ		Spain	ES	39.988333000000	-0.052222000000	EUR
5968	Caceres Rail Station	Caceres Rail Station	QUQ		Spain	ES	39.461389000000	-6.385833000000	EUR
5969	Ust-Maya	Ust-Maya	UMS		Russian Federation	RU	60.356111000000	134.434722000000	RUB
5970	Huang Ping	Huang Ping	KJH		China	CN	26.971944000000	107.987500000000	RMB
5971	Nawabshah	Nawabshah	WNS		Pakistan	PK	26.219167000000	68.390000000000	PKR
5972	Dalgaranga	Dalgaranga	DGD		Australia	AU	-27.830556000000	117.313889000000	AUD
5973	Thangool	Thangool	THG		Australia	AU	-24.495278000000	150.578889000000	AUD
5974	Blanding	Blanding	BDG		USA	US	37.583333000000	-109.483333000000	USD
5975	Kaltag	Kaltag	KAL		USA	US	64.318056000000	-158.743056000000	USD
5976	Belleville Rail Station	Belleville Rail Station	XVV		Canada	CA	44.179444000000	-77.375000000000	CAD
5977	Jeki Airstrip	Jeki	JEK		Zambia	ZM	-15.633121000000	29.603556000000	ZMK
5978	Miguel Hidal Airport	Guadalajara	GDL		Mexico	MX	20.525198000000	-103.299208000000	MXN
5979	Dala Airport	BorlangeFalun	BLE		Sweden	SE	60.429730000000	15.508260000000	SEK
5980	St Cloud Regional Airport	St. Cloud	STC		United States	US	45.550000000000	-94.166664000000	USD
5981	Farsund	Farsund	FAN		Norway	NO	58.100000000000	6.633333000000	NOK
5982	Ponza	Ponza	ZJY		Italy	IT	40.895278000000	12.963333000000	EUR
5983	Gurayat	Gurayat	URY		Saudi Arabia	SA	31.411944000000	37.279444000000	SAR
5984	Oranjemund	Oranjemund	OMD		Namibia	NA	-28.586667000000	16.446389000000	NAD
5985	Aurukun	Aurukun	AUU		Australia	AU	-13.353889000000	141.720833000000	AUD
5986	South Molle Island	South Molle Island	SOI		Australia	AU	-20.000000000000	149.000000000000	AUD
5987	Ngaoundere	Ngaoundere	NGE		Cameroon	CM	7.356944000000	13.559167000000	XAF
5988	Ittoqqortoormiit	Ittoqqortoormiit	OBY		Greenland	GL	70.488333000000	-21.971667000000	DKK
5989	Nemiscau	Nemiscau	YNS		Canada	CA	51.690833000000	-76.136667000000	CAD
5990	Amsterdam Airport Schiphol	Amsterdam	AMS		Netherlands	NL	52.309069000000	4.763385000000	EUR
5991	Miami International Airport	Miami	MIA		United States	US	25.796000000000	-80.278234000000	USD
5992	Jyvaskyla Airport	Jyvaskyla	JYV		Finland	FI	62.403620000000	25.681430000000	EUR
5993	Nevis	Nevis	NEV		Saint Kitts and Nevis, Leeward Islands	KN	17.205556000000	-62.590000000000	XCD
5994	Castellon de la Plana Rail Station	Castellon de la Plana Rail Station	CPJ		Spain	ES	39.988333000000	-0.052222000000	EUR
5995	Caceres Rail Station	Caceres Rail Station	QUQ		Spain	ES	39.461389000000	-6.385833000000	EUR
5996	Cachoeiro de Itapemirim	Cachoeiro de Itapemirim	CDI		Brazil	BR	-20.836111000000	-41.186944000000	BRL
5997	Nogliki	Nogliki	NGK		Russian Federation	RU	51.781667000000	143.140000000000	RUB
5998	Datadawai	Datadawai	DTD		Indonesia	ID	0.621667000000	116.600556000000	IDR
5999	Gasmata	Gasmata	GMI		Papua New Guinea	PG	-6.300000000000	150.333333000000	PGK
6000	Wedau	Wedau	WED		Papua New Guinea	PG	-10.100000000000	150.083333000000	PGK
6001	Jacksonville Craig Municipal Apt	Jacksonville (US) FL	CRG		USA	US	30.333889000000	-81.502500000000	USD
6002	Sterling	Sterling	SQI		USA	US	41.740278000000	-89.681111000000	USD
6004	Carsamba Airport	Samsun	SZF		Turkey	TR	41.257381000000	36.555057000000	USD
6005	Chengdu Shuangliu International Airport	Chengdu	CTU		China	CN	30.581134000000	103.956799000000	RMB
6006	Humberside Airport	Humberside	HUY		United Kingdom	GB	53.583378000000	-0.348510000000	GBP
6007	Pantelleria Airport	Pantelleria	PNL		Italy	IT	36.813610000000	11.966111000000	EUR
6008	Fianarantsoa	Fianarantsoa	WFI		Madagascar	MG	-21.441667000000	47.111667000000	MGA
6009	Berlin Ostbhf Rail Station	Berlin	QWB		Germany	DE	52.516667000000	13.416667000000	EUR
6010	Stafford Rail Station	Stafford Rail Station	XVB		United Kingdom	GB	52.800000000000	-2.116667000000	GBP
6011	Baku	Baku	BAK		Azerbaijan	AZ	40.483333000000	50.066667000000	AZM
6012	Dubai Marina Mall Ey Bus Stn	Dubai (AE) 00	XMB		United Arab Emirates	AE	25.076111000000	55.141111000000	AED
6013	Port Elizabeth	Port Elizabeth	PLZ		South Africa	ZA	-33.985000000000	25.617222000000	ZAR
6014	Busuanga	Busuanga	USU		Philippines	PH	12.121389000000	120.100000000000	PHP
6015	Murray Island	Murray Island	MYI		Australia	AU	-9.933333000000	144.016667000000	AUD
6016	Goma	Goma	GOM		Congo Democratic Republic of	CD	-1.670833000000	29.238333000000	CDF
6017	Muncie	Muncie	MIE		USA	US	40.233333000000	-85.400000000000	USD
6018	Campbell River Harbor SPB	Campbell River	YHH		Canada	CA	50.016667000000	-125.250000000000	CAD
6019	Barahona Airport	Barahona	BRX		Dominican Republic	DO	18.216667000000	-71.116667000000	DOP
6020	Ninoy Aquino International Airport	Manila	MNL		Philippines	PH	14.509602000000	121.012509000000	PHP
6021	Kunming Changshui Intl	Kunming	KMG		China	CN	25.101944000000	102.929170000000	RMB
6022	Maroantsetra	Maroantsetra	WMN		Madagascar	MG	-15.436667000000	49.688333000000	MGA
6023	Lorca Bus Station	Lorca Bus Station	XJR		Spain	ES	37.671111000000	-1.696667000000	EUR
6024	Corrientes	Corrientes	CNQ		Argentina	AR	-27.445556000000	-58.761944000000	ARS
6025	Yakushima	Yakushima	KUM		Japan	JP	30.383333000000	130.666667000000	JPY
6026	Alor Setar	Alor Setar	AOR		Malaysia	MY	6.194444000000	100.400833000000	MYR
6027	Kanabea	Kanabea	KEX		Papua New Guinea	PG	-7.766667000000	145.900000000000	PGK
6028	Canaima	Canaima	CAJ		Venezuela	VE	6.234444000000	-62.855278000000	VEB
6029	Fort Lauderdale Executive Apt	Fort Lauderdale	FXE		USA	US	26.196111000000	-80.169722000000	USD
6030	Hyder	Hyder	WHD		USA	US	55.916667000000	-130.016667000000	USD
6031	St Brieuc	St Brieuc	SBK		France	FR	48.537500000000	-2.856667000000	EUR
6032	Chub Cay Airport	Chub Cay	CCZ		Bahamas	BS	25.417500000000	-77.881389000000	BSD
6033	Batu Berendum Airport	Malacca	MKZ		Malaysia	MY	2.264167000000	102.253333000000	MYR
6034	Tallahassee Regional Airport	Tallahassee	TLH		United States	US	30.395782000000	-84.344440000000	USD
6035	Ustupo	Ustupo	UTU		Panama	PA	9.416667000000	-78.600000000000	PAB
6036	Dover Rail Station	Dover Rail Station	QQD		United Kingdom	GB	51.133333000000	1.316667000000	GBP
6037	Stockport Rail Station	Stockport Rail Station	XVA		United Kingdom	GB	53.416667000000	-2.166667000000	GBP
6038	Boca do Acre	Boca do Acre	BCR		Brazil	BR	-8.633333000000	-67.416667000000	BRL
6039	Jiamusi	Jiamusi	JMU		China	CN	46.843333000000	130.465278000000	RMB
6040	Tuticorin	Tuticorin	TCR		India	IN	8.723333000000	78.026389000000	INR
6041	Garaina	Garaina	GAR		Papua New Guinea	PG	-7.866667000000	147.133333000000	PGK
6042	Uvol	Uvol	UVO		Papua New Guinea	PG	-6.016667000000	150.950000000000	PGK
6043	Chicago Meigs Field	Chicago	CGX		USA	US	41.858889000000	-87.608333000000	USD
6044	Skwentna	Skwentna	SKW		USA	US	61.964722000000	-151.188056000000	USD
6045	Buffalo-depew Rail Station	Buffalo-depew Rail Station	ZFZ		USA	US	42.914167000000	-78.677222000000	USD
6046	New London Rail Station	New London Rail Station	ZGD		USA	US	41.349444000000	-72.102500000000	USD
6047	Arville Airport	Angers	ANE		France	FR	47.466667000000	-0.550000000000	EUR
6048	Monterey Peninsula Airport	Monterey	MRY		United States	US	36.587296000000	-121.850815000000	USD
6049	Pamplona Rail Station	Pamplona Rail Station	EEP		Spain	ES	42.825278000000	-1.661667000000	EUR
6050	Berkak Rail Station	Berkak Rail Station	XUB		Norway	NO	62.822222000000	10.014722000000	NOK
6051	Ponta Grossa	Ponta Grossa	PGZ		Brazil	BR	-25.083333000000	-50.150000000000	BRL
6052	Tottori	Tottori	TTJ		Japan	JP	35.530000000000	134.166667000000	JPY
6053	Phetchabun	Phetchabun	PHY		Thailand	TH	16.676944000000	101.195000000000	THB
6054	Moorea	Moorea	MOZ		French Polynesia	PF	-17.490000000000	-149.761944000000	XPF
6055	Santa Rosalia	Santa Rosalia	SSL		Colombia	CO	1.466667000000	-72.233333000000	COP
6056	Kongiganak	Kongiganak	KKH		USA	US	59.960278000000	-162.881389000000	USD
6057	St Anthony	St Anthony	YAY		Canada	CA	51.391944000000	-56.083056000000	CAD
6058	Franz Josef Strauss Airport	Munich	MUC		Germany	DE	48.353005000000	11.790143000000	EUR
6059	Atlantic City International Airport	Atlantic City	ACY		United States	US	39.450701000000	-74.572233000000	USD
6060	Saratov Airport	Saratov	RTW		Russian Federation	RU	51.566666000000	46.066666000000	RUB
6061	Lovell Field	Chattanooga	CHA		United States	US	35.036926000000	-85.197784000000	USD
6062	Vatomandry	Vatomandry	VAT		Madagascar	MG	-19.383333000000	48.950000000000	MGA
6063	Dover Rail Station	Dover Rail Station	QQD		United Kingdom	GB	51.133333000000	1.316667000000	GBP
6064	Stockport Rail Station	Stockport Rail Station	XVA		United Kingdom	GB	53.416667000000	-2.166667000000	GBP
6065	Miramar	Miramar	MJR		Argentina	AR	-38.266667000000	-57.850000000000	ARS
6066	Shashi	Shashi	SHS		China	CN	30.316667000000	112.233333000000	RMB
6067	Khong	Khong	KOG		Lao People's Democratic Republic	LA	14.100000000000	105.833333000000	LAK
6068	Kubin Island	Kubin Island	KUG		Australia	AU	-10.225000000000	142.218333000000	AUD
6069	Huanuco	Huanuco	HUU		Peru	PE	-9.880000000000	-76.207222000000	PEN
6070	Hickory	Hickory	HKY		USA	US	35.733333000000	-81.383333000000	USD
6071	London Rail Station	London (CA)	XDQ		Canada	CA	43.036111000000	-81.152778000000	CAD
6072	Paris Massy Tgv Rail Station	Paris	XJY		France	FR	48.725000000000	2.260556000000	EUR
6073	Truk Airport	Truk, Caroline Islands	TKK		Micronesia	FM	7.457446000000	151.842005000000	USD
6074	Richmond International Airport (Byrd Field)	Richmond	RIC		United States	US	37.506111000000	-77.322500000000	USD
6075	Mildenhall Airport	Mildenhall	MHZ		United Kingdom	GB	52.366670000000	0.483333000000	GBP
6076	Abraham Lincoln Capital Airport	Springfield	SPI		United States	US	39.844166000000	-89.678890000000	USD
6077	Grimsey	Grimsey	GRY		Iceland	IS	66.554722000000	-18.017500000000	ISK
6078	Ciudad Real Rail Station	Ciudad Real Rail Station	XJI		Spain	ES	38.985000000000	-3.913333000000	EUR
6079	Campinas	Campinas	CPQ		Brazil	BR	-22.756111000000	-47.269444000000	BRL
6080	Kavalerovo	Kavalerovo	KVR		Russian Federation	RU	44.272500000000	135.028889000000	RUB
6081	Baguio	Baguio	BAG		Philippines	PH	16.375000000000	120.619722000000	PHP
6082	Kingscote	Kingscote	KGC		Australia	AU	-35.715833000000	137.525833000000	AUD
6083	Merida (VE)	Merida (VE)	MRD		Venezuela	VE	8.582222000000	-71.161111000000	VEB
6084	Willmar	Willmar	ILL		USA	US	45.116667000000	-95.100000000000	USD
6085	Cobourg Rail Station	Cobourg Rail Station	XGJ		Canada	CA	43.968056000000	-78.170833000000	CAD
6086	Exeter St Thomas Railway Station	Exeter	EXS		United Kingdom	GB	50.717130000000	-3.538580000000	GBP
6087	Bristol Temple Meads Railway Station	Bristol	TPB		United Kingdom	GB	51.449000000000	-2.580000000000	GBP
6088	Costa Brava Airport	Girona	GRO		Spain and Canary Islands	ES	41.898041000000	2.766383000000	EUR
6089	Reao	Reao	REA		French Polynesia	PF	-18.466111000000	-136.439444000000	XPF
6090	North Bay Airport	Barra	BRR		United Kingdom	GB	57.023335000000	-7.440278000000	GBP
6091	Vitoria Airport	Vitoria	VIT		Spain and Canary Islands	ES	42.833332000000	-2.500000000000	EUR
6092	Puerto Penasco	Puerto Penasco	PPE		Mexico	MX	31.352778000000	-113.519167000000	MXN
6093	Oviedo Rail Station	Oviedo Rail Station	OVI		Spain	ES	43.366111000000	-5.854722000000	EUR
6094	Brest (BY)	Brest (BY)	BQT		Belarus	BY	52.108333000000	23.896944000000	BYR
6095	Tiaret	Tiaret	TID		Algeria	DZ	35.341667000000	1.466944000000	DZD
6096	Cooch Behar	Cooch Behar	COH		India	IN	26.333333000000	89.466667000000	INR
6097	Aiyura	Aiyura	AYU		Papua New Guinea	PG	-6.333333000000	145.900000000000	PGK
6098	South West Bay	South West Bay	SWJ		Vanuatu	VU	-16.486389000000	167.447222000000	VUV
6099	Annette Island	Annette Island	ANN		USA	US	55.033333000000	-131.566667000000	USD
6100	Akunnaaq	Akunnaaq	QCU		Greenland	GL	68.744444000000	-52.340556000000	DKK
6101	Cape Dorset	Cape Dorset	YTE		Canada	CA	64.230000000000	-76.526667000000	CAD
6102	Alicante Airport	Alicante	ALC		Spain and Canary Islands	ES	38.287098000000	-0.557381000000	EUR
6103	Memphis International Airport	Memphis	MEM		United States	US	35.044579000000	-89.982258000000	USD
6104	Axamo Airport	Jonkoping	JKG		Sweden	SE	57.750100000000	14.070497000000	SEK
6105	Negril	Negril	NEG		Jamaica	JM	18.308333000000	-78.333333000000	JMD
6106	Coll	Coll	COL		United Kingdom	GB	56.601944000000	-6.617778000000	GBP
6107	Nordagutu Rail Station	Nordagutu Rail Station	XUO		Norway	NO	59.418056000000	9.322500000000	NOK
6108	Malargue	Malargue	LGS		Argentina	AR	-35.495278000000	-69.573056000000	ARS
6109	Qionghai Rail Station	Qionghai Rail Station	QHX		China	CN	19.241667000000	110.487778000000	RMB
6110	Kau	Kau	KAZ		Indonesia	ID	1.184722000000	127.896111000000	IDR
6111	Nador Airport	Nador	NDR		Morocco	MA	35.150000000000	-2.916667000000	MAD
6112	Borjhar Airport	Guwahati	GAU		India	IN	26.105982000000	91.588813000000	INR
6113	Mobile Regional Airport	Mobile	MOB		United States	US	30.681086000000	-88.244750000000	USD
6114	Lindi	Lindi	LDI		Tanzania United Republic of	TZ	-9.833333000000	39.783333000000	TZS
6115	Bath Rail Station	Bath Rail Station	QQX		United Kingdom	GB	51.383333000000	-2.366667000000	GBP
6116	Rurrenabaque	Rurrenabaque	RBQ		Bolivia	BO	-14.426667000000	-67.498889000000	BOB
6117	Upernavik	Upernavik	JUV		Greenland	GL	72.790556000000	-56.131111000000	DKK
6118	Ross River	Ross River	XRR		Canada	CA	61.983333000000	-132.450000000000	CAD
6119	Llabanere Airport	Perpignan	PGF		France	FR	42.741018000000	2.868183000000	EUR
6120	Prestwick Airport	Glasgow	PIK		United Kingdom	GB	55.508432000000	-4.611286000000	GBP
6121	Meacham Field	Fort Worth	FTW		United States	US	32.750000000000	-97.333333000000	USD
6122	Rota Airport	Rota	ROP		Northern Mariana Islands	MP	14.171568000000	145.244085000000	USD
6123	Salisbury Ocean City Wicomico Regional Airport	Salisbury	SBY		United States	US	38.343120000000	-75.517265000000	USD
6124	Blackbushe	Blackbushe	BBS		United Kingdom	GB	51.323889000000	-0.847500000000	GBP
6125	Madrid Chamartin Rail Station	Madrid	XTI		Spain	ES	40.473889000000	-3.682500000000	EUR
6126	Edinburgh Rail Station	Edinburgh Rail Station	ZXE		United Kingdom	GB	55.950000000000	-3.216667000000	GBP
6127	Dandong	Dandong	DDG		China	CN	40.025556000000	124.286944000000	RMB
6128	Jamshedpur	Jamshedpur	IXW		India	IN	22.816667000000	86.166667000000	INR
6129	Canberra	Canberra	CBR		Australia	AU	-35.306944000000	149.195000000000	AUD
6130	Suki	Suki	SKC		Papua New Guinea	PG	-8.150000000000	141.716667000000	PGK
6131	Mayoumba	Mayoumba	MYB		Gabon	GA	-3.450000000000	10.683333000000	XAF
6132	Nunapitchuk	Nunapitchuk	NUP		USA	US	60.904167000000	-162.441667000000	USD
6133	Ottawa Gatineau Airport	Ottawa	YND		Canada	CA	45.450000000000	-75.666667000000	CAD
6134	Lodz Lublinek Airport	Lodz	LCJ		Poland	PL	51.721944000000	19.398333000000	PLN
6135	Lusaka Airport	Lusaka	LUN		Zambia	ZM	-15.325017000000	28.445748000000	ZMK
6136	Brunei International Airport	Bandar Seri Begawan	BWN		Brunei Darussalam	BN	4.945197000000	114.933750000000	BND
6137	Westchester County Airport	Westchester County	HPN		United States	US	41.068672000000	-73.703890000000	USD
6138	Pakuba	Pakuba	PAF		Uganda	UG	2.200833000000	31.551667000000	UGX
6139	Preston Rail Station	Preston Rail Station	XPT		United Kingdom	GB	53.766667000000	-2.700000000000	GBP
6140	Swindon Rail Station	Swindon Rail Station	XWS		United Kingdom	GB	53.566667000000	-1.783333000000	GBP
6141	Niquelandia	Niquelandia	NQL		Brazil	BR	-14.434722000000	-48.491944000000	BRL
6142	Macao	Macao	XZM		Macao (sar) China	MO	22.196667000000	113.558611000000	MOP
6143	Saumlaki	Saumlaki	SXK		Indonesia	ID	-7.988056000000	131.305000000000	IDR
6144	Misima Island	Misima Island	MIS		Papua New Guinea	PG	-10.689444000000	152.836111000000	PGK
6145	Bafoussam	Bafoussam	BFX		Cameroon	CM	5.533333000000	10.350000000000	XAF
6146	Lebanon	Lebanon	LEB		USA	US	43.627778000000	-72.307222000000	USD
6147	Dawson Creek	Dawson Creek	YDQ		Canada	CA	55.742222000000	-120.183056000000	CAD
6148	Merced Castle AFB	Merced	MER		USA	US	37.300000000000	-120.483333000000	USD
6149	Grise Fiord	Grise Fiord	YGZ		Canada	CA	76.426667000000	-82.912500000000	CAD
6150	Athens International Airport Eleftherios Venizelos	Athens	ATH		Greece	GR	37.936350000000	23.946486000000	EUR
6151	Beef Island Airport	Beef Island	EIS		British Virgin Islands	VG	18.443889000000	-64.542778000000	USD
6152	King Abdulaziz International Airport	Jeddah	JED		Saudi Arabia	SA	21.670232000000	39.150579000000	SAR
6153	Southwest Georgia Regional Airport	Albany	ABY		United States	US	31.532223000000	-84.196110000000	USD
6154	Doncaster	Doncaster	DCS		United Kingdom	GB	53.466667000000	-1.000000000000	GBP
6155	Tortoli	Tortoli	TTB		Italy	IT	39.919167000000	9.682500000000	EUR
6156	Fulda Rail Station	Fulda Rail Station	ZEE		Germany	DE	50.553889000000	9.683889000000	EUR
6157	Rafha	Rafha	RAH		Saudi Arabia	SA	29.626389000000	43.490556000000	SAR
6158	Lusikisiki	Lusikisiki	LUJ		South Africa	ZA	-31.366667000000	29.583333000000	ZAR
6159	Thakhek	Thakhek	THK		Lao People's Democratic Republic	LA	17.400000000000	104.816667000000	LAK
6160	Oamaru	Oamaru	OAM		New Zealand	NZ	-44.968333000000	171.080000000000	NZD
6161	Bouna	Bouna	BQO		Cote D'Ivoire	CI	9.266667000000	-3.000000000000	XOF
6162	Columbus Lawson AAF	Columbus (US) GA	LSF		USA	US	32.366667000000	-84.833333000000	USD
6163	Fort Mackay	Fort Mackay	YFI		Canada	CA	57.225833000000	-110.976667000000	CAD
6164	Gal Galilei Airport	Pisa	PSA		Italy	IT	43.698713000000	10.399915000000	EUR
6165	Reno/Tahoe International Airport	Reno	RNO		United States	US	39.505782000000	-119.775698000000	USD
6166	Milano Linate Airport	Milan	LIN		Italy	IT	45.460957000000	9.279157000000	EUR
6167	Jalapa	Jalapa	JAL		Mexico	MX	19.475000000000	-96.797500000000	MXN
6168	Bradford (GB)	Bradford (GB)	BRF		United Kingdom	GB	53.802778000000	-1.750000000000	GBP
6169	Sheffield	Sheffield	SZD		United Kingdom	GB	53.394167000000	-1.388333000000	GBP
6170	Barcelona Sants Rail Stn	Barcelona (ES)	YJB		Spain	ES	41.379167000000	2.140000000000	EUR
6171	Kerama	Kerama	KJP		Japan	JP	26.166667000000	127.300000000000	JPY
6172	Rosh Pina	Rosh Pina	RHN		Namibia	NA	-27.966667000000	16.700000000000	NAD
6173	Bialla	Bialla	BAA		Papua New Guinea	PG	5.045556000000	119.743333000000	PGK
6174	Sale	Sale	SXE		Australia	AU	-38.083333000000	146.966667000000	AUD
6175	Altoona	Altoona	AOO		USA	US	40.296389000000	-78.320000000000	USD
6176	Eqalugaarsuit Heliport	Eqalugaarsuit Heliport	QFG		Greenland	GL	60.624722000000	-45.913333000000	DKK
6177	Sullivan Bay	Sullivan Bay	YTG		Canada	CA	50.883333000000	-126.800000000000	CAD
6178	Orsk Airport	Orsk	OSW		Russia	RU	51.200000000000	58.566666000000	RUB
6179	La Aurora Airport	Guatemala City	GUA		Guatemala	GT	14.588071000000	-90.530679000000	GTQ
6180	Bauerfield Airport	Port Vila	VLI		Vanuatu	VU	-17.701853000000	168.319503000000	VUV
6181	Cayman Brac	Cayman Brac	CYB		Cayman Islands	KY	19.686944000000	-79.882778000000	KYD
6182	Guadalajara Rail Station	Guadalajara Rail Station	GDU		Spain	ES	40.643889000000	-3.182222000000	EUR
6183	Al Rail Station	Al Rail Station	XXR		Norway	NO	60.625833000000	8.561667000000	NOK
6184	Sao Felix do Araguaia	Sao Felix do Araguaia	SXO		Brazil	BR	-11.633333000000	-50.666667000000	BRL
6185	Toyama	Toyama	TOY		Japan	JP	36.648333000000	137.187500000000	JPY
6186	Limbang	Limbang	LMN		Malaysia	MY	4.808056000000	115.010278000000	MYR
6187	Dallas Redbird Airport	Dallas/Fort Worth	RBD		USA	US	32.666667000000	-96.833333000000	USD
6188	Williams Lake	Williams Lake	YWL		Canada	CA	52.183056000000	-122.054167000000	CAD
6189	Ivanka Airport	Bratislava	BTS		Slovakia	SK	48.170017000000	17.199799000000	EUR
6190	E Cortissoz Airport	Barranquilla	BAQ		Colombia	CO	10.886398000000	-74.776178000000	COP
6191	Alderney Airport	Alderney	ACI		United Kingdom	GB	49.709347000000	-2.215369000000	GBP
6192	Samarkand Airport	Samarkand	SKD		Uzbekistan	UZ	39.696217000000	66.990850000000	UZS
6193	Mafia	Mafia	MFA		Tanzania United Republic of	TZ	-7.900000000000	39.666667000000	TZS
6194	Orland	Orland	OLA		Norway	NO	63.698889000000	9.603889000000	NOK
6195	Stafford Rail Station	Stafford Rail Station	XVB		United Kingdom	GB	52.800000000000	-2.116667000000	GBP
6196	London Liverpool Street Rail Station	London Liverpool Street Rail Station	ZLS		United Kingdom	GB	51.518056000000	-0.082778000000	GBP
6197	Hafr Albatin	Hafr Albatin	HBT		Saudi Arabia	SA	27.894444000000	45.526389000000	SAR
6198	Bulawayo	Bulawayo	BUQ		Zimbabwe	ZW	-20.017500000000	28.617778000000	ZWD
6199	Roxas	Roxas	RXS		Philippines	PH	11.601111000000	122.750556000000	PHP
6200	Manus Island	Manus Island	MAS		Papua New Guinea	PG	-2.065000000000	147.425000000000	PGK
6201	Unguia	Unguia	UNC		Colombia	CO	8.033333000000	-77.083333000000	COP
6202	Perryville	Perryville	KPV		USA	US	55.906667000000	-159.160833000000	USD
6203	Cornwall	Cornwall	YCC		Canada	CA	45.093056000000	-74.567222000000	CAD
6204	Siauliai Airport	Siauliai	SQQ		Lithuania	LT	55.933333000000	23.316667000000	LTL
6205	McCarran International Airport	Las Vegas	LAS		United States	US	36.086943000000	-115.148598000000	USD
6206	Naxos Airport	Naxos	JNX		Greece	GR	37.100000000000	25.383333000000	EUR
6207	Stockton Airport	Stockton	SCK		USA	US	37.894444000000	-121.239170000000	USD
6208	Helgoland	Helgoland	HGL		Germany	DE	54.185278000000	7.915833000000	EUR
6209	Dombas Rail Station	Dombas Rail Station	XGP		Norway	NO	62.068333000000	9.125556000000	NOK
6210	Jatai	Jatai	JTI		Brazil	BR	-17.830556000000	-51.775000000000	BRL
6211	Kyzyl	Kyzyl	KYZ		Russian Federation	RU	51.700000000000	94.516667000000	RUB
6212	Berau	Berau	BEJ		Indonesia	ID	2.155278000000	117.432778000000	IDR
6213	Kauehi	Kauehi	KHZ		French Polynesia	PF	-15.780833000000	-145.124167000000	XPF
6214	Cobija	Cobija	CIJ		Bolivia	BO	-11.040556000000	-68.783056000000	BOB
6215	Togiak Fish	Togiak Fish	GFB		USA	US	59.050000000000	-160.294444000000	USD
6216	Napakiak	Napakiak	WNA		USA	US	60.693333000000	-161.979167000000	USD
6217	Tours St-Pierre-Corps Rail Stn	Tours	XSH		France	FR	47.389444000000	0.693889000000	EUR
6218	Mohamed V Airport	Casablanca	CMN		Morocco	MA	33.366667000000	-7.586667000000	MAD
6219	Peelamedu Airport	Coimbatore	CJB		India	IN	11.031026000000	77.038931000000	INR
6220	Marsh Harbour Intl	Marsh Harbour	MHH		Bahamas	BS	26.513428000000	-77.077120000000	BSD
6221	Kitale	Kitale	KTL		Kenya	KE	0.973333000000	34.959722000000	KES
6222	Milton Keynes	Milton Keynes	KYN		United Kingdom	GB	52.033333000000	-0.700000000000	GBP
6223	Salisbury Rail Station	Salisbury Rail Station	XSR		United Kingdom	GB	51.083333000000	-1.800000000000	GBP
6224	Sao Joao del Rei	Sao Joao del Rei	JDR		Brazil	BR	-21.086389000000	-43.226389000000	BRL
6225	Mohe	Mohe	OHE		China	CN	52.916389000000	122.422222000000	RMB
6226	Gorontalo	Gorontalo	GTO		Indonesia	ID	0.637222000000	122.851389000000	IDR
6227	Manchester Airport	Manchester	MAN		United Kingdom	GB	53.362908000000	-2.273354000000	GBP
6228	Harrisburg International Airport	Middletown	MDT		United States	US	40.196008000000	-76.756057000000	USD
6229	Sanford Airport	Sanford	SFM		United States	US	43.433334000000	-70.766670000000	USD
6230	Analalava	Analalava	HVA		Madagascar	MG	-14.633333000000	47.766667000000	MGA
6231	Thirsk Rail Station	Thirsk Rail Station	XTK		United Kingdom	GB	54.233333000000	-1.333333000000	GBP
6232	Liepaya	Liepaya	LPX		Latvia	LV	56.517500000000	21.096944000000	LVL
6233	Bayankhongor	Bayankhongor	BYN		Mongolia	MN	46.163333000000	100.704167000000	MNT
6234	Agartala	Agartala	IXA		India	IN	23.886944000000	91.240556000000	INR
6235	Birdsville	Birdsville	BVI		Australia	AU	-25.891944000000	139.345278000000	AUD
6236	Torres	Torres	TOH		Vanuatu	VU	-13.327778000000	166.638611000000	VUV
6237	Brookings	Brookings	BKX		USA	US	44.300000000000	-96.816667000000	USD
6238	Rampart	Rampart	RMP		USA	US	65.508056000000	-150.141944000000	USD
6239	Terrace	Terrace	YXT		Canada	CA	54.468611000000	-128.576111000000	CAD
6240	Lifou	Lifou	LIF		New Caledonia	NC	-20.774722000000	167.240000000000	XPF
6241	Maicao	Maicao	MCJ		Colombia	CO	11.383333000000	-72.233333000000	COP
6242	Kingman	Kingman	IGM		USA	US	35.256667000000	-113.942222000000	USD
6243	Taschereau Rail Service	Taschereau Rail Service	XFO		Canada	CA	48.666667000000	-78.683333000000	CAD
6244	Gazipasa Airport	Gazipasa	GZP		Turkey	TR	36.299300000000	32.301400000000	USD
6245	Edinburgh Airport	Edinburgh	EDI		United Kingdom	GB	55.948143000000	-3.364177000000	GBP
6246	Orlando International Airport	Orlando	MCO		United States	US	28.432177000000	-81.308301000000	USD
6247	Machrihanish Airport	Campbeltown	CAL		United Kingdom	GB	55.436390000000	-5.686667000000	GBP
6248	Laramie Regional Airport	Laramie	LAR		United States	US	41.313610000000	-105.673060000000	USD
6249	Cuernavaca	Cuernavaca	CVJ		Mexico	MX	18.916667000000	-99.250000000000	MXN
6250	Out Skerries	Out Skerries	OUK		United Kingdom	GB	60.425278000000	-0.749167000000	GBP
6251	Flen Rail Station	Flen Rail Station	XYI		Sweden	SE	59.057222000000	16.588889000000	SEK
6252	Tandil	Tandil	TDL		Argentina	AR	-37.233333000000	-59.200000000000	ARS
6253	Zhongshan	Zhongshan	ZGN		China	CN	22.521111000000	113.342778000000	RMB
6254	Phitsanulok	Phitsanulok	PHS		Thailand	TH	16.783056000000	100.279167000000	THB
6255	Moranbah	Moranbah	MOV		Australia	AU	-22.058611000000	148.076389000000	AUD
6256	Boundiali	Boundiali	BXI		Cote D'Ivoire	CI	9.516667000000	-6.483333000000	XOF
6257	Lawrence (US) KS	Lawrence (US) KS	LWC		USA	US	38.950000000000	-95.283333000000	USD
6258	Grande Cache	Grande Cache	YGC		Canada	CA	53.883333000000	-119.133333000000	CAD
6259	Mbambanakira	Mbambanakira	MBU		Solomon Islands	SB	-9.747500000000	159.839722000000	SBD
6260	El Vigia	El Vigia	VIG		Venezuela	VE	8.624167000000	-71.672778000000	VEB
6261	Sandy River	Sandy River	KSR		USA	US	56.216667000000	-160.233333000000	USD
6262	Miramichi	Miramichi	YCH		Canada	CA	47.166667000000	-65.000000000000	CAD
6263	Guernsey Airport	Guernsey	GCI		United Kingdom	GB	49.432756000000	-2.595044000000	GBP
6264	Simferopol Airport	Simferopol	SIP		Ukraine	UA	45.020658000000	33.998193000000	UAH
6265	Silvio Pettirossi Airport	Asuncion	ASU		Paraguay	PY	-25.241795000000	-57.513795000000	PYG
6266	Kirkwall Airport	Kirkwall	KOI		United Kingdom	GB	58.958057000000	-2.900556000000	GBP
6267	Unalaska Airport	Unalaska	DUT		United States	US	53.894460000000	-166.542240000000	USD
6268	Idre	Idre	IDB		Sweden	SE	61.866667000000	12.716667000000	SEK
6269	London Victoria Rail Station	London Victoria Rail Station	ZEP		United Kingdom	GB	51.495000000000	-0.144722000000	GBP
6270	Calama	Calama	CJC		Chile	CL	-22.498056000000	-68.908056000000	CLP
6271	Nantong	Nantong	NTG		China	CN	32.072222000000	120.980278000000	RMB
6272	Fak Fak	Fak Fak	FKQ		Indonesia	ID	-2.920278000000	132.266944000000	IDR
6273	Kaben	Kaben	KBT		Marshall Islands	MH	8.900000000000	170.850000000000	USD
6274	Wairoa	Wairoa	WIR		New Zealand	NZ	-39.033333000000	177.416667000000	NZD
6275	Corvallis	Corvallis	CVO		USA	US	44.500000000000	-123.283333000000	USD
6276	Summer Beaver	Summer Beaver	SUR		Canada	CA	52.708611000000	-88.542222000000	CAD
6277	New York/newark Nj Rail Station	New York	ZRP		USA	US	40.734722000000	-74.164722000000	USD
6278	Almeria Airport	Almeria	LEI		Spain and Canary Islands	ES	36.847984000000	-2.371873000000	EUR
6279	General Mitchell International Airport	Milwaukee	MKE		United States	US	42.948095000000	-87.902668000000	USD
6280	Kajaani Airport	Kajaani	KAJ		Finland	FI	64.277780000000	27.688889000000	EUR
6281	Tarapoto Airport	Tarapoto	TPP		Peru	PE	-6.511111000000	-76.398610000000	PEN
6282	Poza Rica	Poza Rica	PAZ		Mexico	MX	20.601944000000	-97.463056000000	MXN
6283	Uppsala C Rail Station	Uppsala C Rail Station	QYX		Sweden	SE	59.858889000000	17.646111000000	SEK
6284	Vigo Rail Station	Vigo Rail Station	YJR		Spain	ES	42.234444000000	-8.713056000000	EUR
6285	Rio Branco	Rio Branco	RBR		Brazil	BR	-9.869167000000	-67.894167000000	BRL
6286	Yeosu	Yeosu	RSU		Korea Republic of	KR	34.842222000000	127.616944000000	KRW
6287	Songkhla	Songkhla	SGZ		Thailand	TH	7.333333000000	100.533333000000	THB
6288	Namudi	Namudi	NDI		Papua New Guinea	PG	-9.450000000000	148.233333000000	PGK
6289	Birao	Birao	IRO		Central African Republic	CF	10.500000000000	22.550000000000	XAF
6290	Miles City	Miles City	MLS		USA	US	46.428056000000	-105.886389000000	USD
6291	Montreal St Hubert Apt	Montreal	YHU		Canada	CA	45.516389000000	-73.420833000000	CAD
6292	Beni Mellal Airport	Beni Mellal	BEM		Morocco	MA	32.396072000000	-6.326653000000	MAD
6293	Edmonton International Airport	Edmonton	YEG		Canada	CA	53.307375000000	-113.584047000000	CAD
6294	Civil - Marka Airport	Amman	ADJ		Jordan	JO	31.975330000000	35.982770000000	JOD
6295	Manokotak	Manokotak	KMO		United States	US	58.981700000000	-159.058000000000	USD
6296	Sanday	Sanday	NDY		United Kingdom	GB	59.250278000000	-2.575000000000	GBP
6297	London Paddington Rail Station	London (GB)	QQP		United Kingdom	GB	51.517222000000	-0.177778000000	GBP
6298	Berwick-upon-Tweed Rail Station	Berwick-upon-Tweed Rail Station	XQG		United Kingdom	GB	55.766667000000	-2.000000000000	GBP
6299	San Antonio Oeste	San Antonio Oeste	OES		Argentina	AR	-40.750556000000	-65.035278000000	ARS
6300	Tongliao	Tongliao	TGO		China	CN	43.557500000000	122.200000000000	RMB
6301	Labuan Bajo	Labuan Bajo	LBJ		Indonesia	ID	-8.486667000000	119.889167000000	IDR
6302	Monkey Mia	Monkey Mia	MJK		Australia	AU	-25.895278000000	113.575833000000	AUD
6303	Bitam	Bitam	BMM		Gabon	GA	2.083333000000	11.483333000000	XAF
6304	Seattle Lake Union SPB	Seattle	LKE		USA	US	47.633333000000	-122.331667000000	USD
6305	Elliot Lake	Elliot Lake	YEL		Canada	CA	46.350000000000	-82.550000000000	CAD
6306	S Eufemia Airport	Lamezia-Terme	SUF		Italy	IT	38.910015000000	16.244972000000	EUR
6307	Zenata Airport	Tlemcen	TLM		Algeria	DZ	35.016667000000	-1.450000000000	DZD
6308	Daegu Airport	Daegu	TAE		Republic of Korea	KR	35.899254000000	128.637874000000	KRW
6309	Owensboro Daviess County Airport	Owensboro	OWB		United States	US	37.740833000000	-87.165830000000	USD
6310	Bildudalur	Bildudalur	BIU		Iceland	IS	65.641389000000	-23.546111000000	ISK
6311	Schiphol Rail Station	Schiphol Rail Station	SPL		Netherlands	NL	52.300000000000	4.800000000000	EUR
6312	Inverness Rail Station	Inverness Rail Station	ZIV		United Kingdom	GB	57.450000000000	-4.250000000000	GBP
6313	Posadas	Posadas	PSS		Argentina	AR	-27.385833000000	-55.970556000000	ARS
6314	Raduzhnyi	Raduzhnyi	RAT		Russian Federation	RU	62.160000000000	77.329444000000	RUB
6315	Malang	Malang	MLG		Indonesia	ID	-7.926667000000	112.714444000000	IDR
6316	Kone	Kone	KNQ		New Caledonia	NC	-21.053889000000	164.838889000000	XPF
6317	Oruro	Oruro	ORU		Bolivia	BO	-17.952500000000	-67.075833000000	BOB
6318	Jefferson City	Jefferson City	JEF		USA	US	38.600000000000	-92.150000000000	USD
6319	Ilimanaq	Ilimanaq	XIQ		Greenland	GL	69.080556000000	-51.112778000000	DKK
6320	Innsbruck Airport	Innsbruck	INN		Austria	AT	47.257450000000	11.351467000000	EUR
6321	Inverness Airport	Inverness	INV		United Kingdom	GB	57.539346000000	-4.063738000000	GBP
6322	Xoxocotlan Airport	Oaxaca	OAX		Mexico	MX	17.000884000000	-96.721635000000	MXN
6323	Tinian Airport	Tinian	TIQ		Northern Mariana Islands	MP	14.994319000000	145.626344000000	USD
6324	Chester Airport	Chester	CEG		United Kingdom	GB	53.166668000000	-2.916667000000	GBP
6325	Tortola West End SPB	Tortola	TOV		Virgin Islands, British	VG	18.387500000000	-64.702778000000	USD
6326	Kings Lynn	Kings Lynn	KNF		United Kingdom	GB	52.750000000000	0.400000000000	GBP
6327	Egersund Rail Station	Egersund Rail Station	XRD		Norway	NO	58.460833000000	6.003056000000	NOK
6328	Sinop (BR)	Sinop (BR)	OPS		Brazil	BR	-11.885000000000	-55.586111000000	BRL
6329	Caprivi	Caprivi	LHU		Namibia	NA	-18.115556000000	23.391667000000	NAD
6330	Mansons Landing	Mansons Landing	YMU		Canada	CA	50.064722000000	-124.981111000000	CAD
6331	Hanover Airport	Hanover	HAJ		Germany	DE	52.459254000000	9.694766000000	EUR
6332	Battle Creek International Airport	Kalamazoo	AZO		United States	US	42.239962000000	-85.556553000000	USD
6333	Carnmore Airport	Galway	GWY		Ireland	IE	53.283333000000	-9.033333000000	EUR
6334	Fergana	Fergana	FEG		Uzbekistan	UZ	40.361389000000	71.744722000000	UZS
6335	Sanday	Sanday	NDY		United Kingdom	GB	59.250278000000	-2.575000000000	GBP
6336	Berlin Tempelhof Apt	Berlin	THF		Germany	DE	52.473611000000	13.401667000000	EUR
6337	Odense Rail Station	Odense	ZBQ		Denmark	DK	55.400000000000	10.383333000000	DKK
6338	Jouf	Jouf	AJF		Saudi Arabia	SA	29.785000000000	40.100000000000	SAR
6339	Kitwe	Kitwe	KIW		Zambia	ZM	-12.900556000000	28.150556000000	ZMK
6340	Abaiang	Abaiang	ABF		Kiribati	KI	1.416667000000	172.833333000000	AUD
6341	Yule Island	Yule Island	RKU		Papua New Guinea	PG	-8.816667000000	146.516667000000	PGK
6342	Tahoua	Tahoua	THZ		Niger	NE	14.883333000000	5.266667000000	XOF
6343	Point Hope	Point Hope	PHO		USA	US	68.348889000000	-166.799444000000	USD
6344	Watson Lake	Watson Lake	YQH		Canada	CA	60.116667000000	-128.816667000000	CAD
6345	Stockholm Arlanda Airport	Stockholm	ARN		Sweden	SE	59.649818000000	17.930364000000	SEK
6346	Santa Elena Airport	Flores	FRS		Guatemala	GT	16.916667000000	-89.883333000000	GTQ
6347	Funafuti Atol International Airport	Funafuti Atol	FUN		Tuvalu	TV	-8.516667000000	179.208333000000	AUD
6348	Carriacou	Carriacou	CRU		Grenada, Windward Islands	GD	12.476667000000	-61.471944000000	XCD
6349	Fair Isle	Fair Isle	FIE		United Kingdom	GB	59.534722000000	-1.628611000000	GBP
6350	Milan Centrale Rail Station	Milan	XIK		Italy	IT	45.485833000000	9.204444000000	EUR
6351	Inverness Rail Station	Inverness Rail Station	ZIV		United Kingdom	GB	57.450000000000	-4.250000000000	GBP
6352	Hail	Hail	HAS		Saudi Arabia	SA	27.438056000000	41.686389000000	SAR
6353	Benguela	Benguela	BUG		Angola	AO	-12.600000000000	13.383333000000	AOA
6354	Buol	Buol	UOL		Indonesia	ID	1.166667000000	121.433333000000	IDR
6355	Moruya	Moruya	MYA		Australia	AU	-35.898333000000	150.146111000000	AUD
6356	Gombe	Gombe	GMO		Nigeria	NG	10.298056000000	10.898889000000	NGN
6357	Minot AFB	Minot	MIB		USA	US	48.269444000000	-101.286111000000	USD
6358	Charlottetown (CA) NL	Charlottetown (CA) NL	YHG		Canada	CA	52.766111000000	-56.112500000000	CAD
6359	Montichiari Airport	Brescia	VBS		Italy	IT	45.425447000000	10.326545000000	EUR
6360	Inverness Airport	Inverness	INV		United Kingdom	GB	57.539346000000	-4.063738000000	GBP
6361	Philadelphia International Airport	Philadelphia	PHL		United States	US	39.876413000000	-75.243305000000	USD
6362	Tinian Airport	Tinian	TIQ		Northern Mariana Islands	MP	14.994319000000	145.626344000000	USD
6363	Roros Airport	Roros	RRS		Norway	NO	62.579166000000	11.345556000000	NOK
6364	Corozal (BZ)	Corozal (BZ)	CZH		Belize	BZ	18.382500000000	-88.410833000000	BZD
6365	Kings Lynn	Kings Lynn	KNF		United Kingdom	GB	52.750000000000	0.400000000000	GBP
6366	Goettingen Rail Station	Goettingen Rail Station	ZEU		Germany	DE	51.533333000000	9.933333000000	EUR
6367	Bijie	Bijie	BFJ		China	CN	27.300556000000	105.301667000000	RMB
6368	Herat	Herat	HEA		Afghanistan	AF	34.210000000000	62.228333000000	USD
6369	Boset	Boset	BOT		Papua New Guinea	PG	-7.233333000000	141.083333000000	PGK
6370	Rennell	Rennell	RNL		Solomon Islands	SB	-11.551111000000	160.063889000000	SBD
6371	Tombouctou	Tombouctou	TOM		Mali	ML	16.733889000000	-3.998611000000	XOF
6372	Point Lay	Point Lay	PIZ		USA	US	69.732778000000	-163.005278000000	USD
6373	Lethbridge	Lethbridge	YQL		Canada	CA	49.629722000000	-112.790278000000	CAD
6374	Cardiff Central Railway Station	Cardiff	CFW		United Kingdom	GB	51.475500000000	-3.178000000000	GBP
6375	Norte Los Rodeos Airport	Tenerife	TFN		Spain and Canary Islands	ES	28.488056000000	-16.345982000000	EUR
6376	Awareh	Awareh	AWH		Ethiopia	ET	8.266667000000	44.183333000000	ETB
6377	Wuerzburg Rail Station	Wuerzburg Rail Station	QWU		Germany	DE	49.787778000000	9.936111000000	EUR
6378	Maribor	Maribor	MBX		Slovenia	SI	46.480000000000	15.686111000000	EUR
6379	Chifeng	Chifeng	CIF		China	CN	42.160000000000	118.840833000000	RMB
6380	Allahabad	Allahabad	IXD		India	IN	25.440000000000	81.733889000000	INR
6381	Ebadon	Ebadon	EBN		Marshall Islands	MH	9.333333000000	166.800000000000	USD
6382	Tamana Island	Tamana Island	TMN		Kiribati	KI	-2.483333000000	175.983333000000	AUD
6383	Cleveland Burke Lakefront Apt	Cleveland	BKL		USA	US	41.517500000000	-81.683333000000	USD
6384	Richland	Richland	RLD		USA	US	46.300000000000	-119.300000000000	USD
6385	Earlton	Earlton	YXR		Canada	CA	47.700000000000	-79.850000000000	CAD
6386	Christchurch International Airport	Christchurch	CHC		New Zealand	NZ	-43.488655000000	172.538892000000	NZD
6387	New Chitose Airport	Sapporo	CTS		Japan	JP	42.787281000000	141.681341000000	JPY
6388	Muenster Airport	Muenster	FMO		Germany	DE	52.130054000000	7.694928000000	EUR
6389	Turkmanbashi	Turkmanbashi	KRW		Turkmenistan	TM	40.060833000000	53.008056000000	TMM
6390	Dover Rail Station	Dover Rail Station	QQD		United Kingdom	GB	51.133333000000	1.316667000000	GBP
6391	Stockport Rail Station	Stockport Rail Station	XVA		United Kingdom	GB	53.416667000000	-2.166667000000	GBP
6392	Yeysk	Yeysk	EIK		Russian Federation	RU	46.678889000000	38.212222000000	RUB
6393	Altay	Altay	AAT		China	CN	47.750556000000	88.085833000000	RMB
6394	Dickwella	Dickwella	DIW		Sri Lanka	LK	5.990833000000	80.733333000000	LKR
6395	Newcastle Belmont Apt	Newcastle (AU)	BEO		Australia	AU	-33.033333000000	151.666667000000	AUD
6396	Rabaul	Rabaul	RAB		Papua New Guinea	PG	-4.340000000000	152.377222000000	PGK
6397	Owerri	Owerri	QOW		Nigeria	NG	5.426944000000	7.206111000000	NGN
6398	Everett	Everett	PAE		USA	US	47.919444000000	-122.283611000000	USD
6399	Pikangikum	Pikangikum	YPM		Canada	CA	51.819722000000	-93.973056000000	CAD
6400	Kaliningrad Airport	Kaliningrad	KGD		Russian Federation	RU	54.882656000000	20.586646000000	RUB
6401	Port Harcourt Airport	Port Harcourt	PHC		Nigeria	NG	5.006506000000	6.949900000000	NGN
6402	Chippewa County Airport	Sault Ste. Marie	CIU		United States	US	46.500000000000	-84.350000000000	USD
6403	Stord Airport	Stord	SRP		Norway	NO	59.833332000000	5.416667000000	NOK
6404	San Carlos	San Carlos	NCR		Nicaragua	NI	11.166667000000	-84.750000000000	NIO
6405	Doncaster	Doncaster	DCS		United Kingdom	GB	53.466667000000	-1.000000000000	GBP
6406	Rugby Rail Station	Rugby Rail Station	XRU		United Kingdom	GB	52.383333000000	-1.250000000000	GBP
6407	Confreza	Confreza	CFO		Brazil	BR	-10.633333000000	-51.566667000000	BRL
6408	Kumamoto	Kumamoto	KMJ		Japan	JP	32.837222000000	130.855000000000	JPY
6409	Atambua	Atambua	ABU		Indonesia	ID	-9.075000000000	124.903889000000	IDR
6410	Garden Point	Garden Point	GPN		Australia	AU	-11.400000000000	130.433333000000	AUD
6411	Whakatane	Whakatane	WHK		New Zealand	NZ	-37.922222000000	176.916389000000	NZD
6412	Cube Cove	Cube Cove	CUW		USA	US	58.350000000000	-133.766667000000	USD
6413	Minneapolis Downtown Airport	Minneapolis/St Paul	STP		USA	US	44.933333000000	-93.066667000000	USD
6414	Round Lake	Round Lake	ZRJ		Canada	CA	52.935000000000	-91.302222000000	CAD
6415	Mersa Matruh Airport	Mersa Matruh	MUH		Egypt	EG	31.350000000000	27.250000000000	EGP
6416	Wattay	Vientiane	VTE		Lao People's Democratic Republic	LA	17.975432000000	102.567721000000	LAK
6417	Fort Wayne International Airport	Fort Wayne	FWA		United States	US	40.986660000000	-85.187710000000	USD
6418	Bradford (GB)	Bradford (GB)	BRF		United Kingdom	GB	53.802778000000	-1.750000000000	GBP
6419	Filton	Filton	FZO		United Kingdom	GB	51.519444000000	-2.590278000000	GBP
6420	Sheffield	Sheffield	SZD		United Kingdom	GB	53.394167000000	-1.388333000000	GBP
6421	Aragarcas	Aragarcas	ARS		Brazil	BR	-15.916667000000	-52.250000000000	BRL
6422	Luzhou	Luzhou	LZO		China	CN	28.852778000000	105.393333000000	RMB
6423	Baubau	Baubau	BUW		Indonesia	ID	-5.487500000000	122.568889000000	IDR
6424	Karawari	Karawari	KRJ		Papua New Guinea	PG	-8.750000000000	147.497222000000	PGK
6425	Pisco	Pisco	PIO		Peru	PE	-13.745000000000	-76.220278000000	PEN
6426	Sisimiut	Sisimiut	JHS		Greenland	GL	66.951389000000	-53.729444000000	DKK
6427	St Lambert Rail Station	St Lambert Rail Station	XLM		Canada	CA	45.500000000000	-73.500000000000	CAD
6428	Charleroi Brussels South Airport	Brussels	CRL		Belgium	BE	50.456697000000	4.451703000000	EUR
6429	Stansted Airport	London	STN		United Kingdom	GB	51.889267000000	0.262703000000	GBP
6430	Regional Do Cariri Airport	Juazeiro Do Norte	JDO		Brazil	BR	-7.200000000000	-39.316667000000	BRL
6431	Blue Grass Airport	Lexington	LEX		United States	US	38.037620000000	-84.597920000000	USD
6432	Humera	Humera	HUE		Ethiopia	ET	13.833333000000	36.879444000000	ETB
6433	Storuman	Storuman	SQO		Sweden	SE	64.960833000000	17.696667000000	SEK
6434	Ventspils	Ventspils	VNT		Latvia	LV	57.357778000000	21.544167000000	LVL
6435	Iturup Island	Iturup Island	BVV		Russian Federation	RU	44.920000000000	147.621667000000	RUB
6436	Nasik	Nasik	ISK		India	IN	19.966667000000	73.816667000000	INR
6437	Derby	Derby	DRB		Australia	AU	-17.370000000000	123.660556000000	AUD
6438	Tatakoto	Tatakoto	TKV		French Polynesia	PF	-17.355556000000	-138.448611000000	XPF
6439	El Paso Biggs Aaf	El Paso	BIF		USA	US	31.802778000000	-106.386111000000	USD
6440	Richfield	Richfield	RIF		USA	US	38.750000000000	-112.100000000000	USD
6441	Rimouski	Rimouski	YXK		Canada	CA	48.466667000000	-68.516667000000	CAD
6442	Fairmont	Fairmont	FRM		USA	US	43.650000000000	-94.416667000000	USD
6443	Ketchikan Waterfront SPB	Ketchikan	WFB		USA	US	55.345278000000	-131.659722000000	USD
6444	Nantes Rail Station	Nantes	QJZ		France	FR	47.217778000000	-1.541944000000	EUR
6445	Norwich Airport	Norwich	NWI		United Kingdom	GB	52.669534000000	1.276782000000	GBP
6446	George Bush Intercontinental Airport	Houston	IAH		United States	US	29.983333000000	-95.340000000000	USD
6447	Erfurt Airport	Erfurt	ERF		Germany	DE	50.974915000000	10.961163000000	EUR
6448	North Eleuthera	North Eleuthera	ELH		Bahamas	BS	25.475000000000	-76.683611000000	BSD
6449	Barrow-in-Furness	Barrow-in-Furness	BWF		United Kingdom	GB	54.116667000000	-3.233333000000	GBP
6450	Swansea	Swansea	SWS		United Kingdom	GB	51.605278000000	-4.067778000000	GBP
6451	St Anton Bus Station	St Anton Bus Station	XOV		Austria	AT	47.131389000000	10.269444000000	EUR
6452	Grodno	Grodno	GNA		Belarus	BY	53.666667000000	23.800000000000	BYR
6453	Aguni	Aguni	AGJ		Japan	JP	26.583333000000	127.250000000000	JPY
6454	Kotte	Kotte	DWO		Sri Lanka	LK	6.905556000000	79.909167000000	LKR
6455	Bathurst (AU)	Bathurst (AU)	BHS		Australia	AU	-33.409444000000	149.651944000000	AUD
6456	Tetabedi	Tetabedi	TDB		Papua New Guinea	PG	-9.200000000000	148.083333000000	PGK
6457	Watertown (US) SD	Watertown (US) SD	ATY		USA	US	44.913611000000	-97.151111000000	USD
6458	Macon Flightlink Bus Service	Macon	QMP		USA	US	32.833333000000	-83.600000000000	USD
6459	La Ronge	La Ronge	YVC		Canada	CA	55.083333000000	-105.333333000000	CAD
6460	Faro Airport	Faro	FAO		Portugal	PT	37.020646000000	-7.968545000000	EUR
6461	Biskra Airport	Biskra	BSK		Algeria	DZ	34.793333000000	5.738056000000	DZD
6462	Yanji Airport	Yanji	YNJ		China	CN	42.885662000000	129.439369000000	RMB
6463	Limnos Airport	Limnos	LXS		Greece	GR	39.923904000000	25.233446000000	EUR
6464	Gonder	Gonder	GDQ		Ethiopia	ET	12.520000000000	37.434167000000	ETB
6465	Salerno Rail Station	Salerno Rail Station	ISR		Italy	IT	40.675278000000	14.772222000000	EUR
6466	Edinburgh Rail Station	Edinburgh Rail Station	ZXE		United Kingdom	GB	55.950000000000	-3.216667000000	GBP
6467	Jujuy	Jujuy	JUJ		Argentina	AR	-24.392778000000	-65.097778000000	ARS
6468	Osaka Kobe Airport	Osaka	UKB		Japan	JP	34.632778000000	135.223889000000	JPY
6469	Masbate	Masbate	MBT		Philippines	PH	12.368889000000	123.629444000000	PHP
6470	Kira	Kira	KIQ		Papua New Guinea	PG	-7.633333000000	147.083333000000	PGK
6471	Cajamarca	Cajamarca	CJA		Peru	PE	-7.139167000000	-78.489444000000	PEN
6472	Greenville (US) MS	Greenville (US) MS	GLH		USA	US	33.477222000000	-90.985000000000	USD
6473	Fort Dix	Fort Dix	WRI		USA	US	40.021389000000	-74.589444000000	USD
6474	Cannes Vieux Port Ferry	Cannes	QYW		France	FR	43.550000000000	7.016667000000	EUR
6475	Ipoh Airport	Ipoh	IPH		Malaysia	MY	4.566944000000	101.095833000000	MYR
6476	Mildenhall Airport	Mildenhall	MHZ		United Kingdom	GB	52.366670000000	0.483333000000	GBP
6477	Tortuquero	Tortuquero	TTQ		Costa Rica	CR	10.351389000000	-83.629722000000	CRC
6478	Harwich Rail Station	Harwich Rail Station	QQH		United Kingdom	GB	51.950000000000	1.283333000000	GBP
6479	Horsens Bus Station	Horsens Bus Station	ZIL		Denmark	DK	55.871944000000	9.881111000000	DKK
6480	Dhahran	Dhahran	DHA		Saudi Arabia	SA	26.265278000000	50.151944000000	SAR
6481	Nelspruit	Nelspruit	MQP		South Africa	ZA	-25.383056000000	31.105556000000	ZAR
6482	Asapa	Asapa	APP		Papua New Guinea	PG	-8.983333000000	148.133333000000	PGK
6483	Safia	Safia	SFU		Papua New Guinea	PG	-9.583333000000	148.633333000000	PGK
6484	Pittsburgh Allegheny County Apt	Pittsburgh	AGC		USA	US	40.350000000000	-79.933333000000	USD
6485	Prospect Creek	Prospect Creek	PPC		USA	US	66.800000000000	-150.633333000000	USD
6486	Red Sucker Lake	Red Sucker Lake	YRS		Canada	CA	54.166667000000	-93.551667000000	CAD
6487	Exeter St Thomas Railway Station	Exeter	EXS		United Kingdom	GB	50.717130000000	-3.538580000000	GBP
6488	Goodnews Bay	Goodnews Bay	GNU		USA	US	59.117778000000	-161.576111000000	USD
6489	South Naknek	South Naknek	WSN		USA	US	58.703333000000	-157.006667000000	USD
6490	Roanne	Roanne	RNE		France	FR	46.052778000000	3.999722000000	EUR
6491	Boukhalef Airport	Tangier	TNG		Morocco	MA	35.726286000000	-5.912898000000	MAD
6492	Carriel Sur Airport	Concepcion	CCP		Chile	CL	-36.777121000000	-73.059444000000	CLP
6493	Zhanjiang Airport	Zhanjiang	ZHA		China	CN	21.214727000000	110.362720000000	RMB
6494	Anjouan	Anjouan	AJN		Comoros	KM	-12.131111000000	44.429722000000	USD
6495	Inishmaan	Inishmaan	IIA		Ireland Republic of	IE	53.091944000000	-9.570000000000	EUR
6496	Rugby Rail Station	Rugby Rail Station	XRU		United Kingdom	GB	52.383333000000	-1.250000000000	GBP
6497	La Rioja	La Rioja	IRJ		Argentina	AR	-29.380556000000	-66.795833000000	ARS
6498	Xinyuan City	Xinyuan City	NLT		China	CN	43.432222000000	83.382222000000	RMB
6499	Antique	Antique	EUQ		Philippines	PH	10.775000000000	121.941667000000	PHP
6500	Wakaya Island	Wakaya Island	KAY		Fiji	FJ	-17.616667000000	179.000000000000	FJD
6501	Barcelona	Barcelona (VE)	BLA		Venezuela	VE	10.107222000000	-64.689167000000	VEB
6502	Franklin Chess Lamberton Apt	Franklin	FKL		USA	US	41.379167000000	-79.860000000000	USD
6503	Vero Beach	Vero Beach	VRB		USA	US	27.650000000000	-80.416667000000	USD
6504	Frejus	Frejus	FRJ		France	FR	43.416667000000	6.733333000000	EUR
6505	Murtala Muhammed Airport	Lagos	LOS		Nigeria	NG	6.577871000000	3.321178000000	NGN
6506	Sulaimaniyah International Airport	Sulaimaniyah	ISU		Iraq	IQ	35.560800000000	45.314717000000	NID
6507	Gunnison County Airport	Gunnison	GUC		United States	US	38.535600000000	-106.941000000000	USD
6508	Bradford (GB)	Bradford (GB)	BRF		United Kingdom	GB	53.802778000000	-1.750000000000	GBP
6509	Filton	Filton	FZO		United Kingdom	GB	51.519444000000	-2.590278000000	GBP
6510	Vojens Rail Station	Vojens	XJE		Denmark	DK	55.250000000000	9.316667000000	DKK
6511	Eirunepe	Eirunepe	ERN		Brazil	BR	-6.639722000000	-69.880000000000	BRL
6512	Yoronjima	Yoronjima	RNJ		Japan	JP	27.033333000000	128.433333000000	JPY
6513	Matak	Matak	MWK		Indonesia	ID	3.283333000000	106.300000000000	IDR
6514	Sunshine Coast	Sunshine Coast	MCY		Australia	AU	-26.603333000000	153.091111000000	AUD
6515	Villavicencio	Villavicencio	VVC		Colombia	CO	4.167778000000	-73.613889000000	COP
6516	Kasigluk	Kasigluk	KUK		USA	US	60.873889000000	-162.524167000000	USD
6517	St Catharines	St Catharines	YCM		Canada	CA	43.200000000000	-79.166667000000	CAD
6518	Tbilisi International Airport	Tbilisi	TBS		Georgia	GE	41.674063000000	44.958958000000	GEL
6519	Stansted Airport	London	STN		United Kingdom	GB	51.889267000000	0.262703000000	GBP
6520	Yuzhny Airport	Tashkent	TAS		Uzbekistan	UZ	41.262714000000	69.266186000000	UZS
6521	Friday Harbor Airport	Friday Harbor	FRD		United States	US	48.524807000000	-123.026500000000	USD
6522	Sumbawanga	Sumbawanga	SUT		Tanzania United Republic of	TZ	-7.948333000000	31.611667000000	TZS
6523	Dresden Rail Station	Dresden Rail Station	XIR		Germany	DE	51.050000000000	13.750000000000	EUR
6524	Carajas	Carajas	CKS		Brazil	BR	-6.117778000000	-50.003611000000	BRL
6525	Hanamaki	Hanamaki	HNA		Japan	JP	39.428611000000	141.135278000000	JPY
6526	Bagram	Bagram	OAI		Afghanistan	AF	34.946389000000	69.265000000000	USD
6527	Groote Eylandt	Groote Eylandt	GTE		Australia	AU	-13.972500000000	136.458611000000	AUD
6528	Witu	Witu	WIU		Papua New Guinea	PG	-3.816667000000	142.033333000000	PGK
6529	Center Island	Center Island	CWS		USA	US	47.485000000000	-122.831389000000	USD
6530	St Louis Spirit of St Louis Apt	St Louis	SUS		USA	US	38.661667000000	-90.651667000000	USD
6531	Hartford Ct Rail Station	Hartford	ZRT		USA	US	41.759444000000	-72.691111000000	USD
6532	Panama City Bay County Apt	Panama City (US)	PFN		USA	US	30.228889000000	-85.682778000000	USD
6533	Burns Lake	Burns Lake	YPZ		Canada	CA	54.233333000000	-125.766667000000	CAD
6534	Kangiqsualujjuaq	Kangiqsualujjuaq	XGR		Canada	CA	58.711389000000	-65.991944000000	CAD
6535	Mali Losinj	Mali Losinj	LSZ		Croatia	HR	44.566944000000	14.393889000000	EUR
6536	Wallblake Airport	Anguilla	AXA		Anguilla	AI	18.216667000000	-63.066667000000	XCD
6537	Kuala Lumpur International Airport	Kuala Lumpur	KUL		Malaysia	MY	2.755672000000	101.705390000000	MYR
6538	Idaho Falls Regional Airport	Idaho Falls	IDA		United States	US	43.514854000000	-112.067510000000	USD
6539	Hudiksvall	Hudiksvall	HUV		Sweden	SE	61.766944000000	17.084167000000	SEK
6540	London Paddington Rail Station	London (GB)	QQP		United Kingdom	GB	51.517222000000	-0.177778000000	GBP
6541	Berwick-upon-Tweed Rail Station	Berwick-upon-Tweed Rail Station	XQG		United Kingdom	GB	55.766667000000	-2.000000000000	GBP
6542	Chos Malal	Chos Malal	HOS		Argentina	AR	-37.416667000000	-70.216667000000	ARS
6543	Qiqihar	Qiqihar	NDG		China	CN	47.239722000000	123.918056000000	RMB
6544	Dobo	Dobo	DOB		Indonesia	ID	-5.772778000000	134.211111000000	IDR
6545	Lablab	Lablab	LAB		Papua New Guinea	PG	-5.633333000000	148.066667000000	PGK
6546	San Cristobal (VE)	San Cristobal (VE)	SCI		Venezuela	VE	7.766667000000	-72.233333000000	VEB
6547	Chignik Fisheries Apt	Chignik	KCG		USA	US	56.310556000000	-158.374722000000	USD
6548	Edmonton Rail Station	Edmonton	XZL		Canada	CA	53.582222000000	-113.525833000000	CAD
6549	Batumi Airport	Batumi	BUS		Georgia	GE	41.610833000000	41.600556000000	GEL
6550	London Southend Airport	Southend	SEN		United Kingdom	GB	51.572778000000	0.701389000000	GBP
6551	Namangan Airport	Namangan	NMA		Uzbekistan	UZ	40.983333000000	71.600000000000	UZS
6552	Pullman Moscow Regional Airport	Pullman	PUW		United States	US	46.744720000000	-117.105000000000	USD
6553	Shehdi	Shehdi	SQJ		Ethiopia	ET	12.783333000000	36.250000000000	ETB
6554	Hahnweide Rail Station	Hahnweide Rail Station	QHD		Germany	DE	49.403889000000	8.675833000000	EUR
6555	Inverness Rail Station	Inverness Rail Station	ZIV		United Kingdom	GB	57.450000000000	-4.250000000000	GBP
6556	Lontras	Lontras	LOI		Brazil	BR	-27.159722000000	-49.542778000000	BRL
6557	Lingshui Rail Station	Lingshui Rail Station	LQS		China	CN	18.538056000000	110.029167000000	RMB
6558	Karubaga	Karubaga	KBF		Indonesia	ID	-3.750000000000	138.333333000000	IDR
6559	Hao Island	Hao Island	HOI		French Polynesia	PF	-18.074722000000	-140.945833000000	XPF
6560	Corozal (CO)	Corozal (CO)	CZU		Colombia	CO	9.332778000000	-75.285556000000	COP
6561	Gustavus Apt	Gustavus	GST		USA	US	58.425278000000	-135.707500000000	USD
6562	Newtok	Newtok	WWT		USA	US	60.940278000000	-164.642500000000	USD
6563	Toussus-Le-Noble	Toussus-Le-Noble	TNF		France	FR	48.749722000000	2.111111000000	EUR
6564	Valencia Airport	Valencia	VLC		Spain and Canary Islands	ES	39.491792000000	-0.473475000000	EUR
6565	Providenciales International Airport	Providenciales	PLS		Turks and Caicos Islands	TC	21.769167000000	-72.268333000000	USD
6566	Bahrain International Airport	Bahrain	BAH		Bahrain	BH	26.269181000000	50.626050000000	BHD
6567	Chester Airport	Chester	CEG		United Kingdom	GB	53.166668000000	-2.916667000000	GBP
6568	Tortola West End SPB	Tortola	TOV		Virgin Islands, British	VG	18.387500000000	-64.702778000000	USD
6569	Florence Firenze Rail Station	Florence Firenze Rail Station	FIR		Italy	IT	43.776111000000	11.248056000000	EUR
6570	Honefoss Rail Station	Honefoss Rail Station	XHF		Norway	NO	60.168889000000	10.247222000000	NOK
6571	Lago Argentino	Lago Argentino	ING		Argentina	AR	-50.333333000000	-72.250000000000	ARS
6572	Yichang	Yichang	YIH		China	CN	30.556944000000	111.479722000000	RMB
6573	Oksibil	Oksibil	OKL		Indonesia	ID	-4.908333000000	140.630556000000	IDR
6574	Lord Howe Island	Lord Howe Island	LDH		Australia	AU	-31.538611000000	159.076111000000	AUD
6575	San Jose del Guaviare	San Jose del Guaviare	SJE		Colombia	CO	2.579722000000	-72.639444000000	COP
6576	Kenmore Air Harbor	Kenmore Air Harbor	KEH		USA	US	47.761111000000	-122.251111000000	USD
6577	Anahim Lake	Anahim Lake	YAA		Canada	CA	52.455278000000	-125.308056000000	CAD
6578	Cardiff Central Railway Station	Cardiff	CFW		United Kingdom	GB	51.475500000000	-3.178000000000	GBP
6579	Disneyland Paris Marne/Chessey Rail Stn	Disneyland Paris Marne/Chessey Rail Stn	XED		France	FR	48.869722000000	2.782778000000	EUR
6580	Birmingham International Airport	Birmingham	BHX		United Kingdom	GB	52.452518000000	-1.733256000000	GBP
6581	Trelew Airport	Trelew	REL		Argentina	AR	-43.233333000000	-65.323333000000	ARS
6582	Vila Real Airport	Vila Real	VRL		Portugal	PT	41.300000000000	-7.750000000000	EUR
6583	Comitan	Comitan	CJT		Mexico	MX	16.166667000000	-92.050000000000	MXN
6584	Raufarhofn	Raufarhofn	RFN		Iceland	IS	66.416667000000	-15.916667000000	ISK
6585	Zaqatala	Zaqatala	ZTU		Azerbaijan	AZ	41.562222000000	46.667222000000	AZM
6586	Qiemo	Qiemo	IQM		China	CN	38.149444000000	85.533056000000	RMB
6587	Raipur	Raipur	RPR		India	IN	21.180278000000	81.738889000000	INR
6588	Hoskins	Hoskins	HKN		Papua New Guinea	PG	-5.462222000000	150.405000000000	PGK
6589	Wotho Island	Wotho Island	WTO		Marshall Islands	MH	10.166667000000	166.033333000000	USD
6590	Decatur Island	Decatur Island	DTR		USA	US	48.516667000000	-122.833333000000	USD
6591	Pituffik	Pituffik	THU		Greenland	GL	76.533333000000	-68.750000000000	DKK
6592	Harrisburg Rail Station	Harrisburg	ZUG		USA	US	40.261667000000	-76.878611000000	USD
6593	Moi International Airport	Mombasa	MBA		Kenya	KE	-4.032700000000	39.603247000000	KES
6594	Haikou Airport	Haikou	HAK		China	CN	19.941613000000	110.457169000000	RMB
6595	Usinsk Airport	Usinsk	USK		Russia	RU	65.950000000000	57.400000000000	RUB
6596	Panama City Marcos A. Gelabert	Panama City (PA)	PAC		Panama	PA	8.973333000000	-79.555556000000	PAB
6597	Holyhead	Holyhead	HLY		United Kingdom	GB	53.316667000000	-4.633333000000	GBP
6598	Degerfors Rail Station	Degerfors Rail Station	XXD		Sweden	SE	59.228889000000	14.439722000000	SEK
6599	Sao Jose do Rio Preto	Sao Jose do Rio Preto	SJP		Brazil	BR	-20.816667000000	-49.406389000000	BRL
6600	Nampula (MZ) 00	Nampula (MZ) 00	LFB		Mozambique	MZ	-15.033333000000	40.666667000000	MZM
6601	Aarhus Rail Station	Aarhus	ZJH		Denmark	DK	56.150000000000	10.216667000000	DKK
6602	Treinta Y Tres	Treinta Y Tres	TYT		Uruguay	UY	-33.200000000000	-54.350000000000	UYU
6603	Kasane	Kasane	BBK		Botswana	BW	-17.832778000000	25.162500000000	BWP
6604	Pai	Pai	PYY		Thailand	TH	19.370833000000	98.435556000000	THB
6605	Kanainj	Kanainj	KNE		Papua New Guinea	PG	-5.283333000000	144.700000000000	PGK
6606	Coro	Coro	CZE		Venezuela	VE	11.415000000000	-69.681667000000	VEB
6607	Goldsboro	Goldsboro	GSB		USA	US	35.466667000000	-77.966667000000	USD
6608	Whale Pass	Whale Pass	WWP		USA	US	56.116667000000	-133.125000000000	USD
6609	Le Mans Rail Station	Le Mans	ZLN		France	FR	47.995833000000	0.191944000000	EUR
6610	Maewo	Maewo	MWF		Vanuatu	VU	-14.997778000000	168.081667000000	VUV
6611	Fougamou	Fougamou	FOU		Gabon	GA	-1.283333000000	10.616667000000	XAF
6612	Manteo	Manteo	MEO		USA	US	35.911111000000	-75.700000000000	USD
6613	Gillam	Gillam	YGX		Canada	CA	56.357222000000	-94.710833000000	CAD
6614	Punta Raisi Airport	Palermo	PMO		Italy	IT	38.186525000000	13.104779000000	EUR
6615	Cairo International Airport	Cairo	CAI		Egypt	EG	30.120106000000	31.406469000000	EGP
6616	Cheongju Airport	Cheongju	CJJ		Republic of Korea	KR	36.722400000000	127.495087000000	KRW
6617	Sioux Gateway Col. Bud Day Field	Sioux City	SUX		United States	US	42.401943000000	-96.384170000000	USD
6618	Ambanja	Ambanja	IVA		Madagascar	MG	-13.650000000000	48.466667000000	MGA
6619	Kocaeli	Kocaeli	KCO		Turkey	TR	40.733333000000	30.083333000000	USD
6620	Westray	Westray	WRY		United Kingdom	GB	59.350278000000	-2.950000000000	GBP
6621	Newport Rail Station	Newport Rail Station	XNE		United Kingdom	GB	51.583333000000	-3.000000000000	GBP
6622	Sandvika Rail Station	Sandvika Rail Station	ZYW		Norway	NO	59.887778000000	10.525000000000	NOK
6623	Al Ula	Al Ula	ULH		Saudi Arabia	SA	26.489722000000	38.105278000000	SAR
6624	Mokuti Lodge	Mokuti Lodge	OKU		Namibia	NA	-18.808333000000	17.050000000000	NAD
6625	Ubon Ratchathani	Ubon Ratchathani	UBP		Thailand	TH	15.251389000000	104.870278000000	THB
6626	Mussau	Mussau	MWU		Papua New Guinea	PG	-1.500000000000	149.666667000000	PGK
6627	Turbo	Turbo	TRB		Colombia	CO	8.100000000000	-76.733333000000	COP
6628	Point Baker	Point Baker	KPB		USA	US	56.351944000000	-133.622222000000	USD
6629	Bedwell Harbor	Bedwell Harbor	YBW		Canada	CA	48.750000000000	-123.233333000000	CAD
6630	Riga Airport	Riga	RIX		Latvia	LV	56.922080000000	23.979806000000	LVL
6631	Capital City Airport	Lansing	LAN		United States	US	42.774185000000	-84.589578000000	USD
6632	Hammerfest Airport	Hammerfest	HFT		Norway	NO	70.679990000000	23.675867000000	NOK
6633	Deadmans Cay	Deadmans Cay	LGI		Bahamas	BS	23.178889000000	-75.093611000000	BSD
6634	Shetland Islands Lerwick/Tingwall Apt	Shetland Islands	LWK		United Kingdom	GB	60.192222000000	-1.243611000000	GBP
6635	Manchester Piccadilly Rail Station	Manchester (GB)	QQM		United Kingdom	GB	53.466667000000	-2.233333000000	GBP
6636	Tallinn Heliport	Tallinn Heliport	CHE		Estonia	EE	59.448056000000	24.753333000000	EEK
6637	Fuyun	Fuyun	FYN		China	CN	45.000000000000	90.008333000000	RMB
6638	Kanpur	Kanpur	KNU		India	IN	26.440556000000	80.367222000000	INR
6639	Cue	Cue	CUY		Australia	AU	-27.450000000000	117.916667000000	AUD
6640	Vava'u	Vava'u	VAV		Tonga	TO	-18.585556000000	-173.969722000000	TOP
6641	Wendover	Wendover	ENV		USA	US	40.733333000000	-114.033333000000	USD
6642	Uummannaq	Uummannaq	UMD		Greenland	GL	70.680556000000	-52.111667000000	DKK
6643	Split Airport	Split	SPU		Croatia	HR	43.536525000000	16.299460000000	EUR
6644	Birmingham International Airport	Birmingham	BHX		United Kingdom	GB	52.452518000000	-1.733256000000	GBP
6645	Stewart Airport	Newburgh	SWF		United States	US	41.498430000000	-74.101045000000	USD
6646	Pori Airport	Pori	POR		Finland	FI	61.468660000000	21.791382000000	EUR
6647	Sun Valley Airport	Sun Valley	SUN		USA	US	43.506470000000	-114.300820000000	USD
6648	Bochum Rail Station	Bochum Rail Station	QBO		Germany	DE	51.479167000000	7.222778000000	EUR
6649	Pardubice	Pardubice	PED		Czech Republic	CZ	50.013333000000	15.738611000000	CZK
6650	Dalanzadgad	Dalanzadgad	DLZ		Mongolia	MN	43.591667000000	104.429722000000	MNT
6651	Jacobabad	Jacobabad	JAG		Pakistan	PK	28.283333000000	68.433333000000	PKR
6652	Eua	Eua	EUA		Tonga	TO	-21.377222000000	-174.957500000000	TOP
6653	Ua Huka	Ua Huka	UAH		French Polynesia	PF	-8.936111000000	-139.555000000000	XPF
6654	Boundary	Boundary	BYA		USA	US	64.083333000000	-141.116667000000	USD
6655	Steamboat Springs Apt	Steamboat Springs	SBS		USA	US	40.516667000000	-106.866667000000	USD
6656	Yellowknife	Yellowknife	YZF		Canada	CA	62.468611000000	-114.443056000000	CAD
6657	Ivano-Frankovsk Airport	Ivano-Frankovsk	IFO		Ukraine	UA	48.887535000000	24.707566000000	UAH
6658	Haines	Haines	HNS		USA	US	59.243889000000	-135.523611000000	USD
6659	Thira Airport	Thira	JTR		Greece	GR	36.400000000000	25.483334000000	EUR
6660	Ahuas	Ahuas	AHS		Honduras	HN	15.441667000000	-84.425000000000	HNL
6661	Holyhead	Holyhead	HLY		United Kingdom	GB	53.316667000000	-4.633333000000	GBP
6662	Ottumwa	Ottumwa	OTM		USA	US	41.100000000000	-92.450000000000	USD
6663	Fuerte Olimpo	Fuerte Olimpo	OLK		Paraguay	PY	-21.045833000000	-57.882778000000	PYG
6664	Aershan	Aershan	YIE		China	CN	47.310000000000	119.994167000000	RMB
6665	Oudomxay	Oudomxay	ODY		Lao People's Democratic Republic	LA	20.682778000000	101.993889000000	LAK
6666	Lindeman Island	Lindeman Island	LDC		Australia	AU	-20.450000000000	149.050000000000	AUD
6667	Lamacarena	Lamacarena	LMC		Colombia	CO	2.175278000000	-73.786667000000	COP
6668	Hughes	Hughes	HUS		USA	US	66.043056000000	-154.261111000000	USD
6669	New Carlisle Rail Station	New Carlisle Rail Station	XEL		Canada	CA	48.016667000000	-65.333333000000	CAD
6670	Valenciennes Rail Station	Valenciennes Rail Station	XVS		France	FR	50.350000000000	3.533333000000	EUR
6671	Melita Airport	Djerba	DJE		Tunisia	TN	33.871180000000	10.775145000000	TND
6672	Clark Field	Luzon Island	CRK		Philippines	PH	15.182571000000	120.546484000000	PHP
6673	Humberside Airport	Humberside	HUY		United Kingdom	GB	53.583378000000	-0.348510000000	GBP
6674	Truk Airport	Truk, Caroline Islands	TKK		Micronesia	FM	7.457446000000	151.842005000000	USD
6675	Albany International Airport	Albany	ALB		United States	US	42.745279000000	-73.809556000000	USD
6676	Sturup Airport	Malmö	MMX		Sweden	SE	55.538757000000	13.363727000000	SEK
6677	Mardin Airport	Mardin	MQM		Turkey	TR	37.223300000000	40.631700000000	USD
6678	Tamatave	Tamatave	TMM		Madagascar	MG	-18.109444000000	49.392500000000	MGA
6679	Harwich Rail Station	Harwich Rail Station	QQH		United Kingdom	GB	51.950000000000	1.283333000000	GBP
6680	Mogilev	Mogilev	MVQ		Belarus	BY	53.950000000000	30.133333000000	BYR
6681	Choibalsan	Choibalsan	COQ		Mongolia	MN	48.135556000000	114.646389000000	MNT
6682	Keshod	Keshod	IXK		India	IN	21.316667000000	70.266667000000	INR
6683	Sege	Sege	EGM		Solomon Islands	SB	-8.578611000000	157.875556000000	SBD
6684	Mount Keith	Mount Keith	WME		Australia	AU	-27.286111000000	120.550000000000	AUD
6685	Detroit City Apt	Detroit	DET		USA	US	42.400000000000	-83.000000000000	USD
6686	Soldotna	Soldotna	SXQ		USA	US	60.483333000000	-151.066667000000	USD
6687	Tete-a-La Baleine	Tete-a-La Baleine	ZTB		Canada	CA	50.674444000000	-59.383611000000	CAD
6688	Bristol Temple Meads Railway Station	Bristol	TPB		United Kingdom	GB	51.449000000000	-2.580000000000	GBP
6689	Berens River	Berens River	YBV		Canada	CA	52.351389000000	-97.016944000000	CAD
6690	Kuopio Airport	Kuopio	KUO		Finland	FI	63.008908000000	27.788696000000	EUR
6691	Beef Island Airport	Beef Island	EIS		British Virgin Islands	VG	18.443889000000	-64.542778000000	USD
6692	Kochi Airport	Kochi	COK		India	IN	10.155644000000	76.390537000000	INR
6693	Williamsport Regional Airport	Montoursville	IPT		United States	US	41.242220000000	-76.920555000000	USD
6694	Antsohihy	Antsohihy	WAI		Madagascar	MG	-14.898889000000	47.993889000000	MGA
6695	Sonderborg Rail Station	Sonderborg	QSG		Denmark	DK	54.964444000000	9.791667000000	DKK
6696	Lillehammer Rail Station	Lillehammer Rail Station	XXL		Norway	NO	61.114722000000	10.460833000000	NOK
6697	Santa Teresita	Santa Teresita	SST		Argentina	AR	-36.542222000000	-59.721389000000	ARS
6698	Mys-Kamenny	Mys-Kamenny	YMK		Russian Federation	RU	68.466111000000	73.595556000000	RUB
6699	Morotai Island	Morotai Island	OTI		Indonesia	ID	2.050000000000	128.316667000000	IDR
6700	Mana Island	Mana Island	MNF		Fiji	FJ	-17.672778000000	177.098611000000	FJD
6701	Santa Elena	Santa Elena	SNV		Venezuela	VE	4.554444000000	-61.143611000000	VEB
6702	Koliganek	Koliganek	KGK		USA	US	59.727222000000	-157.261667000000	USD
6703	Lyall Harbour	Lyall Harbour	YAJ		Canada	CA	48.800000000000	-123.200000000000	CAD
6704	Dusseldorf International Airport	Dusseldorf	DUS		Germany	DE	51.278327000000	6.765580000000	EUR
6705	Macau Airport	Macau	MFM		Macao	MO	22.156587000000	113.572850000000	MOP
6706	Flora Airport	Floro	FRO		Norway	NO	61.586430000000	5.024577000000	NOK
6707	Burundai	Burundai	BXJ		Kazakhstan	KZ	43.366667000000	76.833333000000	KZT
6708	Bradford (GB)	Bradford (GB)	BRF		United Kingdom	GB	53.802778000000	-1.750000000000	GBP
6709	Lucerne Rail Station	Lucerne Rail Station	QLJ		Switzerland	CH	47.049444000000	8.310556000000	CHF
6710	Barcelona Sants Rail Stn	Barcelona (ES)	YJB		Spain	ES	41.379167000000	2.140000000000	EUR
6711	Borba	Borba	RBB		Brazil	BR	-4.400000000000	-59.583333000000	BRL
6712	Chingola	Chingola	CGJ		Zambia	ZM	-12.533333000000	27.866667000000	ZMK
6713	Virac	Virac	VRC		Philippines	PH	13.577222000000	124.205556000000	PHP
6714	Malololailai	Malololailai	PTF		Fiji	FJ	-17.783333000000	177.200000000000	FJD
6715	Ouesso	Ouesso	OUE		Congo	CG	1.616667000000	16.033333000000	XAF
6716	Miami Opa Locka Apt	Miami	OPF		USA	US	25.802778000000	-80.283333000000	USD
6717	Port Alberni	Port Alberni	YPB		Canada	CA	49.233333000000	-124.800000000000	CAD
6718	Iasi Airport	Iasi	IAS		Romania	RO	47.176988000000	27.616993000000	ROL
6719	Conakry Airport	Conakry	CKY		Guinea	GN	9.575655000000	-13.620170000000	GNF
6720	Achmad Yani Airport	Semarang	SRG		Indonesia	ID	-6.979155000000	110.378549000000	IDR
6721	Central Wisconsin Airport	Mosinee	CWA		United States	US	44.784600000000	-89.670400000000	USD
6722	Guadalajara Rail Station	Guadalajara Rail Station	GDU		Spain	ES	40.643889000000	-3.182222000000	EUR
6723	Toledo Rail Station	Toledo Rail Station	XTJ		Spain	ES	39.862500000000	-4.011111000000	EUR
6724	Paulo Afonso	Paulo Afonso	PAV		Brazil	BR	-9.400833000000	-38.250556000000	BRL
6725	Wajima	Wajima	NTQ		Japan	JP	37.292500000000	136.958889000000	JPY
6726	Numfoor	Numfoor	FOO		Indonesia	ID	-0.933333000000	134.866667000000	IDR
6727	Lightning Ridge	Lightning Ridge	LHG		Australia	AU	-29.400000000000	147.966667000000	AUD
6728	Machala	Machala	MCH		Ecuador	EC	-3.266667000000	-79.983333000000	USD
6729	Igiugig	Igiugig	IGG		USA	US	59.323889000000	-155.901389000000	USD
6730	Shawnigan Rail Station	Shawnigan Rail Station	XFM		Canada	CA	48.653611000000	-123.625556000000	CAD
6731	St Austell Railway Station	St Austell	USX		United Kingdom	GB	50.339700000000	-4.790280000000	GBP
6732	Eglinton Airport	Londonderry	LDY		United Kingdom	GB	55.039567000000	-7.155835000000	GBP
6733	Metropolitan Oakland International Airport	Oakland	OAK		United States	US	37.711880000000	-122.212011000000	USD
6734	Servel Airport	Lannion	LAI		France	FR	48.754166000000	-3.481944000000	EUR
6735	Salt Cay	Salt Cay	SLX		Turks and Caicos Islands	TC	21.335833000000	-71.200556000000	USD
6736	Selje Harbour	Selje Harbour	QFK		Norway	NO	62.050000000000	5.366667000000	NOK
6737	Preston Rail Station	Preston Rail Station	XPT		United Kingdom	GB	53.766667000000	-2.700000000000	GBP
6738	Yaroslavl	Yaroslavl	IAR		Russian Federation	RU	57.616667000000	39.883333000000	RUB
6739	Guangyuan	Guangyuan	GYS		China	CN	32.390000000000	105.693056000000	RMB
6740	Lukla	Lukla	LUA		Nepal	NP	27.686667000000	86.729444000000	NPR
6741	Daru	Daru	DAU		Papua New Guinea	PG	-9.086667000000	143.208056000000	PGK
6742	Vivigani	Vivigani	VIV		Papua New Guinea	PG	-9.300000000000	150.316667000000	PGK
6743	Columbus	Columbus (US) IN	CLU		USA	US	39.133333000000	-85.933333000000	USD
6744	Solomon	Solomon	SOL		USA	US	64.583333000000	-164.300000000000	USD
6745	Kaschechewan	Kaschechewan	ZKE		Canada	CA	52.281667000000	-81.678056000000	CAD
6746	Norte Los Rodeos Airport	Tenerife	TFN		Spain and Canary Islands	ES	28.488056000000	-16.345982000000	EUR
6747	Colon	Colon	ONX		Panama	PA	9.366667000000	-79.900000000000	PAB
6748	Ourense Rail Station	Ourense Rail Station	OUQ		Spain	ES	42.350556000000	-7.873056000000	EUR
6749	Stuttgart HBF Rail Station	Stuttgart	ZWS		Germany	DE	48.783611000000	9.181389000000	EUR
6750	Hassi R Mel	Hassi R Mel	HRM		Algeria	DZ	32.933333000000	3.300000000000	DZD
6751	Ampara (LK) 00	Ampara (LK) 00	AFK		Sri Lanka	LK	7.291944000000	81.635278000000	LKR
6752	Bulolo	Bulolo	BUL		Papua New Guinea	PG	-7.216389000000	146.650000000000	PGK
6753	Saibai Island	Saibai Island	SBR		Australia	AU	-9.400000000000	142.666667000000	AUD
6754	Camp Springs Andrews AFB	Camp Springs	ADW		USA	US	38.800000000000	-76.916667000000	USD
6755	Panguitch	Panguitch	PNU		USA	US	37.833333000000	-112.383333000000	USD
6756	Riviere du Loup	Riviere du Loup	YRI		Canada	CA	47.766667000000	-69.583333000000	CAD
6757	Dalaman Airport	Dalaman	DLM		Turkey	TR	36.716667000000	28.783333000000	USD
6758	Mal. Cunha Machado Airport	Sao Luiz	SLZ		Brazil	BR	-2.583316000000	-44.236684000000	BRL
6759	Graciosa Island Airport	Graciosa Island (Azores)	GRW		Portugal	PT	39.090954000000	-28.027958000000	EUR
6760	Inagua	Inagua	IGA		Bahamas	BS	20.975000000000	-73.666944000000	BSD
6761	Mikkeli	Mikkeli	MIK		Finland	FI	61.700000000000	27.216667000000	EUR
6762	Steinkjer Rail Station	Steinkjer Rail Station	XKJ		Norway	NO	64.012500000000	11.494167000000	NOK
6763	Florence S.M. Novella Rail Station	Florence S.M. Novella Rail Station	ZMS		Italy	IT	43.776389000000	11.248056000000	EUR
6764	Khasab	Khasab	KHS		Oman	OM	26.171111000000	56.240556000000	OMR
6765	Soyo	Soyo	SZA		Angola	AO	-6.141111000000	12.372500000000	AOA
6766	Kuala Lumpur Sentral Rail Station	Kuala Lumpur	XKL		Malaysia	MY	3.134444000000	101.686667000000	MYR
6767	Niau	Niau	NIU		French Polynesia	PF	-16.120833000000	-146.373611000000	XPF
6768	Kaedi	Kaedi	KED		Mauritania	MR	16.166667000000	-13.516667000000	MRO
6769	Manassas	Manassas	MNZ		USA	US	38.716667000000	-77.516667000000	USD
6770	Island Lake/Garden Hill	Island Lake/Garden Hill	YIV		Canada	CA	54.000000000000	-94.833333000000	CAD
6771	Miramare Airport	Rimini	RMI		Italy	IT	44.022952000000	12.619594000000	EUR
6772	Sharm el-Sheik Intl Airport	Sharm el Sheikh	SSH		Egypt	EG	27.979357000000	34.385253000000	EGP
6773	Civil Airport	Sylhet	ZYL		Bangladesh	BD	24.957598000000	91.870477000000	BDT
6774	Mildenhall Airport	Mildenhall	MHZ		United Kingdom	GB	52.366670000000	0.483333000000	GBP
6775	Jaque	Jaque	JQE		Panama	PA	7.517222000000	-78.156944000000	PAB
6776	Harwich Rail Station	Harwich Rail Station	QQH		United Kingdom	GB	51.950000000000	1.283333000000	GBP
6777	Avesta Krylbo Rail Station	Avesta Krylbo Rail Station	XYP		Sweden	SE	60.129722000000	16.216944000000	SEK
6778	Tres Lagoas	Tres Lagoas	TJL		Brazil	BR	-20.754444000000	-51.683889000000	BRL
6779	Humen	Humen	ZTI		China	CN	22.816944000000	113.610556000000	RMB
6780	Tanjung Pinang	Tanjung Pinang	TNJ		Indonesia	ID	0.923889000000	104.533056000000	IDR
6781	Onotoa	Onotoa	OOT		Kiribati	KI	-1.866667000000	175.566667000000	AUD
6782	Maio Island	Maio Island	MMO		Cape Verde	CV	15.155833000000	-23.213611000000	CVE
6783	Nightmute	Nightmute	NME		USA	US	60.472222000000	-164.699167000000	USD
6784	Port Mcneil	Port Mcneil	YMP		Canada	CA	50.583333000000	-127.100000000000	CAD
6785	Exeter St Thomas Railway Station	Exeter	EXS		United Kingdom	GB	50.717130000000	-3.538580000000	GBP
6786	Mitiaro Island	Mitiaro Island	MOI		Cook Islands	CK	-19.842500000000	-157.703333000000	NZD
6787	San Ramon	San Ramon	SRD		Bolivia	BO	-13.283333000000	-64.700000000000	BOB
6788	Ivanof Bay	Ivanof Bay	KIB		USA	US	55.900000000000	-159.483333000000	USD
6789	Attawapiskat	Attawapiskat	YAT		Canada	CA	52.927778000000	-82.431111000000	CAD
6790	St Austell Railway Station	St Austell	USX		United Kingdom	GB	50.339700000000	-4.790280000000	GBP
6791	Es Senia Airport	Oran	ORN		Algeria	DZ	35.620019000000	-0.606108000000	DZD
6792	Taiwan Taoyuan International Airport	Taipei	TPE		Republic of China Taiwan	TW	25.076389000000	121.223889000000	TWD
6793	Lake Charles Regional Airport	Lake Charles	LCH		United States	US	30.131111000000	-93.225555000000	USD
6794	Shinyanga	Shinyanga	SHY		Tanzania United Republic of	TZ	-3.600000000000	33.500000000000	TZS
6795	Malmo C Rail Station	Malmo	XFP		Sweden	SE	55.609167000000	12.999722000000	SEK
6796	Bauru	Bauru	BAU		Brazil	BR	41.117778000000	16.869444000000	BRL
6797	Mirny	Mirny	MJZ		Russian Federation	RU	62.534722000000	114.038889000000	RUB
6798	Ca Mau	Ca Mau	CAH		Viet Nam	VN	9.177778000000	105.177500000000	VND
6799	Katherine	Katherine	KTR		Australia	AU	-14.521111000000	132.377778000000	AUD
6800	Pitalito	Pitalito	PTX		Colombia	CO	1.850000000000	-76.033333000000	COP
6801	Quinhagak	Quinhagak	KWN		USA	US	59.756389000000	-161.883611000000	USD
6802	Chesterfield Inlet	Chesterfield Inlet	YCS		Canada	CA	63.346667000000	-90.728889000000	CAD
6803	Kerry County Airport	Kerry County	KIR		Ireland	IE	52.181475000000	-9.535666000000	EUR
6804	Cardiff-Wales Airport	Cardiff	CWL		United Kingdom	GB	51.398768000000	-3.339075000000	GBP
6805	Shenyang Airport	Shenyang	SHE		China	CN	41.861083000000	123.426928000000	RMB
6806	Waterford Airport	Waterford	WAT		Ireland	IE	52.188866000000	-7.080082000000	EUR
6807	Puerto Obaldia	Puerto Obaldia	PUE		Panama	PA	8.667222000000	-77.418611000000	PAB
6808	Papa Westray	Papa Westray	PPW		United Kingdom	GB	59.351389000000	-2.900000000000	GBP
6809	Runcorn Rail Station	Runcorn Rail Station	XRC		United Kingdom	GB	53.333333000000	-2.733333000000	GBP
6810	Copiapo	Copiapo	CPO		Chile	CL	-27.261667000000	-70.779167000000	CLP
6811	Kunshan Rail Station	Kunshan Rail Station	KVN		China	CN	31.355000000000	120.946944000000	RMB
6812	Ayawasi	Ayawasi	AYW		Indonesia	ID	-1.200000000000	132.500000000000	IDR
6813	Green River	Green River	GVI		Papua New Guinea	PG	-3.916667000000	141.166667000000	PGK
6814	Ciudad Bolivar	Ciudad Bolivar	CBL		Venezuela	VE	8.121944000000	-63.537222000000	VEB
6815	Gambell	Gambell	GAM		USA	US	63.766667000000	-171.732778000000	USD
6816	Aleknagik	Aleknagik	WKK		USA	US	59.281944000000	-158.617778000000	USD
6817	Aix-en-Provence Tgv Rail Station	Aix-en-Provence Tgv Rail Station	QXB		France	FR	43.523056000000	5.445278000000	EUR
6818	Zaporozhye Airport	Zaporozhye	OZH		Ukraine	UA	47.867500000000	35.315833000000	UAH
6819	Alejo Garcia Airport	Ciudad del Este	AGT		Paraguay	PY	-25.500000000000	-54.833333000000	PYG
6820	Varkaus Airport	Varkaus	VRK		Finland	FI	62.300000000000	27.933332000000	EUR
6821	Playa Samara	Playa Samara	PLD		Costa Rica	CR	10.250000000000	-85.416667000000	CRC
6822	Logrono	Logrono	RJL		Spain	ES	42.460556000000	-2.320556000000	EUR
6823	Stoke On Trent Rail Station	Stoke On Trent Rail Station	XWH		United Kingdom	GB	53.000000000000	-2.166667000000	GBP
6824	Parnu	Parnu	EPU		Estonia	EE	58.418889000000	24.806111000000	EEK
6825	Achinsk	Achinsk	ACS		Russian Federation	RU	56.269722000000	90.571944000000	RUB
6826	Dimapur	Dimapur	DMU		India	IN	25.882500000000	93.774444000000	INR
6827	Bedourie	Bedourie	BEU		Australia	AU	-24.346111000000	139.460278000000	AUD
6828	Timbunke	Timbunke	TBE		Papua New Guinea	PG	-4.200000000000	143.516667000000	PGK
6829	Minocqua	Minocqua	ARV		USA	US	45.916667000000	-89.733333000000	USD
6830	Dalton Flightlink Bus Service	Dalton	QJJ		USA	US	34.733333000000	-84.883333000000	USD
6831	Repulse Bay	Repulse Bay	YUT		Canada	CA	66.521389000000	-86.224722000000	CAD
6832	Des Moines International Airport	Des Moines	DSM		United States	US	41.532434000000	-93.648087000000	USD
6833	Kristianstad Airport	Kristianstad	KID		Sweden	SE	55.919445000000	14.088889000000	SEK
6834	Kodiak Airport	Kodiak	ADQ		United States	US	57.755276000000	-152.512970000000	USD
6835	Kiel	Kiel	KEL		Germany	DE	54.379722000000	10.145000000000	EUR
6836	Marnardal Rail Station	Marnardal Rail Station	ZYY		Norway	NO	58.221389000000	7.520556000000	NOK
6837	Zagora	Zagora	OZG		Morocco	MA	30.263889000000	-5.853056000000	MAD
6838	Bannu	Bannu	BNP		Pakistan	PK	32.966667000000	70.516667000000	PKR
6839	Cape Gloucester	Cape Gloucester	CGC		Papua New Guinea	PG	-5.459167000000	148.432500000000	PGK
6840	Ua Huka	Ua Huka	UAH		French Polynesia	PF	-8.936111000000	-139.555000000000	XPF
6841	Akhiok	Akhiok	AKK		USA	US	56.950000000000	-154.166667000000	USD
6842	Price	Price	PUC		USA	US	39.602778000000	-110.750000000000	USD
6843	Salmon Arm	Salmon Arm	YSN		Canada	CA	50.683333000000	-119.233333000000	CAD
6844	Sibu	Sibu	SBW		Malaysia	MY	2.264167000000	111.982500000000	MYR
6845	Watertown Airport	Watertown	ART		United States	US	43.990833000000	-76.021389000000	USD
6846	Froesoe Airport	Ostersund	OSD		Sweden	SE	63.198612000000	14.494444000000	SEK
6847	Nevis	Nevis	NEV		Saint Kitts and Nevis, Leeward Islands	KN	17.205556000000	-62.590000000000	XCD
6848	Holyhead	Holyhead	HLY		United Kingdom	GB	53.316667000000	-4.633333000000	GBP
6849	Herning Rail Station	Herning Rail Station	XAK		Denmark	DK	56.133333000000	8.983333000000	DKK
6850	Imperatriz	Imperatriz	IMP		Brazil	BR	-5.531389000000	-47.460000000000	BRL
6851	Toyooka	Toyooka	TJH		Japan	JP	35.508333000000	134.788889000000	JPY
6852	Long Bawan	Long Bawan	LBW		Indonesia	ID	3.883333000000	115.700000000000	IDR
6853	Josephstaal	Josephstaal	JOP		Papua New Guinea	PG	-4.750000000000	145.016667000000	PGK
6854	Anta	Anta	ATA		Peru	PE	-9.350556000000	-77.597500000000	PEN
6855	Dayton Patterson AFB	Dayton	FFO		USA	US	39.900000000000	-84.216667000000	USD
6856	Kavik	Kavik	VIK		USA	US	69.500000000000	-147.333333000000	USD
6857	St Tropez Heliport	St Tropez	JSZ		France	FR	43.263889000000	6.658333000000	EUR
6858	Timisoara Airport	Timisoara	TSR		Romania	RO	45.809924000000	21.320120000000	ROL
6859	Bamako Airport	Bamako	BKO		Mali	ML	12.540926000000	-7.947951000000	XOF
6860	Adi Sumarmo Airport	Solo City	SOC		Indonesia	ID	-7.520435000000	110.750548000000	IDR
6861	Dundee Airport	Dundee	DND		United Kingdom	GB	56.454090000000	-3.014531000000	GBP
6862	Vila Do Porto Airport	Santa Maria (Azores)	SMA		Portugal	PT	36.966667000000	-25.100000000000	EUR
6863	Trujillo (HN)	Trujillo (HN)	TJI		Honduras	HN	15.966667000000	-85.866667000000	HNL
6864	Halden Rail Station	Halden Rail Station	XKD		Norway	NO	59.120000000000	11.383889000000	NOK
6865	El Maiten	El Maiten	EMX		Argentina	AR	-42.068056000000	-71.155556000000	ARS
6866	Iwakuni	Iwakuni	IWK		Japan	JP	34.135278000000	132.235556000000	JPY
6867	Saidu Sharif	Saidu Sharif	SDT		Pakistan	PK	34.813611000000	72.352778000000	PKR
6868	Fox Glacier	Fox Glacier	FGL		New Zealand	NZ	-43.400000000000	170.033333000000	NZD
6869	Wewak	Wewak	WWK		Papua New Guinea	PG	-3.583889000000	143.669167000000	PGK
6870	Eagle	Eagle	EAA		USA	US	64.778333000000	-141.160556000000	USD
6871	Teller	Teller	TLA		USA	US	65.240278000000	-166.337778000000	USD
6872	Wilmington Rail Station	Wilmington (US) DE	ZWI		USA	US	39.736944000000	-75.551111000000	USD
6873	Tabarka Airport	Tabarka	TBJ		Tunisia	TN	36.978333000000	8.876389000000	TND
6874	Tiruchirapalli International Airport	Tiruchirappalli	TRZ		India	IN	10.762168000000	78.707241000000	INR
6875	Windsor Airport	Windsor	YQG		Canada	CA	42.274166000000	-82.963890000000	CAD
6876	Mananjary	Mananjary	MNJ		Madagascar	MG	-21.201667000000	48.358333000000	MGA
6877	Wiesbaden Rail Station	Wiesbaden Rail Station	UWE		Germany	DE	50.070000000000	8.243889000000	EUR
6878	Vilyuysk	Vilyuysk	VYI		Russian Federation	RU	63.757222000000	121.691667000000	RUB
6879	Hatanga	Hatanga	HTG		Russian Federation	RU	71.966667000000	102.500000000000	RUB
6880	Patna	Patna	PAT		India	IN	25.591389000000	85.088056000000	INR
6881	Goulburn	Goulburn	GUL		Australia	AU	-34.816667000000	149.733333000000	AUD
6882	Miles	Miles	WLE		Australia	AU	-26.810000000000	150.161944000000	AUD
6883	Cape Romanzof	Cape Romanzof	CZF		USA	US	61.733333000000	-166.000000000000	USD
6884	Stevens Village	Stevens Village	SVS		USA	US	66.016111000000	-149.061111000000	USD
6885	Springfield Rail Station	Springfield (US) MA	ZSF		USA	US	42.105833000000	-72.593611000000	USD
6886	Sais Airport	Fez	FEZ		Morocco	MA	33.930791000000	-4.982138000000	MAD
6887	Indira Gandhi International Airport	Delhi	DEL		India	IN	28.556555000000	77.100789000000	INR
6888	Haukasen Airport	Sogndal	SOG		Norway	NO	61.158127000000	7.136988000000	NOK
6889	Matamoros	Matamoros	MAM		Mexico	MX	25.770000000000	-97.525278000000	MXN
6890	Dover Rail Station	Dover Rail Station	QQD		United Kingdom	GB	51.133333000000	1.316667000000	GBP
6891	Stockport Rail Station	Stockport Rail Station	XVA		United Kingdom	GB	53.416667000000	-2.166667000000	GBP
6892	Sliac	Sliac	SLD		Slovakia	SK	48.637778000000	19.134167000000	EUR
6893	Fukue	Fukue	FUJ		Japan	JP	32.666389000000	128.832778000000	JPY
6894	Nepalganj	Nepalganj	KEP		Nepal	NP	28.103611000000	81.666944000000	NPR
6895	Cooktown	Cooktown	CTN		Australia	AU	-15.444722000000	145.184444000000	AUD
6896	Tau	Tau	TAV		American Samoa	AS	-14.250000000000	-169.500000000000	USD
6897	Arctic Village	Arctic Village	ARC		USA	US	68.114722000000	-145.579444000000	USD
6898	Ikamiut	Ikamiut	QJI		Greenland	GL	68.632222000000	-51.835000000000	DKK
6899	Pelly Bay Dewline Site Apt	Pelly Bay	YUF		Canada	CA	68.883333000000	-89.850000000000	CAD
6900	Altenrhein Airport	Altenrhein	ACH		Switzerland	CH	47.483333000000	9.566667000000	CHF
6901	Enrique Malek Airport	David	DAV		Panama	PA	8.383333000000	-82.433333000000	PAB
6902	Ovda Airport	Ovda	VDA		Israel	IL	29.952014000000	34.933900000000	ILS
6903	Ilmajoki Airport	Seinajoki	SJY		Finland	FI	62.693200000000	22.835285000000	EUR
6904	Ankavandra	Ankavandra	JVA		Madagascar	MG	-18.800000000000	45.283333000000	MGA
6905	Harwich Rail Station	Harwich Rail Station	QQH		United Kingdom	GB	51.950000000000	1.283333000000	GBP
6906	Rognan Rail Station	Rognan Rail Station	ZXM		Norway	NO	67.116667000000	15.416667000000	NOK
6907	In Salah	In Salah	INZ		Algeria	DZ	27.251111000000	2.511944000000	DZD
6908	Akola	Akola	AKD		India	IN	20.666667000000	77.083333000000	INR
6909	Brewarrina	Brewarrina	BWQ		Australia	AU	-29.966667000000	146.816667000000	AUD
6910	Tonu	Tonu	TON		Papua New Guinea	PG	-6.650000000000	155.433333000000	PGK
6911	Belleville	Belleville	BLV		USA	US	38.541111000000	-89.848889000000	USD
6912	Renton	Renton	RNT		USA	US	47.466667000000	-122.200000000000	USD
6913	Wawa	Wawa	YXZ		Canada	CA	47.983333000000	-84.783333000000	CAD
6914	Bristol Temple Meads Railway Station	Bristol	TPB		United Kingdom	GB	51.449000000000	-2.580000000000	GBP
6915	Telupid	Telupid	TEL		Malaysia	MY	5.629722000000	117.125000000000	MYR
6916	Mackay	Mackay	MKY		Australia	AU	-21.171667000000	149.179722000000	AUD
6917	Boma	Boma	BOA		Congo Democratic Republic of	CD	-5.866667000000	13.066667000000	CDF
6918	Lancaster	Lancaster	LNS		USA	US	40.121667000000	-76.296111000000	USD
6919	Fort Albany	Fort Albany	YFA		Canada	CA	52.203611000000	-81.695000000000	CAD
6920	Cardiff Central Railway Station	Cardiff	CFW		United Kingdom	GB	51.475500000000	-3.178000000000	GBP
6921	Darwin Airport	Darwin	DRW		Australia	AU	-12.407805000000	130.877521000000	AUD
6922	Lincoln Airport	Lincoln	LNK		United States	US	40.846176000000	-96.754710000000	USD
6923	Moroni Iconi Apt	Moroni	YVA		Comoros	KM	-11.700000000000	43.233333000000	USD
6924	Fredrikstad Rail Station	Fredrikstad Rail Station	XKF		Norway	NO	59.208889000000	10.950833000000	NOK
6925	Comodoro Rivadavia	Comodoro Rivadavia	CRD		Argentina	AR	-45.785278000000	-67.465556000000	ARS
6926	Kelamayi Bus Station	Kelamayi Bus Station	KYY		China	CN	45.590556000000	84.870833000000	RMB
6927	Banjarmasin	Banjarmasin	BDJ		Indonesia	ID	-3.442222000000	114.762500000000	IDR
6928	Halls Creek	Halls Creek	HCQ		Australia	AU	-18.233333000000	127.666667000000	AUD
6929	Chimbote	Chimbote	CHM		Peru	PE	-9.083333000000	-78.600000000000	PEN
6930	Glendive	Glendive	GDV		USA	US	47.140556000000	-104.809444000000	USD
6931	White Mountain	White Mountain	WMO		USA	US	64.686389000000	-163.411111000000	USD
6932	Rennes Rail Station	Rennes	ZFJ		France	FR	48.103333000000	-1.672500000000	EUR
6933	Sydney Airport	Sydney	YQY		Canada	CA	46.166667000000	-60.050000000000	CAD
6934	Albenga Airport	Albenga	ALL		Italy	IT	44.050000000000	8.216667000000	EUR
6935	Klamath Falls Airport	Klamath Falls	LMT		United States	US	42.163055000000	-121.735830000000	USD
6936	Bealanana	Bealanana	WBE		Madagascar	MG	-14.533333000000	48.700000000000	MGA
6937	London Euston Rail Station	London (GB)	QQU		United Kingdom	GB	51.533333000000	-0.133333000000	GBP
6938	Talakan	Talakan	TLK		Russian Federation	RU	59.881667000000	111.045556000000	RUB
6939	Gangneung	Gangneung	KAG		Korea Republic of	KR	37.750000000000	128.950000000000	KRW
6940	Tikapur	Tikapur	TPU		Nepal	NP	28.550000000000	81.183333000000	NPR
6941	Griffith	Griffith	GFF		Australia	AU	-34.253889000000	146.061667000000	AUD
6942	Viru	Viru	VIU		Solomon Islands	SB	-8.500000000000	157.683333000000	SBD
6943	Clarks Point	Clarks Point	CLP		USA	US	58.833611000000	-158.529444000000	USD
6944	St Paul Island	St Paul Island	SNP		USA	US	57.167222000000	-170.220556000000	USD
6945	San Jose Bus Station	San Jose (US)	ZJO		USA	US	37.355556000000	-121.919444000000	USD
6946	Jersey Airport	Jersey	JER		United Kingdom	GB	49.205297000000	-2.194344000000	GBP
6947	Austin-Bergstrom International Airport	Austin	AUS		United States	US	30.202545000000	-97.667064000000	USD
6948	Bangor International Airport	Bangor	BGR		United States	US	44.812298000000	-68.821020000000	USD
6949	Montrose Regional Airport	Montrose	MTJ		United States	US	38.500300000000	-107.899000000000	USD
6950	Cuenca Rail Station	Cuenca Rail Station	CEJ		Spain	ES	40.067500000000	-2.136667000000	EUR
6951	Madrid Torrejon	Madrid	TOJ		Spain	ES	40.496667000000	-3.445833000000	EUR
6952	Karlovy Vary Bus Station	Karlovy Vary Bus Station	ZIK		Czech Republic	CZ	50.230278000000	12.863889000000	CZK
6953	Iki	Iki	IKI		Japan	JP	33.750000000000	129.783333000000	JPY
6954	Ramechhap	Ramechhap	RHP		Nepal	NP	27.400000000000	86.083333000000	NPR
6955	Horn Island	Horn Island	HID		Australia	AU	-10.586389000000	142.290000000000	AUD
6956	Wasu	Wasu	WSU		Papua New Guinea	PG	-5.983333000000	147.183333000000	PGK
6957	Dora Bay	Dora Bay	DOF		USA	US	55.212500000000	-132.266667000000	USD
6958	Worland	Worland	WRL		USA	US	43.964444000000	-107.953056000000	USD
6959	Angers Rail Station	Angers	QXG		France	FR	47.464722000000	-0.556944000000	EUR
6960	Nikolaev Airport	Nikolaev	NLV		Ukraine	UA	47.050000000000	31.916667000000	UAH
6961	Ministro Pistarini Airport	Buenos Aires	EZE		Argentina	AR	-34.812730000000	-58.539834000000	ARS
6962	North Bay Airport	Barra	BRR		United Kingdom	GB	57.023335000000	-7.440278000000	GBP
6963	Manchester Boston Regional Airport	Manchester	MHT		USA	US	42.927860000000	-71.438440000000	USD
6964	Moheli	Moheli	NWA		Comoros	KM	-12.298056000000	43.766389000000	USD
6965	Merida Rail Station	Merida Rail Station	QWX		Spain	ES	38.921667000000	-6.343333000000	EUR
6966	Arica	Arica	ARI		Chile	CL	-18.348611000000	-70.338611000000	CLP
6967	Jingdezhen	Jingdezhen	JDZ		China	CN	29.339167000000	117.176389000000	RMB
6968	Surkhet	Surkhet	SKH		Nepal	NP	28.586111000000	81.635833000000	NPR
6969	Finschhafen	Finschhafen	FIN		Papua New Guinea	PG	-6.616667000000	147.866667000000	PGK
6970	Wyndham	Wyndham	WYN		Australia	AU	-15.516667000000	128.150000000000	AUD
6971	Anchorage Elmendorf AFB	Anchorage	EDF		USA	US	61.250000000000	-149.800000000000	USD
6972	Tin City	Tin City	TNC		USA	US	65.566111000000	-167.923056000000	USD
6973	Glenview Rail Station	Glenview Rail Station	ZWV		USA	US	42.128333000000	-87.814722000000	USD
6974	Dnepropetrovsk Airport	Dnepropetrovsk	DNK		Ukraine	UA	48.368741000000	35.094461000000	UAH
6975	Matecana Airport	Pereira	PEI		Colombia	CO	4.815945000000	-75.736531000000	COP
6976	Teterboro Airport	Teterboro	TEB		United States	US	40.849724000000	-74.062225000000	USD
6977	Coto 47	Coto 47	OTR		Costa Rica	CR	8.601667000000	-82.968611000000	CRC
6978	Hultsfred	Hultsfred	HLF		Sweden	SE	57.516667000000	15.833333000000	SEK
6979	Aarhus Bus Service	Aarhus	ZID		Denmark	DK	56.150000000000	10.216667000000	DKK
6980	Santiago Los Cerrillos Apt	Santiago (CL)	ULC		Chile	CL	-33.483333000000	-70.700000000000	CLP
6981	Bisho	Bisho	BIY		South Africa	ZA	-32.900000000000	27.283333000000	ZAR
6982	Vagar Airport	Faroe Islands	FAE		Faroe Islands	FO	62.066667000000	-7.266667000000	DKK
6983	Montreal-Pierre Elliott Trudeau International Airport	Montreal	YUL		Canada	CA	45.457715000000	-73.749906000000	CAD
6984	Doha International Airport	Doha	DOH		Qatar	QA	25.267569000000	51.558067000000	QAR
6985	Columbus Metropolitan Airport	Columbus	CSG		United States	US	32.513332000000	-84.941110000000	USD
6986	Beja	Beja	BYJ		Portugal	PT	38.078889000000	-7.932500000000	EUR
6987	Grand Junction Regional Airport	Grand Junction	GJT		United States	US	39.122665000000	-108.528336000000	USD
6988	Colonsay	Colonsay	CSA		United Kingdom	GB	56.057778000000	-6.243056000000	GBP
6989	Burgos Rail Station	Burgos Rail Station	UGR		Spain	ES	42.370833000000	-3.666111000000	EUR
6990	A Coruna Rail Stn	A Coruna Rail Stn	YJC		Spain	ES	43.352778000000	-8.410556000000	EUR
6991	Alta Floresta	Alta Floresta	AFL		Brazil	BR	-9.866111000000	-56.106111000000	BRL
6992	Daqing	Daqing	DQA		China	CN	46.750000000000	125.139167000000	RMB
6993	Janakpur	Janakpur	JKR		Nepal	NP	26.708889000000	85.924167000000	NPR
6994	Coondewanna	Coondewanna	CJF		Australia	AU	-22.965000000000	118.812500000000	AUD
6995	Strahan	Strahan	SRN		Australia	AU	-42.157500000000	145.289722000000	AUD
6996	Alpine	Alpine	ALE		USA	US	30.386111000000	-103.683333000000	USD
6997	Bremerton	Bremerton	PWT		USA	US	47.483333000000	-122.750000000000	USD
6998	Ste Therese Point	Ste Therese Point	YST		Canada	CA	53.845833000000	-94.851389000000	CAD
6999	Natitingou	Natitingou	NAE		Benin	BJ	10.316667000000	1.366667000000	XOF
7000	San Diego North Island Nas	San Diego	NZY		USA	US	32.736111000000	-117.186111000000	USD
7001	North Spirit Lake	North Spirit Lake	YNO		Canada	CA	52.490556000000	-92.972222000000	CAD
7002	Palanga International Airport	Palanga	PLQ		Lithuania	LT	55.950000000000	21.083333000000	LTL
7003	Regina Airport	Regina	YQR		Canada	CA	50.433326000000	-104.655190000000	CAD
7004	William P. Hobby Airport	Houston	HOU		United States	US	29.654512000000	-95.277016000000	USD
7005	Provincetown Municipal Airport	Provincetown	PVC		United States	US	42.077100000000	-70.216900000000	USD
7006	Doncaster	Doncaster	DCS		United Kingdom	GB	53.466667000000	-1.000000000000	GBP
7007	Verona Porta Nuova Rail Station	Verona Porta Nuova Rail Station	XIX		Italy	IT	45.450000000000	11.000000000000	EUR
7008	Turin Bus Station	Turin	ZTC		Italy	IT	45.050000000000	7.666667000000	EUR
7009	Errachidia	Errachidia	ERH		Morocco	MA	31.947500000000	-4.398333000000	MAD
7010	Walvis Bay	Walvis Bay	WVB		Namibia	NA	-22.980000000000	14.645278000000	NAD
7011	Aiome	Aiome	AIE		Papua New Guinea	PG	-5.133333000000	144.733333000000	PGK
7012	Raroia	Raroia	RRR		French Polynesia	PF	-16.045000000000	-142.476944000000	XPF
7013	Mbandaka	Mbandaka	MDK		Congo Democratic Republic of	CD	0.022500000000	18.288611000000	CDF
7014	Marana	Marana	MZJ		USA	US	32.500000000000	-111.316667000000	USD
7015	Mingan	Mingan	YLP		Canada	CA	50.283333000000	-64.150000000000	CAD
7016	Novyy Airport	Khabarovsk	KHV		Russian Federation	RU	48.524564000000	135.168616000000	RUB
7017	Petrolina Internacional Airport	Petrolina	PNZ		Brazil	BR	-9.393333000000	-40.490556000000	BRL
7018	Boeing Field International Airport	Seattle	BFI		United States	US	47.537100000000	-122.303700000000	USD
7019	Tamuin	Tamuin	TSL		Mexico	MX	21.983333000000	-98.750000000000	MXN
7020	Filton	Filton	FZO		United Kingdom	GB	51.519444000000	-2.590278000000	GBP
7021	Sheffield	Sheffield	SZD		United Kingdom	GB	53.394167000000	-1.388333000000	GBP
7022	Zurich Hb Rail Station	Zurich	ZLP		Switzerland	CH	47.377778000000	8.540556000000	CHF
7023	Timimoun	Timimoun	TMX		Algeria	DZ	29.233333000000	0.283333000000	DZD
7024	Dalbandin	Dalbandin	DBA		Pakistan	PK	28.875556000000	64.403889000000	PKR
7025	Coconut Island	Coconut Island	CNC		Australia	AU	-10.050278000000	143.071667000000	AUD
7026	Sule	Sule	ULE		Papua New Guinea	PG	-4.966667000000	151.316667000000	PGK
7027	Chadron	Chadron	CDR		USA	US	42.835000000000	-103.098611000000	USD
7028	Houston Sugar Land	Houston	SGR		USA	US	29.616667000000	-95.633333000000	USD
7029	Beaver Creek Van Station	Vail	ZBV		USA	US	38.366667000000	-104.966667000000	USD
7030	Stansted Airport	London	STN		United Kingdom	GB	51.889267000000	0.262703000000	GBP
7031	Rodriguez Airport	Tijuana	TIJ		Mexico	MX	32.546283000000	-116.974664000000	MXN
7032	Dover Air Force Base	Dover-Cheswold	DOV		United States	US	39.128613000000	-75.464165000000	USD
7033	South Caicos	South Caicos	XSC		Turks and Caicos Islands	TC	21.515833000000	-71.528611000000	USD
7034	Kutahya	Kutahya	KZR		Turkey	TR	39.427778000000	30.016389000000	USD
7035	Brugge Rail Station	Brugge Rail Station	ZGJ		Belgium	BE	51.216667000000	3.233333000000	EUR
7036	Albuq	Albuq	BUK		Yemen	YE	15.833333000000	43.766667000000	YER
7037	Zhangye	Zhangye	YZY		China	CN	38.807500000000	100.660833000000	RMB
7038	Tanjung	Tanjung	TJG		Indonesia	ID	-2.216667000000	115.436389000000	IDR
7039	Yorke Island	Yorke Island	OKR		Australia	AU	-9.733333000000	143.416667000000	AUD
7040	Bertoua	Bertoua	BTA		Cameroon	CM	4.550000000000	13.716667000000	XAF
7041	Kalaupapa	Kalaupapa	LUP		USA	US	21.210278000000	-156.975556000000	USD
7042	Fort Simpson	Fort Simpson	YFS		Canada	CA	61.760278000000	-121.236389000000	CAD
7043	St Austell Railway Station	St Austell	USX		United Kingdom	GB	50.339700000000	-4.790280000000	GBP
7044	Trat	Trat	TDX		Thailand	TH	12.274444000000	102.318889000000	THB
7045	Meekatharra	Meekatharra	MKR		Australia	AU	-26.611667000000	118.547778000000	AUD
7046	San Joaquin	San Joaquin	SJB		Bolivia	BO	-13.083333000000	-64.800000000000	BOB
7047	Nanwalek	Nanwalek	KEB		USA	US	59.352222000000	-151.925000000000	USD
7048	Rail (generic) Rail Station	Rail (generic) Rail Station	XZU		USA	US	43.357222000000	-74.223889000000	USD
7049	Ellisras Matimba Airport	Ellisras	ELL		South Africa	ZA	-23.726345000000	27.688034000000	ZAR
7050	Pearson International Airport	Toronto	YYZ		Canada	CA	43.681585000000	-79.611460000000	CAD
7051	Alderney Airport	Alderney	ACI		United Kingdom	GB	49.709347000000	-2.215369000000	GBP
7052	Humberside Airport	Humberside	HUY		United Kingdom	GB	53.583378000000	-0.348510000000	GBP
7053	Unalakleet	Unalakleet	UNK		United States	US	63.883300000000	-160.783000000000	USD
7054	Colonsay	Colonsay	CSA		United Kingdom	GB	56.057778000000	-6.243056000000	GBP
7055	Larvik Rail Station	Larvik Rail Station	XKK		Norway	NO	59.050000000000	10.029722000000	NOK
7056	London Liverpool Street Rail Station	London Liverpool Street Rail Station	ZLS		United Kingdom	GB	51.518056000000	-0.082778000000	GBP
7057	Diamantina	Diamantina	DTI		Brazil	BR	-18.233333000000	-43.651111000000	BRL
7058	Osaka Itami Airport	Osaka	ITM		Japan	JP	34.785556000000	135.438333000000	JPY
7059	Rupsi	Rupsi	RUP		India	IN	26.141111000000	89.906667000000	INR
7060	Fakarava	Fakarava	FAV		French Polynesia	PF	-16.054167000000	-145.656944000000	XPF
7061	Buin	Buin	UBI		Papua New Guinea	PG	-6.733333000000	155.683333000000	PGK
7062	Akron/Canton Ohio Regional	Akron/Canton	CAK		USA	US	40.916111000000	-81.442222000000	USD
7063	Scammon Bay	Scammon Bay	SCM		USA	US	61.845556000000	-165.578611000000	USD
7064	Coral Harbour	Coral Harbour	YZS		Canada	CA	64.193333000000	-83.359444000000	CAD
7065	Landvetter Airport	Gothenburg	GOT		Sweden	SE	57.666643000000	12.294878000000	SEK
7066	Liberia Airport	Liberia	LIR		Costa Rica	CR	10.600005000000	-85.538394000000	CRC
7067	Faleolo Airport	Apia	APW		Samoa	WS	-13.832793000000	-171.997244000000	WST
7068	Virgin Gorda	Virgin Gorda	VIJ		Virgin Islands, British	VG	18.446111000000	-64.428056000000	USD
7069	Braganca	Braganca	BGC		Portugal	PT	41.858056000000	-6.707222000000	EUR
7070	Vienna Suedbahnhof Rail Station	Vienna Suedbahnhof Rail Station	XWC		Austria	AT	48.186944000000	16.380833000000	EUR
7071	Maringa	Maringa	MGF		Brazil	BR	-23.476111000000	-52.015833000000	BRL
7072	Wuxi	Wuxi	WUX		China	CN	31.494722000000	120.429444000000	RMB
7073	Sampit	Sampit	SMQ		Indonesia	ID	-2.499167000000	112.975000000000	IDR
7074	Ngau Island	Ngau Island	NGI		Fiji	FJ	-18.115556000000	179.339722000000	FJD
7075	Kolda	Kolda	KDA		Senegal	SN	12.883333000000	-14.966667000000	XOF
7076	Anacortes	Anacortes	OTS		USA	US	48.500000000000	-122.616667000000	USD
7077	Port Simpson	Port Simpson	YPI		Canada	CA	54.550000000000	-130.416667000000	CAD
7078	Malaga Airport	Malaga	AGP		Spain and Canary Islands	ES	36.675181000000	-4.489616000000	EUR
7079	Hamilton Airport	Hamilton	YHM		Canada	CA	43.161382000000	-79.926310000000	CAD
7080	Ho Chi Minh City Airport	Ho Chi Minh City	SGN		Viet Nam	VN	10.813045000000	106.662477000000	VND
7081	Rapid City Regional Airport	Rapid City	RAP		United States	US	44.037582000000	-103.061180000000	USD
7082	Moyo	Moyo	OYG		Uganda	UG	3.650000000000	31.716667000000	UGX
7083	Papa Westray	Papa Westray	PPW		United Kingdom	GB	59.351389000000	-2.900000000000	GBP
7084	Runcorn Rail Station	Runcorn Rail Station	XRC		United Kingdom	GB	53.333333000000	-2.733333000000	GBP
7085	Parintins	Parintins	PIN		Brazil	BR	-2.673889000000	-56.778056000000	BRL
7086	Taichung (TW) 00	Taichung (TW) 00	TXG		Chinese Taipei	TW	24.150000000000	120.646111000000	TWD
7087	Pangkalanbun	Pangkalanbun	PKN		Indonesia	ID	-2.705278000000	111.673333000000	IDR
7088	Lamen Bay	Lamen Bay	LNB		Vanuatu	VU	-16.585000000000	168.159722000000	VUV
7089	San Vicente del Caguan	San Vicente del Caguan	SVI		Colombia	CO	2.152222000000	-74.766389000000	COP
7090	Kalskag	Kalskag	KLG		USA	US	61.535833000000	-160.347778000000	USD
7091	Pelly Bay	Pelly Bay	YBB		Canada	CA	68.534444000000	-89.808056000000	CAD
7092	Osan Air Base	Osan	OSN		South Korea	KR	37.088688000000	127.030014000000	KRW
7093	Dzaoudzi Airport	Dzaoudzi	DZA		Mayotte	YT	-12.804901000000	45.282099000000	EUR
7094	Lahore Airport	Lahore	LHE		Pakistan	PK	31.520833000000	74.402778000000	PKR
7095	Bill and Hillary Clinton National Airport	Little Rock	LIT		USA	US	34.727432000000	-92.221375000000	USD
7096	Mendi (ET)	Mendi (ET)	NDM		Ethiopia	ET	9.766667000000	35.100000000000	ETB
7097	Vopnafjordur	Vopnafjordur	VPN		Iceland	IS	65.720556000000	-14.850556000000	ISK
7098	Stoke On Trent Rail Station	Stoke On Trent Rail Station	XWH		United Kingdom	GB	53.000000000000	-2.166667000000	GBP
7099	Curitiba Bacacheri	Curitiba	BFH		Brazil	BR	-25.402500000000	-49.233889000000	BRL
7100	Jining	Jining	JNG		China	CN	35.293056000000	116.346667000000	RMB
7101	Tezpur	Tezpur	TEZ		India	IN	26.706667000000	92.778333000000	INR
7102	Guasopa	Guasopa	GAZ		Papua New Guinea	PG	-9.233333000000	152.950000000000	PGK
7103	Yandina	Yandina	XYA		Solomon Islands	SB	-9.065556000000	159.215000000000	SBD
7104	Ely	Ely	ELY		USA	US	39.300000000000	-114.850000000000	USD
7105	Utica	Utica	UCA		USA	US	43.150000000000	-75.383333000000	USD
7106	Trenton Rail Station	Trenton Rail Station	ZZT		USA	US	40.216667000000	-74.733333000000	USD
7107	Maya Maya Airport	Brazzaville	BZV		Congo	CG	-4.258899000000	15.251139000000	XAF
7108	Bajpe Airport	Mangalore	IXE		India	IN	12.963543000000	74.890141000000	INR
7109	Humberside Airport	Humberside	HUY		United Kingdom	GB	53.583378000000	-0.348510000000	GBP
7110	Youngstown Warren Regional Airport	Vienna	YNG		United States	US	41.256110000000	-80.669720000000	USD
7111	Colonsay	Colonsay	CSA		United Kingdom	GB	56.057778000000	-6.243056000000	GBP
7112	Burgos Rail Station	Burgos Rail Station	UGR		Spain	ES	42.370833000000	-3.666111000000	EUR
7113	A Coruna Rail Stn	A Coruna Rail Stn	YJC		Spain	ES	43.352778000000	-8.410556000000	EUR
7114	Penza	Penza	PEZ		Russian Federation	RU	53.110556000000	45.021389000000	RUB
7115	Ras An Naqb	Ras An Naqb	RAF		Egypt	EG	-31.282500000000	-61.501667000000	EGP
7116	Bhairawa	Bhairawa	BWA		Nepal	NP	27.505833000000	83.416389000000	NPR
7117	Melbourne Avalon Airport	Melbourne (AU)	AVV		Australia	AU	-38.039444000000	144.469444000000	AUD
7118	Palmerston North	Palmerston North	PMR		New Zealand	NZ	-40.320000000000	175.613611000000	NZD
7119	Santo Antao	Santo Antao	NTO		Cape Verde	CV	17.050000000000	-25.166667000000	CVE
7120	Kokomo	Kokomo	OKK		USA	US	40.533333000000	-86.066667000000	USD
7121	Cold Lake	Cold Lake	YOD		Canada	CA	54.450000000000	-110.166667000000	CAD
7122	Dubai Airport	Dubai	DXB		United Arab Emirates	AE	25.248664000000	55.352916000000	AED
7123	Coastal Carolina Regional Airport	New Bern	EWN		United States	US	35.078342000000	-77.034620000000	USD
7124	Pamplona Rail Station	Pamplona Rail Station	EEP		Spain	ES	42.825278000000	-1.661667000000	EUR
7125	Lorca Bus Station	Lorca Bus Station	XJR		Spain	ES	37.671111000000	-1.696667000000	EUR
7126	Jacareacanga	Jacareacanga	JCR		Brazil	BR	-6.233611000000	-57.768333000000	BRL
7127	Bodaybo	Bodaybo	ODO		Russian Federation	RU	57.866389000000	114.242222000000	RUB
7128	Long Pasia	Long Pasia	GSA		Malaysia	MY	5.333333000000	117.166667000000	MYR
7129	Lumi	Lumi	LMI		Papua New Guinea	PG	-3.483333000000	142.033333000000	PGK
7130	Magdalena	Magdalena	MGD		Bolivia	BO	-13.033333000000	-64.416667000000	BOB
7131	Killeen Municipal Apt	Killeen	ILE		USA	US	31.085000000000	-97.686667000000	USD
7132	Brantford Rail Station	Brantford Rail Station	XFV		Canada	CA	43.146667000000	-80.265833000000	CAD
7133	Tallinn Airport	Tallinn	TLL		Estonia	EE	59.416622000000	24.798703000000	EEK
7134	Metropolitan Area	Moncton	YQM		Canada	CA	46.104776000000	-64.681227000000	CAD
7135	Seeb Airport	Muscat	MCT		Oman	OM	23.588078000000	58.290218000000	OMR
7136	Fort St. John Airport	Fort St. John	YXJ		Canada	CA	56.247883000000	-120.734370000000	CAD
7137	Kiwayu	Kiwayu	KWY		Kenya	KE	-2.016667000000	41.266667000000	KES
7138	Dover Rail Station	Dover Rail Station	QQD		United Kingdom	GB	51.133333000000	1.316667000000	GBP
7139	Stockport Rail Station	Stockport Rail Station	XVA		United Kingdom	GB	53.416667000000	-2.166667000000	GBP
7140	Frutillar	Frutillar	FRT		Chile	CL	-41.125000000000	-73.065278000000	CLP
7141	Matsumoto	Matsumoto	MMJ		Japan	JP	36.166667000000	137.922778000000	JPY
7142	Cagayan de Oro	Cagayan de Oro	CGY		Philippines	PH	8.612500000000	124.456944000000	PHP
7143	Ioma	Ioma	IOP		Papua New Guinea	PG	-8.366667000000	147.850000000000	PGK
7144	Skiplane Scenic	Skiplane Scenic	XXS		New Zealand	NZ	-36.872222000000	174.772222000000	NZD
7145	Elfin Cove	Elfin Cove	ELV		USA	US	58.195278000000	-136.347500000000	USD
7146	Twin Hills	Twin Hills	TWA		USA	US	59.073889000000	-160.275556000000	USD
7147	Princeton Rail Station	Princeton Rail Station	ZZR		USA	US	40.333333000000	-74.650000000000	USD
7148	Truk Airport	Truk, Caroline Islands	TKK		Micronesia	FM	7.457446000000	151.842005000000	USD
7149	Falls International Airport	International Falls	INL		United States	US	48.563056000000	-93.404167000000	USD
7150	Gino Lisa Airport	Foggia	FOG		Italy	IT	41.433990000000	15.544367000000	EUR
7151	East Texas Regional Airport	Longview	GGG		United States	US	32.386665000000	-94.715280000000	USD
7152	Bremerhaven	Bremerhaven	BRV		Germany	DE	53.506944000000	8.572778000000	EUR
7153	Schwerin	Schwerin	SZW		Germany	DE	53.433333000000	11.783333000000	EUR
7154	Ostrava Rail Station	Ostrava Rail Station	XJV		Czech Republic	CZ	49.850833000000	18.267500000000	CZK
7155	Hualien	Hualien	HUN		Chinese Taipei	TW	24.023056000000	121.617778000000	TWD
7156	Pokhara	Pokhara	PKR		Nepal	NP	28.200556000000	83.981389000000	NPR
7157	Argyle	Argyle	GYL		Australia	AU	-16.636111000000	128.450278000000	AUD
7158	Cabimas	Cabimas	CBS		Venezuela	VE	10.331944000000	-71.320000000000	VEB
7159	Great Bend	Great Bend	GBD		USA	US	38.350000000000	-98.866667000000	USD
7160	Labouchere Bay	Labouchere Bay	WLB		USA	US	56.291667000000	-133.658333000000	USD
7161	Le Touquet-Paris-Plage	Le Touquet-Paris-Plage	LTQ		France	FR	50.514722000000	1.627500000000	EUR
7162	Bristol Temple Meads Railway Station	Bristol	TPB		United Kingdom	GB	51.449000000000	-2.580000000000	GBP
7163	Bath Rail Station	Bath Rail Station	QQX		United Kingdom	GB	51.383333000000	-2.366667000000	GBP
7164	Utrecht Central Rail Station	Utrecht	ZYU		Netherlands	NL	52.083333000000	5.133333000000	EUR
7165	Mecheria	Mecheria	MZW		Algeria	DZ	33.535833000000	-0.242500000000	DZD
7166	Biratnagar	Biratnagar	BIR		Nepal	NP	26.482500000000	87.266667000000	NPR
7167	Ranong	Ranong	UNN		Thailand	TH	9.777500000000	98.585556000000	THB
7168	Maota Savail Is	Maota Savail Is	MXS		Samoa	WS	-13.738889000000	-172.255000000000	WST
7169	Talara	Talara	TYL		Peru	PE	-4.576667000000	-81.254167000000	PEN
7170	Kipnuk	Kipnuk	KPN		USA	US	59.935278000000	-164.031944000000	USD
7171	Courtenay	Courtenay	YCA		Canada	CA	49.679167000000	-124.981111000000	CAD
7172	Aur Island	Aur Island	AUL		Marshall Islands	MH	8.133333000000	171.166667000000	USD
7173	Solomon	Solomon	SLJ		Australia	AU	-22.255556000000	117.762778000000	AUD
7174	Atka	Atka	AKB		USA	US	52.218333000000	-174.206389000000	USD
7175	Port Heiden	Port Heiden	PTH		USA	US	56.957222000000	-158.637222000000	USD
7176	Sanikiluaq	Sanikiluaq	YSK		Canada	CA	56.536944000000	-79.250000000000	CAD
7177	Umea Airport	Umea	UME		Sweden	SE	63.793332000000	20.289539000000	SEK
7178	Ramon Villeda Morales Airport	San Pedro Sula	SAP		Honduras	HN	15.456245000000	-87.927796000000	HNL
7179	Baghdad International Airport	Baghdad	BGW		Iraq	IQ	33.255556000000	44.225000000000	NID
7180	La Desirade	La Desirade	DSD		Guadeloupe	GP	16.333333000000	-61.016667000000	EUR
7181	Cologne/Bonn, Bonn HBF Rail Station	Cologne/Bonn	BNJ		Germany	DE	50.733333000000	7.100000000000	EUR
7182	Penzance	Penzance	PZE		United Kingdom	GB	50.128056000000	-5.518611000000	GBP
7183	Westray	Westray	WRY		United Kingdom	GB	59.350278000000	-2.950000000000	GBP
7184	Peterborough Rail Station	Peterborough Rail Station	XVH		United Kingdom	GB	52.583333000000	-1.250000000000	GBP
7185	Bratislava Bus Station	Bratislava	ZRG		Slovakia	SK	48.166667000000	17.219444000000	EUR
7186	Dali	Dali	DLU		China	CN	25.650278000000	100.319444000000	RMB
7187	Jaffna	Jaffna	JAF		Sri Lanka	LK	9.792222000000	80.070000000000	LKR
7188	Atuona	Atuona	AUQ		French Polynesia	PF	-9.768889000000	-139.011389000000	XPF
7189	Puka Puka	Puka Puka	PKP		French Polynesia	PF	-14.809444000000	-138.812778000000	XPF
7190	Nouadhibou	Nouadhibou	NDB		Mauritania	MR	20.933056000000	-17.030000000000	MRO
7191	Kobuk	Kobuk	OBU		USA	US	66.912500000000	-156.898333000000	USD
7192	Natuashish	Natuashish	YNP		Canada	CA	55.913889000000	-61.184444000000	CAD
7193	Sabiha Gokcen	Istanbul	SAW		Turkey	TR	40.904676000000	29.309188000000	USD
7194	Eurico Sales Airport	Vitoria	VIX		Brazil	BR	-20.256809000000	-40.289567000000	BRL
7195	Bromma Airport	Stockholm	BMA		Sweden	SE	59.355660000000	17.946080000000	SEK
7196	Minatitlan	Minatitlan	MTT		Mexico	MX	18.103333000000	-94.580556000000	MXN
7197	Shetland Islands Lerwick/Tingwall Apt	Shetland Islands	LWK		United Kingdom	GB	60.192222000000	-1.243611000000	GBP
7198	San Domino Island	San Domino Island	TQR		Italy	IT	42.119444000000	15.502500000000	EUR
7199	Bahia Blanca	Bahia Blanca	BHI		Argentina	AR	-38.727222000000	-62.153333000000	ARS
7200	Misawa	Misawa	MSJ		Japan	JP	40.703333000000	141.368333000000	JPY
7201	Culion	Culion	CUJ		Philippines	PH	11.883333000000	120.016667000000	PHP
7202	Lockhart River	Lockhart River	IRG		Australia	AU	-12.786944000000	143.304722000000	AUD
7203	Chigorodo	Chigorodo	IGO		Colombia	CO	7.685000000000	-76.694722000000	COP
7204	Ukkusissat	Ukkusissat	JUK		Greenland	GL	71.055278000000	-51.883611000000	DKK
7205	Qualicum	Qualicum	XQU		Canada	CA	49.337500000000	-124.394167000000	CAD
7206	Bellegarde Airport	Limoges	LIG		France	FR	45.862179000000	1.176245000000	EUR
7207	Birmingham International Airport	Birmingham	BHX		United Kingdom	GB	52.452518000000	-1.733256000000	GBP
7208	Marseille St Charles Rail Stn	Marseille	XRF		France	FR	43.302778000000	5.380833000000	EUR
7209	London Gatwick Airport	London	LGW		United Kingdom	GB	51.156807000000	-0.161863000000	GBP
7210	Los Cabos Airport	San Jose Cabo	SJD		Mexico	MX	23.162354000000	-109.717283000000	MXN
7211	Cardak Airport	Denizli	DNZ		Turkey	TR	37.787224000000	29.703333000000	USD
7212	Virgin Gorda	Virgin Gorda	VIJ		Virgin Islands, British	VG	18.446111000000	-64.428056000000	USD
7213	Braganca	Braganca	BGC		Portugal	PT	41.858056000000	-6.707222000000	EUR
7214	San Sebastian Rail Station	San Sebastian Rail Station	YJH		Spain	ES	43.318056000000	-1.976944000000	EUR
7215	Rincon de Los Sauces	Rincon de Los Sauces	RDS		Argentina	AR	-37.383333000000	-68.900000000000	ARS
7216	Windhoek Eros Apt	Windhoek	ERS		Namibia	NA	-22.612222000000	17.080556000000	NAD
7217	Naga	Naga	WNP		Philippines	PH	13.585000000000	123.270278000000	PHP
7218	Poum	Poum	PUV		New Caledonia	NC	-20.250000000000	164.050000000000	XPF
7219	Parakou	Parakou	PKO		Benin	BJ	9.350000000000	2.616667000000	XOF
7220	Attu	Attu	QGQ		Greenland	GL	67.941111000000	-53.617222000000	DKK
7221	Timmins	Timmins	YTS		Canada	CA	48.569722000000	-81.376667000000	CAD
7222	Malaga Airport	Malaga	AGP		Spain and Canary Islands	ES	36.675181000000	-4.489616000000	EUR
7223	Ixtapa/Zihuatanejo Internacional Airport	Ixtapa/Zihuatanejo	ZIH		Mexico	MX	17.606782000000	-101.464062000000	MXN
7224	Nadi International Airport	Nadi	NAN		Fiji	FJ	-17.753270000000	177.451607000000	FJD
7225	Muskegon County Airport	Muskegon	MKG		United States	US	43.170555000000	-86.237500000000	USD
7226	Almeria Rail Station	Almeria Rail Station	AMR		Spain	ES	36.834722000000	-2.456389000000	EUR
7227	Papa Westray	Papa Westray	PPW		United Kingdom	GB	59.351389000000	-2.900000000000	GBP
7228	Herrljunga Rail Station	Herrljunga Rail Station	XYC		Sweden	SE	58.078889000000	13.021389000000	SEK
7229	Teresina	Teresina	THE		Brazil	BR	-5.060000000000	-42.823611000000	BRL
7230	Zhangjiakou	Zhangjiakou	ZQZ		China	CN	40.739167000000	114.930833000000	RMB
7231	Tanahmerah	Tanahmerah	TMH		Indonesia	ID	-6.083333000000	140.283333000000	IDR
7232	Margaret River	Margaret River	MQZ		Australia	AU	-33.950000000000	115.066667000000	AUD
7233	Carnot	Carnot	CRF		Central African Republic	CF	4.933333000000	15.900000000000	XAF
7234	Lawrenceville	Lawrenceville	LZU		USA	US	33.978056000000	-83.962222000000	USD
7235	Kingston Norman Rogers Apt	Kingston (CA)	YGK		Canada	CA	44.225278000000	-76.596944000000	CAD
7236	Sud Corse Airport	Figari	FSC		France	FR	41.498633000000	9.098223000000	EUR
7237	 Martinique Aime Cesaire Airport	Fort De France	FDF		Martinique	MQ	14.596061000000	-60.999948000000	EUR
7238	Krabi Airport	Krabi	KBV		Thailand	TH	8.097281000000	98.980619000000	THB
7239	Columbia Regional Airport	Columbia	COU		United States	US	38.813610000000	-92.219170000000	USD
7240	Albacete	Albacete	ABC		Spain	ES	38.948611000000	-1.863611000000	EUR
7241	Nuneaton Rail Station	Nuneaton Rail Station	XNV		United Kingdom	GB	52.526111000000	-1.464722000000	GBP
7242	Stoke On Trent Rail Station	Stoke On Trent Rail Station	XWH		United Kingdom	GB	53.000000000000	-2.166667000000	GBP
7243	El Calafate	El Calafate	FTE		Argentina	AR	-50.280000000000	-72.053333000000	ARS
7244	Miyako Jima	Miyako Jima	MMY		Japan	JP	24.782778000000	125.295000000000	JPY
7245	Chumphon	Chumphon	CJM		Thailand	TH	10.711389000000	99.361667000000	THB
7246	Ipota	Ipota	IPA		Vanuatu	VU	-18.855833000000	169.282778000000	VUV
7247	Ibague	Ibague	IBE		Colombia	CO	4.421111000000	-75.133611000000	COP
7248	Holland	Holland	HLM		USA	US	42.783333000000	-86.116667000000	USD
7249	Ottawa Rail Station	Ottawa	XDS		Canada	CA	45.319444000000	-75.669444000000	CAD
7250	Poitiers Rail Station	Poitiers	XOP		France	FR	46.582222000000	0.333056000000	EUR
7251	Zanderij International Airport	Paramaribo	PBM		Suriname	SR	5.451389000000	-55.191111000000	SRG
7252	Vila Real Airport	Vila Real	VRL		Portugal	PT	41.300000000000	-7.750000000000	EUR
7253	Punta Gorda (BZ)	Punta Gorda (BZ)	PND		Belize	BZ	16.102222000000	-88.808333000000	BZD
7254	Wilhelmshaven	Wilhelmshaven	WVN		Germany	DE	53.504722000000	8.053333000000	EUR
7255	Colonia	Colonia	CYR		Uruguay	UY	-34.166667000000	-57.500000000000	UYU
7256	Ling Ling	Ling Ling	LLF		China	CN	26.700833000000	111.957500000000	RMB
7257	Jolo	Jolo	JOL		Philippines	PH	6.053611000000	121.011111000000	PHP
7258	Kamina	Kamina	KMF		Papua New Guinea	PG	-7.250000000000	145.533333000000	PGK
7259	Cumana	Cumana	CUM		Venezuela	VE	10.450278000000	-64.130556000000	VEB
7260	Grand Rapids (US) MN	Grand Rapids (US) MN	GPZ		USA	US	47.208611000000	-93.511111000000	USD
7261	Noatak	Noatak	WTK		USA	US	67.566111000000	-162.974722000000	USD
7262	Kalaeloa Airport	Kapolei	JRF		USA	US	21.310984000000	-158.079900000000	USD
7263	Dakhla Airport	Dakhla	VIL		Morocco	MA	23.713333000000	-15.935000000000	MAD
7264	Tribhuvan Airport	Kathmandu	KTM		Nepal	NP	27.699906000000	85.356570000000	NPR
7265	Boise Air Terminal	Boise	BOI		United States	US	43.569263000000	-116.221930000000	USD
7266	Jinka	Jinka	BCO		Ethiopia	ET	5.833333000000	36.616667000000	ETB
7267	Holyhead	Holyhead	HLY		United Kingdom	GB	53.316667000000	-4.633333000000	GBP
7268	Baden Baden Rail Station	Karlsruhe/Baden-Baden	ZCC		Germany	DE	48.750000000000	8.250000000000	EUR
7269	Qaisumah	Qaisumah	AQI		Saudi Arabia	SA	28.335278000000	46.125000000000	SAR
7270	Chimoio	Chimoio	VPY		Mozambique	MZ	-19.151389000000	33.428889000000	MZM
7271	Abemama Atoll	Abemama Atoll	AEA		Kiribati	KI	0.483333000000	173.850000000000	AUD
7272	Nukutavake	Nukutavake	NUK		French Polynesia	PF	-19.285000000000	-138.769722000000	XPF
7273	Benin City	Benin City	BNI		Nigeria	NG	6.316944000000	5.599444000000	NGN
7274	West Palm Beach County Apt	West Palm Beach	LNA		USA	US	26.586111000000	-80.083333000000	USD
7275	Amos	Amos	YEY		Canada	CA	48.583333000000	-78.116667000000	CAD
7276	Rovaniemi Airport	Rovaniemi	RVN		Finland	FI	66.559047000000	25.829609000000	EUR
7277	South Padre Island International Airport	Brownsville	BRO		United States	US	25.908889000000	-97.423333000000	USD
7278	Alderney Airport	Alderney	ACI		United Kingdom	GB	49.709347000000	-2.215369000000	GBP
7279	Humberside Airport	Humberside	HUY		United Kingdom	GB	53.583378000000	-0.348510000000	GBP
7280	Zaisan	Zaisan	SZI		Kazakhstan	KZ	47.050000000000	84.116667000000	KZT
7281	Colonsay	Colonsay	CSA		United Kingdom	GB	56.057778000000	-6.243056000000	GBP
7282	Stafford Rail Station	Stafford Rail Station	XVB		United Kingdom	GB	52.800000000000	-2.116667000000	GBP
7283	London Liverpool Street Rail Station	London Liverpool Street Rail Station	ZLS		United Kingdom	GB	51.518056000000	-0.082778000000	GBP
7284	La Serena	La Serena	LSC		Chile	CL	-29.916389000000	-71.199444000000	CLP
7285	Altai	Altai	LTI		Mongolia	MN	46.376667000000	96.221944000000	MNT
7286	Bislig	Bislig	BPH		Philippines	PH	8.200000000000	126.333333000000	PHP
7287	Fakarava	Fakarava	FAV		French Polynesia	PF	-16.054167000000	-145.656944000000	XPF
7288	Wasum	Wasum	WUM		Papua New Guinea	PG	-6.050000000000	149.333333000000	PGK
7289	Diavik	Diavik	DVK		Canada	CA	64.511389000000	-110.289444000000	CAD
7290	Tokeen	Tokeen	TKI		USA	US	55.937500000000	-133.325000000000	USD
7291	New Haven Rail Station	New Haven Rail Station	ZVE		USA	US	41.297778000000	-72.926944000000	USD
\.


--
-- Name: airport_currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('airport_currencies_id_seq', 7291, true);


--
-- Data for Name: airports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY airports (id, code, name, city, lat, long, slug) FROM stdin;
290	MNL	Manila Ninoy Aquino International Apt	Manila	14.508647	121.019581	mnl
19	FAO	Faro	Faro	37.014425	-7.965911	fao
63	FCO	Rome Fiumicino Apt	Rome (IT)	41.804475	12.250797	fco
256	LCJ	Lodz Wladyslaw Reymont	Lodz	51.721881	19.398133	lcj
500	PQC	Phuquoc	Phuquoc	\N	\N	pqc
505	CDT	Castellon de la Plana	Castellon de la Plana	\N	\N	cdt
203	FEZ	Fes	Fes	33.927261	-4.977958	fez
12	FMM	Memmingen	Memmingen	47.988758	10.239500	fmm
377	FNC	Funchal	Funchal	32.697889	-16.774453	fnc
110	IST	Istanbul Ataturk Airport	Istanbul	40.976922	28.814606	ist
499	ISU	Sulaymaniyah	Sulaymaniyah	35.560800	45.314700	isu
304	KNO	Medan Kuala Namu	Medan	51.322200	3.293060	kno
327	KRR	Krasnodar	Krasnodar	45.034689	39.170539	krr
467	KTT	Kittila	Kittila	67.701022	24.846850	ktt
259	KTW	Katowice	Katowice	50.474253	19.080019	ktw
351	KUF	Samara	\N	53.500000	50.150000	kuf
295	KUL	Kuala Lumpur International Airport	Kuala Lumpur	2.745578	101.709917	kul
235	KUN	Kaunas	Kaunas	54.963919	24.084778	kun
501	ILO	Ilo-Ilo	Ilo-Ilo	\N	\N	ilo
502	CRK	Angeles/Mabalacat	Angeles/Mabalacat	\N	\N	crk
86	AHO	Alghero	Alghero	40.632133	8.290772	aho
91	ATL	Atlanta Hartsfield-jackson Intl Apt	Atlanta	33.636719	-84.428067	atl
92	AUH	Abu Dhabi International Apt	Abu Dhabi	24.432972	54.651138	auh
486	AUS	Austin-Bergstrom International Apt	Austin	30.194528	-97.669889	aus
344	AYT	Antalya	Antalya	36.898731	30.800461	ayt
322	BAH	Bahrain	Bahrain	26.270834	50.633610	bah
45	BCN	Barcelona Apt	Barcelona (ES)	41.297078	2.078464	bcn
81	BDS	Brindisi	Brindisi	40.657633	17.947033	bds
115	BEM	Beni Mellal	Beni Mellal	32.396072	-6.326653	bem
488	KVA	Kavala	Kavala	40.913306	24.619223	kva
360	KZN	Kazan	\N	55.606186	49.278728	kzn
164	LAS	Las Vegas McCarran International Apt	Las Vegas	36.080056	-115.152250	las
337	LAX	Los Angeles International Apt	Los Angeles	33.942536	-118.408075	lax
167	LBA	Leeds Bradford	Leeds Bradford	53.865897	-1.660569	lba
275	LBC	Hamburg Luebeck-Blankensee Airport	Hamburg	53.805367	10.719222	lbc
139	LCA	Larnaca	Larnaca	34.875117	33.624850	lca
362	LCG	A Coruna	\N	43.302061	-8.377256	lcg
507	CHC	Christchurch	Christchurch	\N	\N	chc
246	BSL	Basel	Basel/Mulhouse	47.590000	7.529167	bsl
429	CEI	Chiang Rai	Chiang Rai	19.952342	99.882928	cei
83	CFU	Kerkyra	Kerkyra	39.601944	19.911667	cfu
202	CIY	Comiso	Comiso	37.000000	14.614400	ciy
62	DEL	Delhi	Delhi	28.566500	77.103088	del
301	DRW	Darwin International	Darwin	-12.408333	130.872660	drw
254	DTM	Dortmund	Dortmund	51.518314	7.612242	dtm
69	DUS	Duesseldorf International Airport	Duesseldorf	51.289453	6.766775	dus
38	DXB	Dubai International	Dubai	25.252778	55.364444	dxb
354	EAS	San Sebastian	\N	43.356519	-1.790611	eas
498	EBL	Erbil	Erbil	36.237611	43.963158	ebl
5	EDI	Edinburgh	Edinburgh	55.950000	-3.372500	edi
138	EFL	Kefallinia	Kefallinia	38.120069	20.500481	efl
248	EGC	Bergerac	Bergerac	44.825279	0.518611	egc
176	EMA	Nottingham East Midlands Airport	Nottingham	52.831111	-1.328056	ema
2	LCY	London City Apt	London (GB)	51.505278	0.055278	lcy
271	LDE	Lourdes/Tarbes	Lourdes/Tarbes	43.178675	-0.006439	lde
245	LDY	Derry	Derry	55.042778	-7.161111	ldy
326	EVN	Yerevan	Yerevan	40.147275	44.395881	evn
369	EZE	Buenos Aires Ministro Pistarini	\N	-34.822222	-58.535833	eze
117	LED	St Petersburg Pulkovo Apt	St Petersburg	59.800292	30.262503	led
243	LEI	Almeria	Almeria	36.843936	-2.370097	lei
227	LEJ	Leipzig/Halle	Leipzig/Halle	51.432447	12.241633	lej
356	LEN	Leon	\N	42.589000	-5.655556	len
9	LGW	London Gatwick Apt	London (GB)	51.148056	-0.190278	lgw
497	NAT	Natal	Natal	-5.911417	-35.247717	nat
463	NWI	Norwich	Norwich	52.675833	1.282778	nwi
22	ORD	Chicago O'Hare International Apt	Chicago	41.978603	-87.904842	ord
40	PEK	Beijing Capital Intl Apt	Beijing	40.080111	116.584556	pek
211	PIK	Glasgow Prestwick Apt	Glasgow (GB)	55.509444	-4.586667	pik
378	RMI	Rimini	\N	44.020292	12.611747	rmi
163	SEA	Seattle-Tacoma International Apt	Seattle	47.449000	-122.309306	sea
29	SXF	Berlin Schoenefeld Apt	Berlin	52.380001	13.522500	sxf
503	CEB	Cebu	Cebu	\N	\N	ceb
504	KHH	Kaohsiung	Kaohsiung	\N	\N	khh
13	KRK	Krakow John Paul II - Balice	Krakow	50.077731	19.784836	krk
508	PBO	Paraburdoo	Paraburdoo	\N	\N	pbo
509	WLG	Wellington	Wellington	\N	\N	wlg
510	TMW	Tamworth	Tamworth	\N	\N	tmw
511	NTL	Newcastle Williamtown Apt	Newcastle (AU)	\N	\N	ntl
512	PPP	Proserpine	Proserpine	\N	\N	ppp
513	CFS	Coffs Harbour	Coffs Harbour	\N	\N	cfs
514	ZQN	Queenstown	Queenstown	\N	\N	zqn
515	BNK	Ballina	Ballina	\N	\N	bnk
516	LST	Launceston	Launceston	\N	\N	lst
517	ABX	Albury	Albury	\N	\N	abx
518	PQQ	Port Macquarie	Port Macquarie	\N	\N	pqq
519	CBR	Canberra	Canberra	\N	\N	cbr
520	DUD	Dunedin	Dunedin	\N	\N	dud
521	ROK	Rockhampton	Rockhampton	\N	\N	rok
522	GYL	Argyle	Argyle	\N	\N	gyl
523	EMD	Emerald	Emerald	\N	\N	emd
524	ISA	Mount Isa	Mount Isa	\N	\N	isa
251	AOI	Ancona	Ancona	43.616389	13.362222	aoi
36	BEG	Belgrade	Belgrade	44.818444	20.309139	beg
207	BES	Brest (FR)	Brest (FR)	48.447911	-4.418539	bes
50	BEY	Beirut	Beirut	33.820931	35.488389	bey
342	BFS	Belfast International Apt	Belfast	54.657500	-6.215833	bfs
438	BFV	Buriram	Buriram	15.229539	103.253231	bfv
339	BGI	Barbados	Barbados	13.074603	-59.492456	bgi
328	BGO	Bergen	Bergen	60.293386	5.218142	bgo
169	BGY	Milan Bergamo/orio al Serio Apt	Milan	45.673889	9.704166	bgy
458	BHD	Belfast George Best City Apt	Belfast	54.618056	-5.872500	bhd
31	BHX	Birmingham Airport	Birmingham (GB)	52.453856	-1.748028	bhx
506	MUH	Mersa Matruh	Mersa Matruh	\N	\N	muh
10	ACE	Lanzarote	Lanzarote	28.945464	-13.605225	ace
525	HTI	Hamilton Island	Hamilton Island	\N	\N	hti
526	CNS	Cairns	Cairns	\N	\N	cns
527	HBA	Hobart	Hobart	\N	\N	hba
528	VLI	Port Vila	Port Vila	\N	\N	vli
529	ADL	Adelaide International	Adelaide	\N	\N	adl
341	ANU	\N	\N	17.136749	-61.792667	anu
343	BIA	Bastia	Bastia	42.552664	9.483731	bia
146	BIO	Bilbao	Bilbao	43.301097	-2.910608	bio
181	BIQ	Biarritz	Biarritz	43.468419	-1.523325	biq
384	BJL	Banjul	Banjul	13.337961	-16.652206	bjl
153	CYO	Cayo Largo del Sur	Cayo Largo del Sur	21.616453	-81.545989	cyo
530	AKL	Auckland International Apt	Auckland	\N	\N	akl
531	MKY	Mackay	Mackay	\N	\N	mky
532	BME	Broome	Broome	\N	\N	bme
533	MCY	Sunshine Coast	Sunshine Coast	\N	\N	mcy
534	TSV	Townsville	Townsville	\N	\N	tsv
535	HVB	Hervey Bay	Hervey Bay	\N	\N	hvb
536	ASP	Alice Springs Airport	Alice Springs	\N	\N	asp
537	MQL	Mildura	Mildura	\N	\N	mql
538	AYQ	Ayers Rock	Ayers Rock	\N	\N	ayq
396	BJV	Bodrum Milas Airport	Bodrum	37.249000	27.667000	bjv
390	BJZ	Badajoz	\N	38.891250	-6.821333	bjz
135	BKK	Bangkok Suvarnabhumi International Apt	Bangkok	13.681108	100.747283	bkk
226	BLL	Billund	Billund	55.740322	9.151778	bll
192	BLQ	Bologna Guglielmo Marconi	Bologna	44.535444	11.288667	blq
425	BLR	Bengaluru	Bengaluru	12.949986	77.668206	blr
454	BNE	Brisbane	Brisbane	-27.384167	153.117500	bne
37	BOD	Bordeaux Merignac Apt	Bordeaux	44.828335	-0.715556	bod
386	BOG	Bogota	\N	4.701594	-74.146947	bog
206	BOH	Bournemouth	Bournemouth	50.780000	-1.842500	boh
482	BOJ	Burgas	Burgas	42.569583	27.515236	boj
539	TBU	Nuku'alofa	Nuku'alofa	\N	\N	tbu
540	MOV	Moranbah	Moranbah	\N	\N	mov
541	BDB	Bundaberg	Bundaberg	\N	\N	bdb
542	GLT	Gladstone	Gladstone	\N	\N	glt
543	RAR	Rarotonga Island	Rarotonga Island	\N	\N	rar
305	BOM	Mumbai	Mumbai	19.088686	72.867919	bom
23	BOS	Boston Logan International Apt	Boston	42.364347	-71.005181	bos
544	KTA	Karratha	Karratha	\N	\N	kta
545	NAN	Nadi	Nadi	\N	\N	nan
546	PHE	Port Hedland	Port Hedland	\N	\N	phe
547	KGI	Kalgoorlie-Boulder	Kalgoorlie-Boulder	\N	\N	kgi
548	HIR	Honiara	Honiara	\N	\N	hir
549	ZNE	Newman	Newman	\N	\N	zne
550	POM	Port Moresby	Port Moresby	\N	\N	pom
188	BRE	Bremen	Bremen	53.047500	8.786667	bre
79	BRI	Bari	Bari	41.138856	16.760594	bri
213	CCF	Carcassonne	Carcassonne	43.215978	2.306317	ccf
293	CGK	Jakarta Soekarno-Hatta Apt	Jakarta	-6.125567	106.655897	cgk
194	CHQ	Chania	Chania	35.531747	24.149678	chq
366	CLJ	Cluj-Napoca	\N	46.785167	23.686167	clj
101	CMN	Casablanca Mohammed V Apt	Casablanca	33.367467	-7.589967	cmn
84	CPH	Copenhagen Kastrup Apt	Copenhagen	55.617917	12.655972	cph
551	XCH	Christmas Island	Christmas Island	\N	\N	xch
388	CRA	Craiova	\N	44.318139	23.888611	cra
552	CCK	Cocos Islands	Cocos Islands	\N	\N	cck
186	CRL	Brussels S. Charleroi Airport	Brussels	50.459197	4.453817	crl
258	CUF	Cuneo	Cuneo	44.547019	7.623217	cuf
107	CUN	Cancun	Cancun	21.036528	-86.877083	cun
358	CWL	Cardiff (GB) 00	Cardiff (GB) 00	51.396667	-3.343333	cwl
75	DBV	Dubrovnik	Dubrovnik	42.561353	18.268244	dbv
161	DFW	Dallas/Fort Worth International Apt	Dallas/Fort Worth	32.896828	-97.037997	dfw
104	DJE	Djerba	Djerba	33.875031	10.775461	dje
134	DKR	Dakar	Dakar	14.739708	-17.490225	dkr
249	DLE	Dole	Dole	47.039014	5.427250	dle
345	DLM	Dalaman	Dalaman	36.713056	28.792500	dlm
234	DNR	Dinard/St-Malo	Dinard/St-Malo	48.587683	-2.079958	dnr
119	DOH	Doha	Doha	25.261125	51.565056	doh
14	DUB	Dublin	Dublin	53.421333	-6.270075	dub
553	BHS	Bathurst (AU)	Bathurst (AU)	\N	\N	bhs
554	OCM	Boolgeeda	Boolgeeda	\N	\N	ocm
555	ONS	Onslow	Onslow	\N	\N	ons
556	ALH	Albany	Albany	\N	\N	alh
557	DCN	Derby	Derby	\N	\N	dcn
558	EPR	Esperance	Esperance	\N	\N	epr
559	GET	Geraldton	Geraldton	\N	\N	get
560	KNX	Kununurra	Kununurra	\N	\N	knx
561	RVT	Ravensthorpe	Ravensthorpe	\N	\N	rvt
562	CNJ	Cloncurry	Cloncurry	\N	\N	cnj
563	CJF	Coondewanna	Coondewanna	\N	\N	cjf
564	APW	Apia Faleolo Apt	Apia	\N	\N	apw
565	BYP	Barimunya	Barimunya	\N	\N	byp
566	WLE	Miles	Miles	\N	\N	wle
567	BQB	Busselton	Busselton	\N	\N	bqb
568	CVQ	Carnarvon	Carnarvon	\N	\N	cvq
569	WLP	West Angelas	West Angelas	\N	\N	wlp
570	WWI	Woodie Woodie	Woodie Woodie	\N	\N	wwi
571	NIF	Nifty	Nifty	\N	\N	nif
572	WRN	Windarling	Windarling	\N	\N	wrn
150	GDN	Gdansk Lech Walesa	Gdansk	54.377569	18.466222	gdn
193	GRO	Girona Costa Brava Apt	Girona	41.900969	2.760547	gro
573	HFE	Hefei	Hefei	\N	\N	hfe
574	CAN	Guangzhou	Guangzhou	\N	\N	can
398	AJA	Ajaccio	Ajaccio	41.923637	8.802917	aja
66	AMS	Amsterdam	Amsterdam	52.308613	4.763889	ams
99	CAI	Cairo	Cairo	30.121944	31.405556	cai
575	TRZ	Tiruchchirappalli	Tiruchchirappalli	\N	\N	trz
576	DAC	Dhaka	Dhaka	\N	\N	dac
577	COK	Kochi (IN)	Kochi (IN)	\N	\N	cok
118	CGN	Cologne/Bonn Apt	Cologne/Bonn	50.865917	7.142744	cgn
578	NNG	Nanning	Nanning	\N	\N	nng
605	USM	Ko Samui	Ko Samui	\N	\N	usm
580	SZX	Shenzhen	Shenzhen	\N	\N	szx
581	IPH	Ipoh	Ipoh	\N	\N	iph
582	MFM	Macau (MO) 00	Macau (MO) 00	\N	\N	mfm
583	KLO	Kalibo	Kalibo	\N	\N	klo
584	LGK	Langkawi	Langkawi	\N	\N	lgk
585	NGB	Ningbo	Ningbo	\N	\N	ngb
168	CIA	Rome Ciampino Apt	Rome (IT)	41.799361	12.594936	cia
586	TNA	Jinan	Jinan	\N	\N	tna
587	XIY	Xi'an Xianyang Apt	Xi'an	\N	\N	xiy
430	CNX	Chiang Mai	Chiang Mai	18.766847	98.962644	cnx
216	EBU	St-etienne	St-etienne	45.540554	4.296389	ebu
255	ESU	Essaouira	Essaouira	31.397500	-9.681667	esu
383	FAE	Faroe Islands	\N	62.063628	-7.277219	fae
473	FDH	Friedrichshafen	Friedrichshafen	47.671317	9.511486	fdh
336	FLL	\N	\N	26.072583	-80.152750	fll
363	FLR	Florence Amerigo Vespucci	\N	43.809953	11.205100	flr
280	FMO	Muenster/Osnabrueck	Muenster/Osnabrueck	52.134642	7.684831	fmo
149	FOR	Fortaleza	Fortaleza	-3.776283	-38.532556	for
100	FRA	Frankfurt International Apt	Frankfurt	50.026421	8.543125	fra
197	FSC	Figari	Figari	41.500557	9.097777	fsc
11	FUE	Fuerteventura	Fuerteventura	28.452717	-13.863761	fue
308	FUK	Fukuoka	Fukuoka	33.585942	130.450686	fuk
462	GCI	Guernsey	Guernsey	49.434956	-2.601969	gci
395	GIB	Gibraltar	Gibraltar	36.151219	-5.349664	gib
370	GLA	Glasgow International Airport	Glasgow (GB)	55.871944	-4.433056	gla
456	GND	\N	\N	12.004247	-61.786192	gnd
224	GOA	Genoa	Genoa	44.413333	8.837500	goa
469	GOI	Goa	Goa	15.380833	73.831422	goi
331	GOT	Goteborg Landvetter Apt	Goteborg	57.662836	12.279819	got
201	GPA	Patrai	Patrai	38.151111	21.425556	gpa
606	MDL	Mandalay	Mandalay	\N	\N	mdl
279	GRQ	Groningen	Groningen	53.119720	6.579444	grq
373	GRX	Granada	\N	37.188731	-3.777356	grx
199	GSE	Goteborg City Apt	Goteborg	57.774722	11.870372	gse
159	GVA	Geneva	Geneva	46.238064	6.108950	gva
109	GYD	Baku Heydar Aliyev International Apt	Baku	40.467500	50.046667	gyd
51	HAJ	Hannover	Hannover	52.461056	9.685078	haj
296	HAK	Haikou	Haikou	19.934856	110.458961	hak
57	HAM	Hamburg Airport	Hamburg	53.630389	9.988228	ham
455	HAN	Hanoi	Hanoi	21.221192	105.807178	han
221	HAU	Haugesund	Haugesund	59.345267	5.208364	hau
588	KWL	Guilin	Guilin	\N	\N	kwl
589	NOS	Nosy-Be	Nosy-Be	\N	\N	nos
590	RMF	Marsa Alam	Marsa Alam	\N	\N	rmf
591	CCS	Caracas	Caracas	\N	\N	ccs
579	HYD	Hyderabad Rajiv Gandhi Intl Arpt	Hyderabad	\N	\N	hyd
592	NPE	Napier-Hastings	Napier-Hastings	\N	\N	npe
593	SCL	Santiago (CL)	Santiago (CL)	\N	\N	scl
594	SLJ	Solomon	Solomon	\N	\N	slj
595	DVO	Davao	Davao	\N	\N	dvo
596	DAD	Da Nang	Da Nang	\N	\N	dad
597	KCH	Kuching	Kuching	\N	\N	kch
598	BDO	Bandung	Bandung	\N	\N	bdo
599	LOP	Praya	Praya	\N	\N	lop
600	BKI	Kota Kinabalu	Kota Kinabalu	\N	\N	bki
601	MDC	Manado	Manado	\N	\N	mdc
602	BPN	Balikpapan	Balikpapan	\N	\N	bpn
603	PKU	Pekanbaru	Pekanbaru	\N	\N	pku
604	SRG	Semarang	Semarang	\N	\N	srg
607	JOG	Yogyakarta	Yogyakarta	\N	\N	jog
608	PLM	Palembang	Palembang	\N	\N	plm
609	UPG	Makassar	Makassar	\N	\N	upg
393	ABZ	Aberdeen (GB)	Aberdeen (GB)	57.201944	-2.197778	abz
333	AES	\N	\N	62.560372	6.110164	aes
490	ANR	Antwerp	Antwerp	51.189444	4.460278	anr
187	BTS	Bratislava	Bratislava	48.170167	17.212667	bts
405	CCC	Cayo Coco	Cayo Coco	22.513200	-78.511000	ccc
80	CDG	Paris Charles de Gaulle Apt	Paris	49.012779	2.550000	cdg
375	CLT	Charlotte	\N	35.214000	-80.943139	clt
286	CRV	Crotone	Crotone	38.997225	17.080169	crv
43	CTA	Catania	Catania	37.466781	15.066400	cta
113	DME	Moscow Domodedovo Apt	Moscow	55.408611	37.906111	dme
426	DMK	Bangkok Don Mueang International Arpt	Bangkok	13.912583	100.606750	dmk
495	DOL	Deauville	Deauville	49.365339	0.154306	dol
299	DPS	Denpasar-Bali	Denpasar-Bali	-8.748169	115.167172	dps
382	DRS	Dresden	\N	51.132767	13.767161	drs
244	EIN	Eindhoven Airport	Eindhoven	51.450139	5.374528	ein
30	EWR	Newark Liberty International Apt	New York	40.692500	-74.168667	ewr
108	HAV	Havana	Havana	22.989153	-82.409086	hav
312	HBE	Alexandria Borg el Arab	Alexandria (EG)	30.917669	29.696408	hbe
432	HDY	Hat Yai	Hat Yai	6.933206	100.392975	hdy
114	HEL	Helsinki-Vantaa	Helsinki	60.317222	24.963333	hel
76	HER	Irakleion	Irakleion	35.339719	25.180297	her
294	HGH	Hangzhou	Hangzhou	30.229503	120.434453	hgh
170	HHN	Frankfurt Hahn Airport	Frankfurt	49.948672	7.263892	hhn
53	HKG	Hong Kong International Apt	Hong Kong	22.308919	113.914603	hkg
291	HKT	Phuket	Phuket	8.113200	98.316872	hkt
157	HOG	Holguin	Holguin	20.785589	-76.315108	hog
257	FNI	Nimes Garons Airport	Nimes	43.757444	4.416347	fni
610	BWN	Bandar Seri Begawan	Bandar Seri Begawan	\N	\N	bwn
148	IKA	Tehran Imam Khomeini International Apt	Tehran	35.416111	51.152222	ika
397	INN	Innsbruck	Innsbruck	47.260219	11.343964	inn
402	INV	Inverness	Inverness	57.542500	-4.047500	inv
399	IOM	Isle of Man	Isle of Man	54.083333	-4.623889	iom
152	ISB	Islamabad	Islamabad	33.616653	73.099233	isb
472	IVL	Ivalo	Ivalo	68.607269	27.405328	ivl
131	JED	Jeddah	Jeddah	21.679564	39.156536	jed
394	JER	Jersey	Jersey	49.207947	-2.195508	jer
20	ALC	Alicante Airport	Alicante	38.282169	-0.558156	alc
334	AAL	\N	\N	57.092789	9.849164	aal
219	AAR	Aarhus Tirstrup Airport	Aarhus	56.300017	10.619008	aar
400	ADB	Izmir Adnan Menderes Apt	Izmir	38.292392	27.156953	adb
112	ADD	Addis Ababa	Addis Ababa	8.977889	38.799319	add
238	AGA	Agadir	Agadir	30.381353	-9.546311	aga
6	AGP	Malaga Airport	Malaga	36.674900	-4.499106	agp
132	ALG	Algiers	Algiers	36.691014	3.215408	alg
143	AMM	Amman Queen Alia International Apt	Amman	31.722556	35.993214	amm
324	AOK	Karpathos	Karpathos	35.421408	27.146008	aok
335	ARN	Stockholm Arlanda Apt	Stockholm	59.651944	17.918611	arn
64	ATH	Athens (GR)	Athens (GR)	37.936358	23.944467	ath
387	BRN	Berne Belp	\N	46.914100	7.497153	brn
281	BRQ	Brno	Brno	49.151269	16.694433	brq
24	BRS	Bristol (GB) 00	Bristol (GB) 00	51.382669	-2.719089	brs
82	BRU	Brussels Airport	Brussels	50.901389	4.484444	bru
88	BUD	Budapest	Budapest	47.436933	19.255592	bud
21	BVA	Paris Beauvais-Tille Airport	Paris	49.454444	2.112778	bva
461	BVC	Boa Vista Island	Boa Vista Island	16.136531	-22.888897	bvc
285	BVE	Brive-La-Gaillarde	Brive-La-Gaillarde	45.150833	1.469167	bve
493	BWE	Braunschweig/Wolfsburg	Braunschweig/Wolfsburg	52.319167	10.556111	bwe
179	BZG	Bydgoszcz	Bydgoszcz	53.096800	17.977700	bzg
269	BZR	Beziers	Beziers	43.323522	3.353903	bzr
74	CAG	Cagliari	Cagliari	39.251469	9.054283	cag
474	CMF	Chambery/Aix-Les-Bains	Chambery/Aix-Les-Bains	45.638050	5.880225	cmf
459	EXT	Exeter (GB) 00	Exeter (GB) 00	50.734444	-3.413889	ext
175	FKB	Karlsruhe/Baden-Baden Baden Airpark	Karlsruhe/Baden-Baden	48.779300	8.080480	fkb
392	GNB	Lyon Grenoble-St Geoirs Apt	Lyon	45.362944	5.329375	gnb
54	GRU	Sao Paulo Guarulhos Intl Apt	Sao Paulo	-23.432075	-46.469511	gru
401	HRG	Hurghada	Hurghada	27.178317	33.799436	hrg
466	IAD	Washington Dulles International Apt	Washington	38.944533	-77.455811	iad
48	IBZ	Ibiza	Ibiza	38.872858	1.373117	ibz
142	ICN	Seoul Incheon International Airport	Seoul	37.469075	126.450517	icn
380	IEV	Kiev Zhuliany Intl Apt	\N	50.401694	30.449697	iev
209	CFE	Clermont-Ferrand	Clermont-Ferrand	45.786661	3.169169	cfe
446	CJM	Chumphon	Chumphon	10.711200	99.361706	cjm
151	LUZ	Lublin Airport	Lublin	51.239333	22.714083	luz
3	JFK	New York J F Kennedy International Apt	New York	40.639751	-73.778925	jfk
313	JIK	Ikaria Island	Ikaria Island	37.682717	26.347061	jik
316	JKL	Kalymnos Island	Kalymnos Island	36.963333	26.940556	jkl
77	JMK	Mykonos	Mykonos	37.435128	25.348103	jmk
315	JNX	Naxos Is	Naxos Is	37.080556	25.368056	jnx
321	JSI	Skiathos	Skiathos	39.177100	23.503675	jsi
320	JSY	Syros Island	Syros Island	37.422792	24.950936	jsy
72	JTR	Thira	Thira	36.399169	25.479333	jtr
314	JTY	Astypalaia Island	Astypalaia Island	36.579886	26.375822	jty
475	KAO	Kuusamo	Kuusamo	65.987575	29.239381	kao
59	KBP	Kiev Borispol Intl Apt	Kiev	50.345000	30.894722	kbp
445	KBV	Krabi	Krabi	8.095969	98.988764	kbv
120	KEF	Reykjavik Keflavik International Apt	Reykjavik	63.985000	-22.605556	kef
381	KGD	Kaliningrad	\N	54.890050	20.592633	kgd
126	KGS	Kos	Kos	36.793335	27.091667	kgs
470	KHI	Karachi	Karachi	24.906547	67.160797	khi
214	KIR	Kerry	Kerry	52.180878	-9.523783	kir
319	KIT	Kythira	Kythira	36.274258	23.016978	kit
58	KIV	Chisinau	Chisinau	46.927744	28.930978	kiv
288	KIX	Osaka Kansai International Airport	Osaka	34.434722	135.244167	kix
364	KJA	Krasnoyarsk	\N	56.180000	92.475000	kja
437	KKC	Khon Kaen	Khon Kaen	16.466628	102.783661	kkc
242	KLX	Kalamata	Kalamata	37.068319	22.025525	klx
442	LPT	Lampang	Lampang	18.270933	99.504167	lpt
215	LRH	La Rochelle	La Rochelle	46.179200	-1.195280	lrh
145	LRM	La Romana	La Romana	18.450711	-68.911833	lrm
496	LRT	Lorient	Lorient	47.760555	-3.440000	lrt
70	LTN	London Luton Apt	London (GB)	51.874722	-0.368333	ltn
46	LUX	Luxembourg	Luxembourg	49.626575	6.211517	lux
476	LXR	Luxor	Luxor	25.671028	32.706583	lxr
96	LYS	Lyon St-exupery Apt	Lyon	45.726387	5.090833	lys
306	MAA	Chennai	Chennai	12.994414	80.180517	maa
87	MAD	Madrid Adolfo Suarez-Barajas Apt	Madrid	40.493556	-3.566764	mad
78	MAH	Menorca	Menorca	39.862597	4.218647	mah
4	MAN	Manchester (GB)	Manchester (GB)	53.353744	-2.274950	man
435	MAQ	Mae Sot	Mae Sot	16.699856	98.545056	maq
98	MBA	Mombasa	Mombasa	-4.034833	39.594250	mba
338	MCO	Orlando International Apt	Orlando	28.429394	-81.308994	mco
44	MCT	Muscat	Muscat	23.593278	58.284444	mct
166	MED	Madinah	Madinah	24.553422	39.705061	med
325	LRS	Leros	Leros	37.184903	26.800289	lrs
439	KOP	Nakhon Phanom	Nakhon Phanom	17.383794	104.643022	kop
136	LHE	Lahore	Lahore	31.521564	74.403594	lhe
25	LHR	London Heathrow Apt	London (GB)	51.477500	-0.461389	lhr
155	MBJ	Montego Bay	Montego Bay	18.503717	-77.913358	mbj
177	LIG	Limoges	Limoges	45.862778	1.179444	lig
208	LIL	Lille Lesquin Airport	Lille	50.561942	3.089444	lil
349	LIN	Milan Linate Apt	Milan	45.445103	9.276739	lin
55	LIS	Lisbon	Lisbon	38.781311	-9.135919	lis
485	LJU	Ljubljana	Ljubljana	46.223686	14.457611	lju
129	LMP	Lampedusa	Lampedusa	35.497914	12.618083	lmp
270	LNZ	Linz Blue Danube	Linz	48.233219	14.187511	lnz
434	LOE	Loei	Loei	17.439133	101.722064	loe
241	LPA	Gran Canaria	Gran Canaria	27.931886	-15.386586	lpa
8	LPL	Liverpool	Liverpool	53.333611	-2.849722	lpl
278	LPP	Lappeenranta	Lappeenranta	61.044553	28.144397	lpp
302	MEL	Melbourne Airport	Melbourne (AU)	-37.673333	144.843333	mel
133	MIA	Miami International Apt	Miami	25.793250	-80.290556	mia
487	MID	Merida	Merida	20.936981	-89.657672	mid
105	MIR	Monastir	Monastir	35.758056	10.754722	mir
484	MJT	Mytilini	Mytilini	39.056667	26.598333	mjt
253	MJV	Murcia	Murcia	37.774972	-0.812389	mjv
127	MLA	Malta	Malta	35.857497	14.477500	mla
130	MLE	Male	Male	4.191833	73.529128	mle
355	MLN	Melilla	\N	35.279817	-2.956256	mln
318	MLO	Milos	Milos	36.696111	24.477500	mlo
277	MMX	Malmo Airport	Malmo	55.530193	13.371639	mmx
191	MPL	Montpellier Mediterranee Apt	Montpellier	43.576194	3.963014	mpl
147	MRS	Marseille Provence Apt	Marseille	43.435555	5.213611	mrs
97	MRU	Mauritius	Mauritius	-20.430235	57.683600	mru
144	MSQ	Minsk International Apt	Minsk	53.882469	28.030731	msq
198	MST	Maastricht/Aachen	Maastricht/Aachen	50.911658	5.770144	mst
111	MUC	Munich International Airport	Munich	48.353783	11.786086	muc
35	MXP	Milan Malpensa Apt	Milan	45.630606	8.728111	mxp
71	NAP	Naples Capodichino Apt	Naples (IT)	40.886033	14.290781	nap
403	NBE	Enfidha	Enfidha	36.075833	10.438611	nbe
16	NCE	Nice	Nice	43.658411	7.215872	nce
264	NCL	Newcastle	Newcastle (GB)	55.037500	-1.691667	ncl
239	NDR	Nador	Nador	34.988800	-3.028210	ndr
451	NKG	Nanjing	Nanjing	31.742042	118.862025	nkg
441	NNT	Nan	Nan	18.807914	100.783419	nnt
232	NOC	Knock	Knock	53.910297	-8.818492	noc
464	NQY	Newquay	Newquay	50.440558	-4.995408	nqy
236	NRN	Duesseldorf Weeze Airport	Duesseldorf	51.602222	6.141944	nrn
39	NRT	Tokyo Narita Intl	Tokyo	35.764722	140.386389	nrt
431	NST	Nakhon Si Thammarat	Nakhon Si Thammarat	8.539617	99.944725	nst
116	NTE	Nantes Atlantique Airport	Nantes	47.153189	-1.610725	nte
266	NUE	Nuremberg	Nuremberg	49.498700	11.066897	nue
174	NYO	Stockholm Skavsta Airport	Stockholm	58.788636	16.912189	nyo
73	OLB	Olbia	Olbia	40.898661	9.517628	olb
160	OMO	Mostar	Mostar	43.282900	17.845878	omo
450	OOL	Gold Coast	Gold Coast	-28.164444	153.504722	ool
95	OPO	Porto	Porto	41.248055	-8.681389	opo
223	ORK	Cork	Cork	51.841269	-8.491111	ork
350	ORN	Oran Ahmed Ben Bella Apt	\N	35.623858	-0.621183	orn
348	ORY	Paris Orly Apt	Paris	48.725278	2.359444	ory
217	OSI	Osijek	Osijek	45.462667	18.810156	osi
123	OSL	Oslo Gardermoen Airport	Oslo	60.193917	11.100361	osl
284	OSR	Ostrava	Ostrava	49.696292	18.111053	osr
52	OTP	Bucharest Henri Coanda Apt	Bucharest	44.572161	26.102178	otp
204	OUD	Oujda	Oujda	34.787150	-1.923986	oud
379	OVB	Novosibirsk	\N	55.012622	82.650656	ovb
352	OVD	Asturias	\N	43.563567	-6.034622	ovd
323	PAS	Paros	Paros	37.010278	25.127778	pas
494	PDL	Ponta Delgada	Ponta Delgada	37.741184	-25.697870	pdl
276	PDV	Plovdiv	Plovdiv	42.067806	24.850833	pdv
263	PEG	Perugia	Perugia	43.095906	12.513222	peg
444	PRH	Phrae	Phrae	18.132169	100.164664	prh
184	PSA	Pisa	Pisa	43.683917	10.392750	psa
225	PSR	Pescara	Pescara	42.431656	14.181067	psr
468	PUJ	Punta Cana	Punta Cana	18.567367	-68.363431	puj
230	PUY	Pula	Pula	44.893533	13.922192	puy
42	PVG	Shanghai Pudong International Apt	Shanghai	31.143378	121.805214	pvg
479	PVK	Preveza/Lefkada	Preveza/Lefkada	38.925467	20.765311	pvk
477	PVR	Puerto Vallarta	Puerto Vallarta	20.680083	-105.254167	pvr
489	PXO	Porto Santo	Porto Santo	33.073386	-16.349975	pxo
102	RAK	Marrakech	Marrakech	31.606886	-8.036300	rak
205	RBA	Rabat	Rabat	34.051467	-6.751519	rba
261	RDZ	Rodez	Rodez	44.407869	2.482672	rdz
310	REP	Siem Reap	Siem Reap	13.410666	103.812840	rep
171	REU	Reus	Reus	41.147392	1.167172	reu
307	RGN	Yangon	Yangon	16.907305	96.133222	rgn
367	RGS	Burgos	\N	42.357628	-3.620764	rgs
125	RHO	Rhodes	Rhodes	36.405419	28.086192	rho
121	RIX	Riga	Riga	56.923611	23.971111	rix
273	RJK	Rijeka	Rijeka	45.216889	14.570267	rjk
272	RNS	Rennes St Jacques Airport	Rennes	48.069508	-1.734794	rns
449	ROI	Roi Et	Roi Et	16.116761	103.773797	roi
372	ROV	Rostov	\N	47.258208	39.818089	rov
353	RTM	Rotterdam Apt	\N	51.956944	4.437222	rtm
60	RUH	Riyadh King Khalid Intl	Riyadh	24.957640	46.698776	ruh
391	RVN	Rovaniemi	Rovaniemi	66.564822	25.830411	rvn
220	RYG	Oslo Moss-rygge Airport	Oslo	59.378933	10.785389	ryg
262	RZE	Rzeszow	Rzeszow	50.109958	22.019000	rze
124	SAW	Istanbul Sabiha Gokcen Apt	Istanbul	40.898553	29.309219	saw
182	SCQ	Santiago de Compostela	Santiago de Compostela	42.896333	-8.415144	scq
492	SCU	Santiago de Cuba	Santiago de Cuba	19.969769	-75.835414	scu
195	SDR	Santander	Santander	43.427064	-3.820006	sdr
376	SEN	London Southend Apt	\N	51.571389	0.695556	sen
478	SFB	Orlando Sanford International Airport	Orlando	28.777639	-81.237489	sfb
89	SFO	San Francisco	San Francisco	37.618972	-122.374889	sfo
287	SFT	Skelleftea	Skelleftea	64.624772	21.076892	sft
292	SGN	Ho Chi Minh City	Ho Chi Minh City	10.818797	106.651856	sgn
453	SHE	Shenyang	Shenyang	41.382400	123.290100	she
404	SID	Sal Island	Sal Island	16.741389	-22.949444	sid
47	SIN	Singapore Changi Apt	Singapore	1.350189	103.994433	sin
200	SKG	Thessaloniki	Thessaloniki	40.519725	22.970950	skg
368	SLM	Salamanca	\N	40.952117	-5.501986	slm
1	SNN	Shannon	Shannon	52.701978	-8.924817	snn
440	SNO	Sakon Nakhon	Sakon Nakhon	17.195142	104.118625	sno
140	SNU	Santa Clara	Santa Clara	22.492192	-79.943611	snu
94	SOF	Sofia	Sofia	42.695194	23.406167	sof
460	SOU	Southampton	Southampton	50.950261	-1.356803	sou
357	SPC	Santa Cruz de la Palma	Santa Cruz de la Palma	28.626478	-17.755611	spc
85	SPU	Split	Split	43.538944	16.297964	spu
156	SSH	Sharm El-Sheikh	Sharm El-Sheikh	27.977222	34.394722	ssh
7	STN	London Stansted Apt	London (GB)	51.885000	0.235000	stn
106	STR	Stuttgart Airport	Stuttgart	48.689878	9.221964	str
300	SUB	Surabaya	Surabaya	-7.379831	112.786858	sub
67	SUF	Lamezia Terme	Lamezia Terme	38.905394	16.242269	suf
329	SVG	Stavanger	Stavanger	58.876778	5.637856	svg
61	SVO	Moscow Sheremetyevo International Apt	Moscow	55.972642	37.414589	svo
190	SVQ	Sevilla Airport	Sevilla	37.418000	-5.893106	svq
374	SVX	Yekaterinburg	\N	56.743108	60.802728	svx
311	SWA	Shantou	Shantou	23.400000	116.683000	swa
240	SXB	Strasbourg	Strasbourg	48.538319	7.628233	sxb
303	SYD	Sydney Kingsford Smith Apt	Sydney (AU)	-33.946111	151.177222	syd
274	SZG	Salzburg W A Mozart	Salzburg	47.793304	13.004333	szg
183	SZZ	Szczecin	Szczecin	53.584731	14.902206	szz
457	TAB	Tobago	Tobago	11.149658	-60.832194	tab
452	TAO	Qingdao	Qingdao	36.266108	120.374436	tao
154	TAS	Tashkent	Tashkent	41.257861	69.281186	tas
282	TFN	Tenerife Norte	Tenerife	28.482653	-16.341536	tfn
34	TFS	Tenerife Sur Apt	Tenerife	28.044475	-16.572489	tfs
268	TGD	Podgorica	Podgorica	42.359392	19.251894	tgd
385	TGM	Tirgu Mures	\N	46.467714	24.412525	tgm
65	TIA	Tirana	Tirana	41.414742	19.720561	tia
180	POZ	Poznan Lawica Apt	Poznan	52.421031	16.826325	poz
309	PEN	Penang	Penang	5.297139	100.276864	pen
298	PER	Perth	Perth	-31.940278	115.966944	per
172	PFO	Paphos	Paphos	34.718039	32.485731	pfo
229	PGF	Perpignan	Perpignan	42.740442	2.870667	pgf
33	PHL	Philadelphia International Apt	Philadelphia	39.871944	-75.241139	phl
443	PHS	Phitsanulok	Phitsanulok	16.782939	100.279122	phs
15	PHX	Phoenix Sky Harbor Intl Apt	Phoenix	33.434278	-112.011583	phx
27	PIS	Poitiers Biard Airport	Poitiers	46.587745	0.306666	pis
422	PIT	Pittsburgh International Apt	Pittsburgh	40.491467	-80.232872	pit
260	PMF	Milan Parma Apt	Milan	44.824483	10.296367	pmf
26	PMI	Palma de Mallorca	Palma de Mallorca	39.553610	2.727778	pmi
68	PMO	Palermo	Palermo	38.175958	13.091019	pmo
297	PNH	Phnom Penh	Phnom Penh	11.546556	104.844139	pnh
90	PNL	Pantelleria	Pantelleria	36.816519	11.968864	pnl
424	PNQ	Pune	Pune	18.582111	73.919697	pnq
465	POP	Puerto Plata	Puerto Plata	19.757900	-70.570033	pop
41	PRG	Prague Ruzyne	Prague	50.100833	14.260000	prg
218	ZAD	Zadar	Zadar	44.108269	15.346697	zad
361	ZAG	Zagreb	\N	45.742931	16.068778	zag
185	ZAZ	Zaragoza Airport	Zaragoza	41.666242	-1.041553	zaz
141	ZNZ	Zanzibar	Zanzibar	-6.222025	39.224886	znz
18	ZRH	Zurich Airport	Zurich	47.464722	8.549167	zrh
128	ZTH	Zakinthos Island	Zakinthos Island	37.750853	20.884250	zth
347	TJM	Tyumen	\N	57.189567	65.324300	tjm
228	TLL	Tallinn	Tallinn	59.413317	24.832844	tll
231	TLN	Toulon/Hyeres	Toulon/Hyeres	43.097300	6.146030	tln
158	TLS	Toulouse	Toulouse	43.629075	1.363819	tls
56	TLV	Tel Aviv-yafo Ben Gurion International	Tel Aviv-yafo	32.011389	34.886667	tlv
252	TMP	Tampere	Tampere	61.414147	23.604392	tmp
428	UTH	Udon Thani	Udon Thani	17.386436	102.788247	uth
340	UVF	Hewanorra Intl	St Lucia	13.733194	-60.952597	uvf
483	VAR	Varna	Varna	43.232072	27.825106	var
346	VCE	Venice Marco Polo Apt	Venice	45.505278	12.351944	vce
491	VDA	Ovda	Ovda	29.940250	34.935850	vda
371	VGO	Vigo	\N	42.231800	-8.626775	vgo
122	WAW	Warsaw Frederic Chopin	Warsaw	52.165750	20.967122	waw
267	VLL	Valladolid Airport	Valladolid	41.706111	-4.851944	vll
247	TNG	Tangier	Tangier	35.726917	-5.916889	tng
332	TOS	\N	\N	69.683333	18.918919	tos
289	TPE	Taipei Taiwan Taoyuan International Apt	Taipei	25.077731	121.232822	tpe
196	TPS	Trapani	Trapani	37.911403	12.487961	tps
330	TRD	\N	\N	63.457556	10.924250	trd
250	TRF	Oslo Sandefjord-Torp Arpt	Oslo	59.186703	10.258628	trf
233	TRN	Turin Caselle Airport	Turin	45.200761	7.649631	trn
178	TRS	Trieste	Trieste	45.827500	13.472222	trs
222	TSF	Venice Treviso/Sant'Angelo Apt	Venice	45.648400	12.194422	tsf
448	TSN	Tianjin	Tianjin	39.124353	117.346183	tsn
49	VIE	Vienna International	Vienna	48.110278	16.569722	vie
137	VKO	Moscow Vnukovo International Apt	Moscow	55.591531	37.261486	vko
162	VLC	Valencia Airport	Valencia (ES)	39.489314	-0.481625	vlc
212	VNO	Vilnius	Vilnius	54.634133	25.285767	vno
265	VOL	Volos	Volos	39.219619	22.794339	vol
471	VRA	Juan G Gomez Intl	Varadero	23.034445	-81.435278	vra
389	TSR	Timisoara	\N	45.809861	21.337861	tsr
433	TST	Trang	Trang	7.508744	99.616578	tst
189	TUF	Tours Val de Loire Airport	Tours	47.432222	0.727606	tuf
103	TUN	Tunis	Tunis	36.851033	10.227217	tun
93	TXL	Berlin Tegel Apt	Berlin	52.559686	13.287711	txl
427	UBP	Ubon Ratchathani	Ubon Ratchathani	15.251278	104.870231	ubp
365	UFA	Ufa	\N	54.557511	55.874417	ufa
165	UGC	Urgench	Urgench	41.584300	60.641700	ugc
436	UNN	Ranong	Ranong	9.777622	98.585483	unn
359	VRN	Verona Villafranca Airport	Verona	45.395706	10.888533	vrn
210	VST	Stockholm Vasteras Apt	Stockholm	59.589444	16.633611	vst
283	VXO	Vaxjo	Vaxjo	56.929144	14.727994	vxo
32	WMI	Nowy Dwor Mazowiecki	Nowy Dwor Mazowiecki	52.451111	20.651667	wmi
28	WRO	Wroclaw	Wroclaw	51.102683	16.885836	wro
237	XCR	Paris Chalons-Vatry Airport	Paris	48.776072	4.184492	xcr
173	XRY	Jerez	Jerez	36.744622	-6.060111	xry
317	YUL	Montreal Pierre Elliott Trudeau Int Apt	Montreal	45.470556	-73.740833	yul
480	YVR	Vancouver International Apt	Vancouver	49.193889	-123.184444	yvr
481	YYC	Calgary	Calgary	51.113888	-114.020278	yyc
17	YYZ	Lester B Pearson Intl	Toronto	43.677223	-79.630556	yyz
447	URT	Surat Thani	Surat Thani	9.132500	99.135556	urt
\.


--
-- Name: airports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('airports_id_seq', 610, true);


--
-- Name: hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hosts_id_seq', 10, true);


--
-- Data for Name: interline_cxr_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY interline_cxr_rules (id, report_key_id, patterns, match_on, rule_kind, active, sequence, description, created_at, updated_at) FROM stdin;
2	2	{.*}	id	whitelisted	t	0	\N	2014-10-11 16:20:44.00087	2014-10-11 16:21:58.529609
1	2	{"^(\\\\w{3})?(?<!BOM|DEL|MAA)(BOM|DEL|MAA)$","^(BOM|DEL|MAA)(?!BOM|DEL|MAA)(\\\\w{3})$"}	market	whitelist	t	0	\N	2014-10-10 18:30:27.739	2014-10-11 17:16:12.709888
\.


--
-- Name: interline_cxr_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('interline_cxr_rules_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

