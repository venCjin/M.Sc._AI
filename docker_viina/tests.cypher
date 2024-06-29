// --------------------------------------------
// event:
//     - id_1pd
//     - id_e (first)
//     - date
//     - time
//     - language: ua-Ukrainian, ru-Russian
//     - title
//     - url
//     - geonameid

// actor:
// type:
//     - name
//     - description

// place:
//     - name (asciname)
//     - geonameid
// --------------------------------------------

// -----------------
MATCH (n:Event)
DETACH DELETE n;

MATCH (n)
DETACH DELETE n;
// -----------------

MERGE (a_rus: Actor {name:'a_rus', description: 'Event initiated by Russian or Russian-aligned armed forces'});
MERGE (a_ukr: Actor {name:'a_ukr', description: 'Event initiated by Ukrainian or Ukrainian-aligned armed forces'});
MERGE (a_civ: Actor {name:'a_civ', description: 'Event initiated by civilians'});
MERGE (a_other: Actor {name:'a_other', description: 'Event initiated by a third party (e.g. U.S., EU, Red Cross)'});

MERGE (t_mil: Type {name:'t_mil', description: 'Event is about war/military operations'});
MERGE (t_loc: Type {name:'t_loc', description: 'Event report includes reference to specific location'});
MERGE (t_san: Type {name:'t_san', description: 'Event report mentions economic sanctions imposed on Russia'});
MERGE (t_aad: Type {name:'t_aad', description: 'Anti-air defense, Buk, shoulder-fired missiles (Igla, Strela, Stinger)'});
MERGE (t_airstrike: Type {name:'t_airstrike', description: 'Air strike, strategic bombing, helicopter strike'});
MERGE (t_airalert: Type {name:'t_airalert', description: 'Air raid siren/alert'});
MERGE (t_armor: Type {name:'t_armor', description: 'Tank battle or assault'});
MERGE (t_arrest: Type {name:'t_arrest', description: 'Arrest by security services or detention of prisoners of war'});
MERGE (t_artillery: Type {name:'t_artillery', description: 'Shelling by field artillery, howitzer, mortar, or rockets like Grad/BM-21, Uragan/BM-27, other Multiple Launch Rocket System (MRLS)'});
MERGE (t_control: Type {name:'t_control', description: 'Establishment/claim of territorial control over population center'});
MERGE (t_firefight: Type {name:'t_firefight', description: 'Any exchange of gunfire with handguns, semi-automatic rifles, automatic rifles, machine guns, rocket-propelled grenades (RPGs)'});
MERGE (t_ied: Type {name:'t_ied', description: 'Improvised explosive device, roadside bomb, landmine, car bomb, explosion'});
MERGE (t_raid: Type {name:'t_raid', description: 'Assault/attack by paratroopers or special forces, usually followed by a retreat'});
MERGE (t_occupy: Type {name:'t_occupy', description: 'Occupation of territory or building'});
MERGE (t_property: Type {name:'t_property', description: 'Destruction of property or infrastructure'});
MERGE (t_cyber: Type {name:'t_cyber', description: 'Cyber operations, including DDOS attacks, website defacement'});
MERGE (t_hospital: Type {name:'t_hospital', description: 'Attacks on hospitals and humanitarian convoys'});
MERGE (t_milcas: Type {name:'t_milcas', description: 'Event report mentions military casualties'});
MERGE (t_civcas: Type {name:'t_civcas', description: 'Event report mentions civilian casualties'});

CREATE CONSTRAINT actor_name IF NOT EXISTS FOR (a:Actor) REQUIRE (a.name) IS UNIQUE;
CREATE CONSTRAINT type_name IF NOT EXISTS FOR (t:Type) REQUIRE (t.name) IS UNIQUE;
CREATE CONSTRAINT event_id IF NOT EXISTS FOR (e:Event) REQUIRE (e.id_e) IS UNIQUE;

// :auto LOAD CSV WITH HEADERS FROM "file:///event_1pd_latest_2024.csv" AS row
// :auto 
LOAD CSV WITH HEADERS FROM "file:///1pd.csv" AS row
CALL {
    WITH row
    MERGE 
        (e: Event {
            id_1pd: row.event_id_1pd
        })

    FOREACH (tt IN split(replace(replace(replace(replace(replace(row.types,'[', ''),']', ''),',', ''),'"', ''),'\'', ''), ' ') |
        FOREACH (_ IN CASE WHEN tt <> "" THEN [true] ELSE [] END |
            MERGE (t_node:Type {name:tt})
            MERGE (e)-[:category]->(t_node)
        )
    )

    // cypher 'if' hack https://gist.github.com/nandosola/ebe2ced123e05a79e238edd6ec81fee5#conditional-data-creation
    FOREACH (_ IN CASE WHEN row.actors <> "[]" THEN [true] ELSE [] END |
        FOREACH (aa IN split(replace(replace(replace(replace(replace(row.actors,'[', ''),']', ''),',', ''),'"', ''),'\'', ''), ' ') |
            MERGE (a_node:Actor {name:aa})
            MERGE (e)-[:initiated_by]->(a_node)
        )
    )
}
IN TRANSACTIONS OF 1000 ROWS;





// :auto LOAD CSV WITH HEADERS FROM "file:///event_info_latest_2024.csv" AS row
// :auto 
LOAD CSV WITH HEADERS FROM "file:///test_info.csv" AS row
CALL {
    WITH row

    MATCH 
        (e: Event {
            id_1pd: row.event_id_1pd
        })
    SET 
        e.date = row.date,
        e.time = row.time,
        e.title = row.text,
        e.url = row.url

    FOREACH (_ IN case when row.lang = 'ua' then [1] else [] end|
        // MERGE (e: Event {
        //     id_1pd: row.event_id_1pd,language: 'Ukrainian'})
        SET 
            e.language = 'Ukrainian'
    )
    FOREACH (_ IN case when row.lang = 'ru' then [1] else [] end|
        // MERGE (e: Event {
        //     id_1pd: row.event_id_1pd,language: 'Russian'})
        SET 
            e.language = 'Russian'
    )

}
IN TRANSACTIONS OF 1000 ROWS;







