using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.SerializableAttribute]
public class customerStruct {
    public List<string> a;
    public Color c;
    public AnimationCurve curve;
    public Gradient g;
}

public class NewBehaviourScript : MonoBehaviour {
    public List<string> a;
    public Color c;
    public AnimationCurve curve;
    public Gradient g;
    public customerStruct cus;

    // stop other people in unity see variable
    [HideInInspector]
    public int bb;

    // only the people in unity can access this value other class cannot
    [SerializeField]
    private bool pp;

    // Use this for initialization
    void Start () {
        Debug.Log(a.Count);
	}
	
	// Update is called once per frame
	void Update () {
        Debug.Log("Hello world");
        GameObject.FindWithTag("npc");
	}
}
