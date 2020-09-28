using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Skinner : MonoBehaviour
{
    public GameObject tile;
    public SkinEffect[] effects = new SkinEffect[1];

    private void Awake()
    {
        // 타일링
        for (int x = -7; x <= 7; x++)
        {
            for (int y = -12; y <= 12
                ; y++)
            {
                var newTile = Instantiate(tile, transform);
                newTile.name = "tile";
                newTile.transform.position = new Vector3(x, y, -1);
            }
        }
    }

    private void Update()
    {
        foreach (var eff in effects)
        {
            eff.EffectUpdate();
        }
    }
}
