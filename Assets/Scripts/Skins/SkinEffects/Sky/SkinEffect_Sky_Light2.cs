using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkinEffect_Sky_Light2 : SkinEffect_Light
{
    public override void EffectUpdateDecision()
    {
        time += Time.deltaTime;

        if (time <= 3) // 축소
        {
            float x = time * time / 9;
            light.intensity = 20 - x * 10;
        }
        else if (time <= 6)
        {
            float x = (time - 3) * (time - 3) / 9;
            light.intensity = 10 + x * 10;
        }
        else
        {
            time = 0;
        }
    }
}